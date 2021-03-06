import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

final storage = Storage();

class Storage {
  void init() {
    if (prefs == null) {
      initSharedPreferences().then((value) => print('初始化kv存储'));
    }
  }

  int getInt(String key) {
    return prefs.getInt(key);
  }

  void setInt(String key, int value) {
    prefs.setInt(key, value);
  }

  String getString(String key) {
    return prefs.getString(key);
  }

  void setString(String key, value) {
    prefs.setString(key, value);
  }

  bool getBool(String key) {
    Set<String> keys = prefs.getKeys();
    if (keys.contains(key)) {
      return prefs.getBool(key);
    }
    return false;
  }

  void setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  void remove(String key) {
    prefs.remove(key);
  }
}

Future<void> initSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}
