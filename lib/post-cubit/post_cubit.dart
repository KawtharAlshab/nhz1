import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/post-model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitialState());

  static PostCubit getPostCubitObject (context)=>BlocProvider.of(context);

  late Dio myDio =Dio();
  late  List<PostModel> postsList ;
  Future<List<PostModel>> getPostes()async{

    Response response=await myDio.get('https://jsonplaceholder.typicode.com/posts');
    var responseData = response.data;
    List postsListTemp = responseData.map((post) =>PostModel.fromJson(post)).toList();
    postsList = postsListTemp.cast<PostModel>();
    return postsList ;
    //  postsList.add(PostModel.fromJson(responseData));

    //   log(postsList[0].id.toString());

  }

  Future deletePost()async{

    Response response=await myDio.delete('https://jsonplaceholder.typicode.com/posts/1');
    var responseData = response.data;
    print(responseData.toString());
    // List postsListTemp = responseData.map((post) =>PostModel.fromJson(post)).toList();
    // postsList = postsListTemp.cast<PostModel>();
    // return postsList ;
    //  postsList.add(PostModel.fromJson(responseData));

    //   log(postsList[0].id.toString());

  }

  Future addPost()async{
    late  List<PostModel> postsList ;
    Response response=await myDio.post('https://jsonplaceholder.typicode.com/posts',data:{
      'id':222,
      'userId' : 2222,
      'title':'koko',
      'body':'kawthar alshab'
    } );
    var responseData = response.data;
    print(responseData.toString());

    //  postsList.add(PostModel.fromJson(responseData));

    //   log(postsList[0].id.toString());

  }

}
