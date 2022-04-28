class Config {
  /* Replace your sire url and api keys */

  //String url = 'https://www.delitemeats.com';
  //String consumerKey = 'ck_f1926fe9ed753440f1a83770270efa899af941f0';
  //String consumerSecret = 'cs_c0ecf476ae5b95c278339d417edd4c95ca62dc56';
  //String mapApiKey = 'AIzaSyAeq1yJT_dPqlIRtos-QWNaWTIC0HUuc4';

  String url = 'https://dermanninger.at';
  String consumerKey = 'ck_a435e50481e38ac9685840709f73107bcc2ccff1';
  String consumerSecret = 'cs_1f44081186ab8aa2ca0f60c751287a35106701fd';
  String mapApiKey = 'AIzaSyAeq1yJT_dPqlIRtos-QWNaWTIC0HUuc4';

//  String url = 'https://www.thegiftmela.com';
  //String consumerKey = 'ck_db459bb2d317a9e3a735a9957eaaf9b37d169847';
  //String consumerSecret = 'cs_a63bf9b2304991d73b4f7ce4712f4e4a6148618f';
  //String mapApiKey = 'AIzaSyAeq1yJT_dPqlIRtos-QWNaWTIC0HUuc4';

  //String url = 'https://www.jdshopping.world';
  //String consumerKey = 'ck_a789cbcf6838acc13594d17eeadefb8ffa1ce0cd';
  //String consumerSecret = 'cs_11a22efb26693a603cda455eaaa3b307338326e6';
  //String mapApiKey = 'AIzaSyAeq1yJT_dPqlIRtos-QWNaWTIC0HUuc4';

  static Config _singleton = new Config._internal();

  factory Config() {
    return _singleton;
  }

  Config._internal();

  Map<String, dynamic> appConfig = Map<String, dynamic>();

  Config loadFromMap(Map<String, dynamic> map) {
    appConfig.addAll(map);
    return _singleton;
  }

  dynamic get(String key) => appConfig[key];

  bool getBool(String key) => appConfig[key];

  int getInt(String key) => appConfig[key];

  double getDouble(String key) => appConfig[key];

  String getString(String key) => appConfig[key];

  void clear() => appConfig.clear();

  @Deprecated("use updateValue instead")
  void setValue(key, value) => value.runtimeType != appConfig[key].runtimeType
      ? throw ("wrong type")
      : appConfig.update(key, (dynamic) => value);

  void updateValue(String key, dynamic value) {
    if (appConfig[key] != null &&
        value.runtimeType != appConfig[key].runtimeType) {
      throw ("The persistent type of ${appConfig[key].runtimeType} does not match the given type ${value.runtimeType}");
    }
    appConfig.update(key, (dynamic) => value);
  }

  void addValue(String key, dynamic value) =>
      appConfig.putIfAbsent(key, () => value);

  add(Map<String, dynamic> map) => appConfig.addAll(map);
}
