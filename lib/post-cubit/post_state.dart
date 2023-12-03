part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitialState extends PostState {}
class PostAddPostState extends PostState {}
class PostGetPostsState extends PostState {}
class PostDeleteState extends PostState {}
