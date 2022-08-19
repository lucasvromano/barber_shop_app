// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PostStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$postsAtom = Atom(name: '_PostStore.posts', context: context);

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$postAtom = Atom(name: '_PostStore.post', context: context);

  @override
  dynamic get post {
    _$postAtom.reportRead();
    return super.post;
  }

  @override
  set post(dynamic value) {
    _$postAtom.reportWrite(value, super.post, () {
      super.post = value;
    });
  }

  late final _$getAllItemsAsyncAction =
      AsyncAction('_PostStore.getAllItems', context: context);

  @override
  Future<List<PostModel>> getAllItems() {
    return _$getAllItemsAsyncAction.run(() => super.getAllItems());
  }

  late final _$registerPostAsyncAction =
      AsyncAction('_PostStore.registerPost', context: context);

  @override
  Future<dynamic> registerPost(dynamic title, dynamic body, dynamic userId) {
    return _$registerPostAsyncAction
        .run(() => super.registerPost(title, body, userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
posts: ${posts},
post: ${post}
    ''';
  }
}
