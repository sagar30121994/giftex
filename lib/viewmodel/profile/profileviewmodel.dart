import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/profile/GetUserAllDetailsResponse.dart';
import 'package:giftex/data/network/repository/profile/profileRopo.dart';
import 'package:mobx/mobx.dart';


part 'profileviewmodel.g.dart';

class ProfileViewModel = _ProfileViewModel with _$ProfileViewModel;

abstract class _ProfileViewModel with Store {
  ProfileRepo profileRepo = ProfileRepo();

  _ProfileViewModel();

  @observable
  bool isloading=false;

  @observable
  GetUserAllDetailsResponse? getUserAllDetailsResponse=GetUserAllDetailsResponse();


  Future<HttpResponse> getUserAllDetails() async{
    isloading = true;

    HttpResponse httpResponse =
    await profileRepo!.getUserAllDetails();

    if(httpResponse.status==200) {
      getUserAllDetailsResponse = httpResponse.data;

    }
    isloading = false;
    return httpResponse;
  }
}