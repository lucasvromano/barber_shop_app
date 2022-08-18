// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStore, Store {
  late final _$apisAtom = Atom(name: '_PostStore.apis', context: context);

  @override
  List<PostModel> get apis {
    _$apisAtom.reportRead();
    return super.apis;
  }

  @override
  set apis(List<PostModel> value) {
    _$apisAtom.reportWrite(value, super.apis, () {
      super.apis = value;
    });
  }

  late final _$getAllItemsAsyncAction =
      AsyncAction('_PostStore.getAllItems', context: context);

  @override
  Future<List<PostModel>> getAllItems() {
    return _$getAllItemsAsyncAction.run(() => super.getAllItems());
  }

  @override
  String toString() {
    return '''
apis: ${apis}
    ''';
  }
}
