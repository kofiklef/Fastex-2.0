// ignore_for_file: unused_field, unused_element

import 'package:fastex/core/failures/serverFailure.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:flutter/material.dart';

enum NotifierState { initial, loading, loaded }

class PostChangeNotifier extends ChangeNotifier {
  final _postService = FastexAPI();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Post _post;
  Post get post => _post;
  void _setPost(Post post) {
    _post = post;
    notifyListeners();
  }

  ServerFailure _failure;
  ServerFailure get failure => _failure;
  void _setFailure(ServerFailure failure) {
    _failure = failure;
    notifyListeners();
  }

  // void getOnePost() async {
  //   _setState(NotifierState.loading);
  //   try {
  //     final post = await _postService.fetchFoods();
  //     _setPost(post);
  //   } on ServerFailure catch (f) {
  //     _setFailure(f);
  //   }
  //   _setState(NotifierState.loaded);
  // }
}