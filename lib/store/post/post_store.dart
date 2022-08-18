import 'package:barber_shop/models/post.model.dart';
import 'package:barber_shop/repositories/api.repository.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final apiRepository = ApiRepository();

  @observable
  bool isLoading = false;

  @observable
  List<PostModel> apis = [];

  @action
  Future<List<PostModel>> getAllItems() async {
    isLoading = true;
    apis = await apiRepository.fetchAllApis();
    return apis;
  }
}
