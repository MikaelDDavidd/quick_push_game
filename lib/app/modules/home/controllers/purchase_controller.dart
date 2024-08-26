// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:game/app/data/storage_keys.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:game/app/widgets/shop_items.dart';

class PurchaseController extends GetxController {
  //
  List<OnPurchaseListener> purchaseListener = [];
  String removeAdsProductId = "remove_ads";

  @override
  Future<void> onInit() async {
    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    purchaseUpdated.listen(
      (purchaseDetailsList) {
        print("atualizando");
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {},
      onError: (error) {
        // handle error here.
      },
    );
    checkShopItems();
    super.onInit();
  }

  void checkShopItems() async {
    String themesPurchasedIDsString = GetStorage().read(StorageKeys.themesPurchasedIdsKey) ?? "[]";
    List<String> themesPurchasedIDs = List<String>.from(jsonDecode(themesPurchasedIDsString));
    print("products size comprados: ${themesPurchasedIDs}");
    themesPurchasedIDs.forEach((id) {
      var i = 0;
      for (var item in ShopItem.shopItems) {
        if (item.productId == id) {
          ShopItem.shopItems[i].isItemPurchased = true;
        }
        i++;
      }
    });

    Set<String> productsIds = {};
    for (var item in ShopItem.shopItems) {
      productsIds.add(item.productId);
    }
    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(productsIds);
    print("products size: ${response.productDetails.length}");
    if (response.productDetails.isNotEmpty) {
      for (var product in response.productDetails) {
        int itemIndex = ShopItem.shopItems.indexWhere((e) => e.productId == product.id);
        if (itemIndex >= 0) {
          ShopItem.shopItems[itemIndex].itemRealCashPrice = product.price;
          ShopItem.shopItems[itemIndex].productDetails = product;
        }
      }
    }
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    _checkIfIsThemePurchase(purchaseDetailsList);
    _checkIfIsRemoveAdsPurchased(purchaseDetailsList);
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      for (var listener in purchaseListener) {
        if (listener.id == purchaseDetails.productID) {
          listener.listener(purchaseDetails.status);
        }
      }
      if (purchaseDetails.status != PurchaseStatus.pending) {
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  void purchaseRemoveAds(Function(PurchaseStatus status) listener) {
    purchaseShopItem(removeAdsProductId, listener);
  }

  void purchaseShopItem(String productId, Function(PurchaseStatus status) listener) async {
    var thisListener = OnPurchaseListener(
      id: productId,
      listener: (status) {
        listener(status);
      },
    );
    purchaseListener.add(thisListener);
    int itemIndex = ShopItem.shopItems.indexWhere((e) => e.productId == productId);
    var productDetails = ShopItem.shopItems[itemIndex].productDetails;

    if (productDetails != null) {
      print("passou");
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
      InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    } else {
      final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(<String>{productId});
      if (response.productDetails.isNotEmpty) {
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: response.productDetails.first);
        InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
      } else {
        listener(PurchaseStatus.error);
      }
    }
  }

  void _checkIfIsRemoveAdsPurchased(purchaseDetailsList) {
    bool removeAdsWasPurchased = false;
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) {
      if (purchaseDetails.productID == removeAdsProductId) {
        if (purchaseDetails.status == PurchaseStatus.purchased || purchaseDetails.status == PurchaseStatus.restored) {
          GetStorage().write(StorageKeys.removeAdsPurchasedKey, true);
          removeAdsWasPurchased = true;
        }
      }
    });
    if (!removeAdsWasPurchased) {
      GetStorage().write(StorageKeys.removeAdsPurchasedKey, false);
    }
  }

  void _checkIfIsThemePurchase(purchaseDetailsList) {
    List<String> themesPurchaseIDs = [];
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) {
      print("compras size: ${purchaseDetails.productID}");
      var i = 0;
      for (var item in ShopItem.shopItems) {
        if (item.productId == purchaseDetails.productID) {
          if (purchaseDetails.status == PurchaseStatus.purchased || purchaseDetails.status == PurchaseStatus.restored) {
            themesPurchaseIDs.add(item.productId);
            ShopItem.shopItems[i].isItemPurchased = true;
          } else if (purchaseDetails.status == PurchaseStatus.pending) {
            ShopItem.shopItems[i].isPending = true;
            print("is pedding xxxx");
          }
        }
        i++;
      }
    });
    String themesPurchased = jsonEncode(themesPurchaseIDs);
    print("compras size: ${themesPurchased}");
    GetStorage().write(StorageKeys.themesPurchasedIdsKey, themesPurchased);
  }
}

class OnPurchaseListener {
  String id;
  Function(PurchaseStatus status) listener;
  OnPurchaseListener({
    required this.id,
    required this.listener,
  });
}
