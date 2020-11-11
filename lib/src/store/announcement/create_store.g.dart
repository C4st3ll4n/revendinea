// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStore, Store {
  Computed<int> _$maxImgComputed;

  @override
  int get maxImg => (_$maxImgComputed ??=
          Computed<int>(() => super.maxImg, name: '_CreateStore.maxImg'))
      .value;

  final _$categoryAtom = Atom(name: '_CreateStore.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateStore.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$_CreateStoreActionController = ActionController(name: '_CreateStore');

  @override
  dynamic setHidePhone(bool newValue) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setHidePhone');
    try {
      return super.setHidePhone(newValue);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategory(Category newCategory) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCategory');
    try {
      return super.setCategory(newCategory);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone},
maxImg: ${maxImg}
    ''';
  }
}
