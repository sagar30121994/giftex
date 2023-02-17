import 'package:mobx/mobx.dart';


part 'bottomviewmodel.g.dart';

class BottomViewModel = _BottomViewModel with _$BottomViewModel;

abstract class _BottomViewModel with Store {

  _BottomViewModel(){}

  @observable
  int selectedIndex=0;




}