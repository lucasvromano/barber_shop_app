import 'package:barber_shop/models/post.model.dart';
import 'package:barber_shop/repositories/api.repository.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final apiRepository = ApiRepository();

  @observable
  List<PostModel> apis = [];

  @action
  Future<List<PostModel>> getAllItems() async {
    apis = await apiRepository.fetchAllApis();
    return apis;
  }
}
