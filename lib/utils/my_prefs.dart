import 'package:borcelle_wedding_app/models/data_models/user_model.dart';
import 'package:borcelle_wedding_app/utils/preferences_constants.dart';
import 'package:get_storage/get_storage.dart';

class MyPrefs {
  static final _storage = GetStorage();

  MyPrefs._();

  static Future<void> init() async {
    await GetStorage.init();
  }


  static void updateUserInfo({String? token, UserModel? userData}) {
    if (token != null) {
      _storage.write(MyPreferencesConstants.currentUserToken, token);
    }
    if (userData != null) {
      _storage.write(MyPreferencesConstants.currentUser, userData.toJson());
    }
  }

  static String? getCurrentServer() {
    return _storage
        .read(MyPreferencesConstants.currentSelectedServer)
        ?.toString();
  }

  static UserModel? getCurrentUser() {
    final savedValue = _storage.read(MyPreferencesConstants.currentUser);
    if (savedValue != null) {
      return UserModel.fromJson(savedValue);
    }
    return null;
  }

  static String? getCurrentUserToken() {
    return _storage.read(MyPreferencesConstants.currentUserToken);
  }

  static void removeSavedLoginCredentials() {
    _storage.remove(MyPreferencesConstants.savedEmail);
    _storage.remove(MyPreferencesConstants.savedPassword);
    _storage.remove(MyPreferencesConstants.rememberMe);
  }

  static void saveAuthToken(String token) {
    _storage.write(MyPreferencesConstants.authUserToken, token);
  }

  static String? getAuthToken() {
    return _storage.read(MyPreferencesConstants.authUserToken);
  }

  static void saveLoginCredentials({
    required String email,
    required String password,
    required bool rememberMe,
  }) {
    _storage.write(MyPreferencesConstants.rememberMe, rememberMe);
    if (rememberMe) {
      _storage.write(MyPreferencesConstants.savedEmail, email);
      _storage.write(MyPreferencesConstants.savedPassword, password);
    } else {
      _storage.remove(MyPreferencesConstants.savedEmail);
      _storage.remove(MyPreferencesConstants.savedPassword);
    }
  }

  static bool getRememberMeStatus() {
    return _storage.read(MyPreferencesConstants.rememberMe) ?? false;
  }

  static String getSavedEmail() {
    return _storage.read(MyPreferencesConstants.savedEmail) ?? '';
  }

  static String getSavedPassword() {
    return _storage.read(MyPreferencesConstants.savedPassword) ?? '';
  }

  static void saveSubscribePlan(String subscribePlan) {
    _storage.write(MyPreferencesConstants.subscribePlan, subscribePlan);
  }

  static String getSavedSubscribePlan() {
    return _storage.read(MyPreferencesConstants.subscribePlan) ?? '';
  }

  static void clearSavedSubscribePlan() {
    _storage.remove(MyPreferencesConstants.subscribePlan);
  }

  static void removeSavedUserInfo() {
    _storage.remove(MyPreferencesConstants.currentUser);
    _storage.remove(MyPreferencesConstants.currentUserToken);
  }

  static void logOutUser() {
    removeSavedUserInfo();
  }
}
