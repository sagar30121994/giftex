import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/repository/user/loginrepo.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'footerviewmodel.g.dart';

class FooterViewModel = _FooterViewModel with _$FooterViewModel;

abstract class _FooterViewModel with Store {
  SubscribeViewModelErrorState subscribeViewModelErrorState = SubscribeViewModelErrorState();

  List<ReactionDisposer>? _disposers;
  late LoginRepo loginRepo;

  _FooterViewModel() {
    loginRepo = LoginRepo();
  }
  @observable
  String? email;

  @observable
  String? name;

  @observable
  bool isLoadingForUpCommingAuction = false;

  @action
  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => name, validatePassowrd),
    ];
  }

  @action
  validateEmail(String? email) {
    if (isEmail(email!)) {
      subscribeViewModelErrorState.email = null;
    } else {
      subscribeViewModelErrorState.email = 'Enter A Valid Mail';
    }
  }

  @action
  validatePassowrd(String? pass) {
    if (pass!.length >= 3) {
      subscribeViewModelErrorState.name = null;
    } else {
      subscribeViewModelErrorState.name = 'Enter A Valid Name';
    }
  }

  @action
  Future<HttpResponse> insertsubscribeForm() async {
    isLoadingForUpCommingAuction = true;

    HttpResponse httpResponse = await loginRepo.insertsubscribeForm(email??"", name??"");

    if (httpResponse.status == 200) {
      // upComingLotsResponse = httpResponse.data;
    }
    isLoadingForUpCommingAuction = false;
    return httpResponse;
  }
}

class SubscribeViewModelErrorState = _SubscribeViewModelErrorState with _$SubscribeViewModelErrorState;

abstract class _SubscribeViewModelErrorState with Store {
  @observable
  String? email;

  // @observable
  // String? mobile;
  //
  // @observable
  // String? mobile;

  @observable
  String? name;

  @computed
  bool get hasErrors => email != null || name != null;
}
