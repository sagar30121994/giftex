import 'package:flutter/material.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:mobx/mobx.dart';

part 'bottomviewmodel.g.dart';

class BottomViewModel = _BottomViewModel with _$BottomViewModel;

abstract class _BottomViewModel with Store {
  ProfileViewModel? profileViewModel;

  _BottomViewModel() {
    profileViewModel = ProfileViewModel();
  }

  @observable
  int selectedIndex = 0;

  @observable
  GlobalKey<ScaffoldState> key = GlobalKey();

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}
