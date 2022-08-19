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
  List<PostModel> posts = [];

  @observable
  dynamic post;

  @action
  Future<List<PostModel>> getAllItems() async {
    isLoading = true;
    posts = await apiRepository.fetchAllApis();
    return posts;
  }

  @action
  Future<dynamic> registerPost(title, body, userId) async {
    isLoading = true;
    post = await apiRepository.fetchPostApi(title, body, userId);
    return post;
  }
}
