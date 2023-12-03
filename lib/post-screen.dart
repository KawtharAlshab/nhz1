import 'dart:developer';

import 'package:course2/models/post-model.dart';
import 'package:course2/post-cubit/post_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  // late Dio myDio ;
 //
 //  Future<List<PostModel>> getPostes()async{
 //    late  List<PostModel> postsList ;
 //  Response response=await myDio.get('https://jsonplaceholder.typicode.com/posts/1');
 //  var responseData = response.data;
 //  List postsListTemp = responseData.map((post) =>PostModel.fromJson(post)).toList();
 //  postsList = postsListTemp.cast<PostModel>();
 //  return postsList ;
 //  //  postsList.add(PostModel.fromJson(responseData));
 //
 // //   log(postsList[0].id.toString());
 //
 //  }

@override
  void initState() {
    // TODO: implement initState
  // myDio = Dio();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => PostCubit(),
  child: BlocConsumer<PostCubit,PostState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        ],
        onTap: (value) {
          if(value==1){
            PostCubit.getPostCubitObject(context).addPost();
          }else if(value == 2){
            PostCubit.getPostCubitObject(context).deletePost();
          }
        },
      ),
      body: 
         FutureBuilder(
            future:PostCubit.getPostCubitObject(context).getPostes(),
            builder: (context,snapShot) {

              return snapShot.hasData? Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),

                      ),
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // color: Colors.amber,
                        ),
                        height: 250,
                        width: MediaQuery.of(context).size.width,

                        child: Column(
                          children: [
                            Expanded(child: Container(
                             //   color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(snapShot.data![index].id.toString()),
                                        Text(snapShot.data![index].userId.toString()?? '0')
                                      ],
                                    ),
                                    Expanded(child: Text(snapShot.data![index].title.toString())),
                                    Expanded(child: Text(snapShot.data![index].body.toString()))
                                    //Text('" eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"',overflow:TextOverflow.ellipsis ,maxLines: 10),
                                  //  Text('data')
                                  ],
                                ),
                                // child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(20),
                                //     child: Image.asset('assets/4.jpg',fit: BoxFit.fitWidth,))
                            )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {

                                    }, child: Text(
                                      'add'
                                    )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {

                                    }, child: Text(
                                        'delete'
                                    )),
                                  ), SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {
                                    // getPostes();
                                    }, child: Text(
                                        'get'
                                    )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }, separatorBuilder: (context, index) {
                  return Divider(color: Colors.amber,
               //   height: 50,
                    thickness: 2,
                  );
                  // return SizedBox(
                  //   height: 10,
                  // );
                }, itemCount: snapShot.data!.length),
              ):Center(child: CircularProgressIndicator());
            }
         )
    );
  },
),
);
  }
}
