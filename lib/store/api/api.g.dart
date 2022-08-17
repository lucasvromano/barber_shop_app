// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Api on _Api, Store {
  late final _$requestingAtom = Atom(name: '_Api.requesting', context: context);

  @override
  bool get requesting {
    _$requestingAtom.reportRead();
    return super.requesting;
  }

  @override
  set requesting(bool value) {
    _$requestingAtom.reportWrite(value, super.requesting, () {
      super.requesting = value;
    });
  }

  late final _$apiAtom = Atom(name: '_Api.api', context: context);

  @override
  Future<ApiModel> get api {
    _$apiAtom.reportRead();
    return super.api;
  }

  @override
  set api(Future<ApiModel> value) {
    _$apiAtom.reportWrite(value, super.api, () {
      super.api = value;
    });
  }

  late final _$apisAtom = Atom(name: '_Api.apis', context: context);

  @override
  List<ApiModel> get apis {
    _$apisAtom.reportRead();
    return super.apis;
  }

  @override
  set apis(List<ApiModel> value) {
    _$apisAtom.reportWrite(value, super.apis, () {
      super.apis = value;
    });
  }

  late final _$stringTesteAtom =
      Atom(name: '_Api.stringTeste', context: context);

  @override
  ObservableList<String> get stringTeste {
    _$stringTesteAtom.reportRead();
    return super.stringTeste;
  }

  @override
  set stringTeste(ObservableList<String> value) {
    _$stringTesteAtom.reportWrite(value, super.stringTeste, () {
      super.stringTeste = value;
    });
  }

  late final _$getAllItemsAsyncAction =
      AsyncAction('_Api.getAllItems', context: context);

  @override
  Future<List<ApiModel>> getAllItems() {
    return _$getAllItemsAsyncAction.run(() => super.getAllItems());
  }

  late final _$_ApiActionController =
      ActionController(name: '_Api', context: context);

  @override
  List<String> getTeste() {
    final _$actionInfo =
        _$_ApiActionController.startAction(name: '_Api.getTeste');
    try {
      return super.getTeste();
    } finally {
      _$_ApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requesting: ${requesting},
api: ${api},
apis: ${apis},
stringTeste: ${stringTeste}
    ''';
  }
}
