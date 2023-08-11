import 'package:shared_preferences/shared_preferences.dart';

class HistoryPreferences {
  static late SharedPreferences _preferences;

  static const _keyList = 'list';
  static const _keyText = 'text';
  static const _keyRes = 'res';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setList(List<String> list) async {
    await _preferences.setStringList(_keyList, list);
  }

  static List<String>? getList() => _preferences.getStringList(_keyList);

  static Future setText(String textField) async {
    await _preferences.setString(_keyText, textField);
  }

  static String? getText() => _preferences.getString(_keyText);

  static Future setRes(String res) async {
    await _preferences.setString(_keyRes, res);
  }

  static String? getRes() => _preferences.getString(_keyRes);
}
