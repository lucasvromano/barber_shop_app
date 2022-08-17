import 'package:barber_shop/models/api.model.dart';
import 'package:barber_shop/repositories/api.repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'api.g.dart';

class Api = _Api with _$Api;

abstract class _Api with Store {
  final apiRepository = ApiRepository();

  @observable
  bool requesting = false;
  // @observable
  // late ApiRepository apiRepository = ApiRepository();
  @observable
  late Future<ApiModel> api;
  @observable
  List<ApiModel> apis = [];
  @observable
  ObservableList<String> stringTeste = ObservableList.of(['']);

  @action
  Future<List<ApiModel>> getAllItems() async {
    requesting = true;
    apis = await apiRepository.fetchAllApis();
    return apis;
  }

  @action
  List<String> getTeste() {
    stringTeste.add('teste 1');
    return stringTeste;
  }
}
