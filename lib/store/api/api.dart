import 'package:barber_shop/models/api.model.dart';
import 'package:barber_shop/repositories/api.repository.dart';
import 'package:mobx/mobx.dart';

part 'api.g.dart';

class Api = _Api with _$Api;

abstract class _Api with Store {
  final apiRepository = ApiRepository();

  @observable
  List<ApiModel> apis = [];

  @action
  Future<List<ApiModel>> getAllItems() async {
    apis = await apiRepository.fetchAllApis();
    return apis;
  }
}
