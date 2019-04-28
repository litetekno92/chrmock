import 'dart:convert';

import 'package:chrmock/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:chrmock/models/embedpost.dart';
import 'package:chrmock/utils/APIcat.dart';
import 'package:chrmock/widgets/card.dart';
import 'package:chrmock/widgets/drawer.dart';

class FetchDataCat extends StatefulWidget {
  final int category;
  FetchDataCat({this.category});
  @override
  _FetchDataCatState createState() => _FetchDataCatState(this.category);
}

class _FetchDataCatState extends State<FetchDataCat> {
final int category;
_FetchDataCatState(this.category);
  // List<Post> list = List();
  var posts = new List<Post>();
  var isLoading = false;

  _fetchDataCat(int category) {
    setState(() {
      isLoading = true;
    });
    APICAT.fetchDataCat(category).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        posts = list.map((model) => Post.fromJson(model)).toList();
   //     posts.forEach((post) => log(post.title));
        isLoading = false;
      });
    });
  }
// transform(UTF8.decoder)
  initState() {
    super.initState();
 //   _fetchDataCat(this.category);
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        // AppBar(
        //   title: Text("chrmock Sn FetchDataCat"),
        // ),
      drawer: CustomDrawer(),
        body: 
     isLoading
        ?Center(
            child: new CircularProgressIndicator(),
          ):Text("chrmock Sn FetchDataCat"),
        // :ListView.builder(
        //   itemCount: posts.length,
        //   itemBuilder: (context, index) {
        //     // var photo= posts[index];
            
        //     return PostCard(posts[index]);
     ); }
          //     child: ListTile(
          //         contentPadding: EdgeInsets.all(10.0),
          //         title: new Text(posts[index].title),
          //         trailing: new Image.network(
          //           posts[index].thumbnailUrl,
          //           fit: BoxFit.cover,
          //           height: 40.0,
          //           width: 40.0,
          //         )),
          //   );
          // },
    //     )
    // );
  }

