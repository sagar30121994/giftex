import '../../../main.dart';

class LocalSharedPrefrence {
  bool prefsAvailable = true;

  LocalSharedPrefrence() {
    if (myGlobalPreference != null) {
    } else {
      prefsAvailable = false;
    }
  }

  String userId = 'UserId';
  String fullname = "Fullname";
  String email = "Email";
  String crmId = 'CRMId';
  String isLogin = 'UserLoginStatus';
  String isTerms = 'TermsConditions';
  String slider = 'slider';
  String token = 'accesstoken';
  String name = 'name';
  String authkey = 'authkey';

  Future<void> setToken(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(token, flag);
    }
  }

  String getToken() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(token) ?? "";
    }
    return "";
  }

  Future<void> setName(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(name, flag);
    }
  }

  String getName() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(name) ?? "";
    }
    return "";
  }


  Future<void> setFullname(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(fullname, flag);
    }
  }

  String getFullname() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(fullname) ?? "";
    }
    return "";
  }

  Future<void> setEmail(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(email, flag);
    }
  }

  String getEmail() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(email) ?? "";
    }
    return "";
  }

  Future<void> setUserId(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(userId, flag);
    }
  }

  Future<void> setCrmClinetId(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(crmId, flag);
    }
  }

  Future<void> setAuthKeyWeb(String flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setString(authkey, flag);
    }
  }

  String getAuthKeyWeb() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(authkey) ?? "0";
    }
    return "0";
  }

  String getCrmClinetId() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(crmId) ?? "0";
    }
    return "0";
  }

  String getUserId() {
    if (prefsAvailable) {
      return myGlobalPreference!.getString(userId) ?? "0";
    }
    return "0";
  }

  Future<void> setLoginStatus(bool flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setBool(isLogin, flag);
    }
  }

  Future<void> setTermstatus(bool flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setBool(isTerms, flag);
    }
  }

  bool getLoginStatus() {
    if (prefsAvailable) {
      return myGlobalPreference!.getBool(isLogin) ?? false;
    }
    return false;
  }

  bool getTermstatus() {
    if (prefsAvailable) {
      return myGlobalPreference!.getBool(isTerms) ?? false;
    }
    return false;
  }

  Future<void> setSliderStatus(bool flag) async {
    if (prefsAvailable) {
      await myGlobalPreference!.setBool(slider, flag);
    }
  }

  bool getSliderStatus() {
    if (prefsAvailable) {
      return myGlobalPreference!.getBool(slider) ?? false;
    }
    return false;
  }
}
