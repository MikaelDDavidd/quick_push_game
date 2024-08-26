// AppStrings.dart

import 'package:game/app/data/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class AppStrings {
  static String _getStringByLanguage(String englishString, String portugueseString) {
    var currentLanguage = GetStorage().read(StorageKeys.languageKey) ?? 'Português';

    if (currentLanguage == 'Português') {
      return portugueseString;
    } else {
      return englishString;
    }
  }

  static String get playAgainsString => _getStringByLanguage('PLAY AGAIN', 'JOGAR NOVAMENTE');
  static String get itemBoughtString => _getStringByLanguage('PURCHASED SUCESSFULLY!', 'COMPRA REALIZADA COM SUCESSO!');
  static String get itemBoughtPendingString=> _getStringByLanguage('YOUR PURCHASE IS PENDING!', 'SUA COMPRA ESTÁ PENDENTE!');
  static String get itemBoughtErrorString => _getStringByLanguage('PURCHASE ERROR', 'FALHA NA COMPRA');
  static String get homeString => _getStringByLanguage('HOME', 'INÍCIO');
  static String get noString => _getStringByLanguage('NO', 'NÃO');
  static String get yesString => _getStringByLanguage('YES', 'SIM');
  static String get exitString => _getStringByLanguage('EXIT', 'SAIR');
  static String get buyItem => _getStringByLanguage('BUY ITEM', 'COMPRAR ITEM');
  static String get buyString => _getStringByLanguage('BUY', 'COMPRAR');
  static String get cancelString => _getStringByLanguage('CANCEL', 'CANCELAR');
  static String get exitQuestionString => _getStringByLanguage('do you really quit the game?', 'tem certeza?');
  static String get restartQuestionString => _getStringByLanguage('do you really restart the game?', 'tem certeza?');
  static String get restartGameString => _getStringByLanguage('RESTART GAME', 'REINICIAR JOGO');
  static String get watchAdsString => _getStringByLanguage('Watch Ads', 'Assitir Ads');
  static String get removeAdsString => _getStringByLanguage('Remove Ads?', 'Remover Anúncios?');
  static String get modesString => _getStringByLanguage('Modes', 'Modos');
  static String get classicModeString => _getStringByLanguage('Classic', 'Clássico');
  static String get scoreModeString => _getStringByLanguage('Score', 'Pontuação');
  static String get memoryModeString => _getStringByLanguage('Memory', 'Memória');
  static String get gameNameString => _getStringByLanguage('Quick Push', 'Quick Push');
  static String get playString => _getStringByLanguage('Play', 'Jogar');
  static String get backString => _getStringByLanguage('Back', 'Voltar');
  static String get retryString => _getStringByLanguage('Retry', 'Reconectar');
  static String get settingsString => _getStringByLanguage('Settings', 'Configurações');
  static String get musicString => _getStringByLanguage('Music', 'Música');
  static String get songString => _getStringByLanguage('Song', 'Sons');
  static String get languageString => _getStringByLanguage('Language', 'Idioma');
}
