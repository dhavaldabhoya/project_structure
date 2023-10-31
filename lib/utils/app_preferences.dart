import 'global_variables.dart';

class AppPreferences {

  static Future<void> setToken ({required String token}) async {
    pref!.setString(PreferencesString.token, token);
  }
  static Future<void> setUserId ({required int userID}) async {
    pref!.setInt(PreferencesString.userID, userID);
  }
  static Future<void> setUserName ({required String userName}) async {
    pref!.setString(PreferencesString.userName, userName);
  }
  static Future<void> setUserEmail ({required String userEmail}) async {
    pref!.setString(PreferencesString.userEmailID, userEmail);
  }
  static Future<void> setUserImage({required String userImage})async{
    pref!.setString(PreferencesString.userImage, userImage);
  }

  static String? getToken() {
    if (pref!.getString(PreferencesString.token) != null) {
      return pref!.getString(PreferencesString.token);
    }
    return null;
  }
  static int? getUserId() {
    if (pref!.getInt(PreferencesString.userID) != null) {
      return pref!.getInt(PreferencesString.userID);
    }
    return null;
  }
  static String? getUserName() {
    if (pref!.getString(PreferencesString.userName) != null) {
      return pref!.getString(PreferencesString.userName);
    }
    return null;
  }
  static String? getUserEmail() {
    if (pref!.getString(PreferencesString.userEmailID) != null) {
      return pref!.getString(PreferencesString.userEmailID);
    }
    return null;
  }
  static String? getUserImages() {
    if (pref!.getString(PreferencesString.userImage) != null) {
      return pref!.getString(PreferencesString.userImage);
    }
    return null;
  }

  static Future<void>clearAll()async{
    await pref!.clear();
  }
}
class PreferencesString {
  static const String token = "token";
  static const String userID = "userId";
  static const String userName = "userName";
  static const String userEmailID = "userEmail";
  static const String userImage = "userImage";
}