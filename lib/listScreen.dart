import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course2/expand.dart';
import 'package:course2/flower-model.dart';
import 'package:course2/image.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {


    super.initState();
    // getData();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   getData();
    // });
    // TODO: implement initState


  }

  List students = [
    {
      'name':"kawthar",
      "age" : 26
    },
    {
      'name':"ahmad",
      "age" : 44
    },
    {
      'name':"ammar",
      "age" : 26
    },
    {
      'name':"tala",
      "age" : 1
    },];
List<FlowerModel> flowerList =[
  FlowerModel(name: 'Bougainvillea', color: 'purble '),
  FlowerModel(name: 'Wisteria', color: 'blue '),
  FlowerModel(name: 'Cosmos', color: 'pink '),
  FlowerModel(name: 'Gardenia', color: 'white '),
];

  Future putData()async{
    await FirebaseFirestore.instance.collection('students').add({'name':'sal','age':27});
  }
  Future getData()async{
    showDialog(context: context, builder: (context) {
      return CircularProgressIndicator();
    },);
    // await FirebaseFirestore.instance.collection('students').doc('6RFx7NKhYfXYIdbREiAS').get().then((doc) {
    //   print(doc.data());
    // });
 await  FirebaseFirestore.instance.collection('students').get().then((snapShot) {

   snapShot.docs.forEach((doc) {
    setState(() {
      students.add(doc.data()['name']);
    });

     // print();
   });
 });
 //    await FirebaseFirestore.instance.collection('students').snapshots().listen((snapShot) {
 //      students=[];
 //        snapShot.docs.forEach((doc) {
 //         setState(() {
 //           students.add(doc.data()['name']);
 //         });
 //
 //          // print();
 //        });
 //    });
 Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            students =[];
            getData();
          }, icon: Icon(Icons.refresh)),
          IconButton(onPressed: (){

            putData();
          }, icon: Icon(Icons.add)),

        ],
      ),
      body:
        ListView.builder(
          itemCount: flowerList.length,
          itemBuilder:(context, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () async{
             // await   getData();
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ExpandScreen(index: index,);
                // },
                // ));
              },
              leading: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageScreen(index: (index+1).toString());
                  },));
                },
                child: Hero(
                  tag:'assets/${index+1}.jpg' ,
                  child: ClipOval(
                    child: Image.asset('assets/${index+1}.jpg'),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(
                      color: Colors.black
                  )
              ),
              title: Text(flowerList[index].name),
              subtitle: Text(flowerList[index].color),
              // title: Text(students[index]['name'].toString()),
              // subtitle: Text(students[index]['age'].toString()),
              trailing: Icon(Icons.favorite_border),
            ),
          );
        },)
      // ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ListTile(
      //         leading: Icon(Icons.person),
      //         selected: true,
      //         enabled: true,
      //         focusColor: Colors.green,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(25),
      //           side: BorderSide(
      //             color: Colors.black
      //           )
      //         ),
      //         title: Text("std1"),
      //         subtitle: Text("doctor"),
      //         trailing: Icon(Icons.favorite_border),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
