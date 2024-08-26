import 'package:game/app/data/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class AppValues {
  int themIndexValue = GetStorage().read(StorageKeys.themeKey) ?? 0;
  int popCoinValues = GetStorage().read(StorageKeys.popCoinKey) ?? 0;
  bool isAdsRemovedValues = GetStorage().read(StorageKeys.isAdsRemovedKey) ?? false;
}
