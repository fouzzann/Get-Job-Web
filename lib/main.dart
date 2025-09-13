import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_search_web/screens/post_screens.dart';
import 'package:provider/provider.dart';
import 'providers/post_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider()..fetchPosts(),
      child: GetMaterialApp (
        title: 'PostHub - Flutter Posts App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.grey[50],
        ),
        home:  PostsScreen(),
      ),
    );
  }
}