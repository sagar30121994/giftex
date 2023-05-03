// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottomviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomViewModel on _BottomViewModel, Store {
  final _$selectedIndexAtom = Atom(name: '_BottomViewModel.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_BottomViewModelActionController =
      ActionController(name: '_BottomViewModel');

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_BottomViewModelActionController.startAction(
        name: '_BottomViewModel.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_BottomViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
