import 'package:shared_preferences/shared_preferences.dart';
import 'package:xplatsurveydemo/service/const.dart';

class Persistence {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  static List<String> getStringList(String key) {
    return _prefsInstance.getStringList(key) ?? List<String>();
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs?.setStringList(key, value) ?? Future.value(false);
  }

  static Future<bool> addSurveySeen(int surveyId) {
    List<String> surveysSeen = getStringList(SURVEYS_SEEN) ?? List<String>();
    if(surveysSeen.contains(surveyId.toString())) {
      return Future.value(true);
    }
    surveysSeen.add(surveyId.toString());
    return setStringList(SURVEYS_SEEN, surveysSeen);
  }

  static Future<bool> clear() async {
    var prefs = await _instance;
    return prefs?.clear() ?? Future.value(false);
  }
}