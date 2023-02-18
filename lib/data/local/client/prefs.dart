


import '../../../main.dart';

class LocalSharedPrefrence{

  bool prefsAvailable=true;

  LocalSharedPrefrence(){
    if(myGlobalPreference!=null){

    }else{

      prefsAvailable=false;
    }
  }

  String userId='UserId';
  String isLogin='UserLoginStatus';
  String slider='slider';
  String token='accesstoken';
  String name='name';




  Future<void> setToken(String flag)async{
    if(prefsAvailable){
      await  myGlobalPreference!.setString(token, flag);
    }
  }


  String getToken(){
    if(prefsAvailable){
      return myGlobalPreference!.getString(token)??"";
    }
    return "";
  }


  Future<void> setUserId(int flag)async{
    if(prefsAvailable){
      await  myGlobalPreference!.setInt(userId, flag);
    }
  }



  int getUserId(){
    if(prefsAvailable){
      return myGlobalPreference!.getInt(userId)??0;
    }
    return 0;
  }

  Future<void> setLoginStatus(bool flag)async {
    if(prefsAvailable){
      await myGlobalPreference!.setBool(isLogin, flag);
    }
  }

  bool getLoginStatus(){
    if(prefsAvailable){
      return myGlobalPreference!.getBool(isLogin)??false;
    }
    return false;
  }

  Future<void> setSliderStatus(bool flag)async {
    if(prefsAvailable){
      await myGlobalPreference!.setBool(slider, flag);
    }
  }

  bool getSliderStatus(){
    if(prefsAvailable){
      return myGlobalPreference!.getBool(slider)??false;
    }
    return false;
  }

}