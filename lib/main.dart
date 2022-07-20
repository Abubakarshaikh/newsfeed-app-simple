import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post.dart';
import 'post_card.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        titleTextStyle: GoogleFonts.sourceSansPro(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        title: const Text("Newsfeed"),
      ),
      body: const NewsFeedPosts(),
    ),
  ));
}

class NewsFeedPosts extends StatefulWidget {
  const NewsFeedPosts({Key? key}) : super(key: key);

  @override
  State<NewsFeedPosts> createState() => _NewsFeedPostsState();
}

class _NewsFeedPostsState extends State<NewsFeedPosts> {
  late final ScrollController _scrollController = ScrollController();
  late final Random _random = Random();
  Future buildPost() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      posts.addAll(List.generate(4, (index) {
        return posts[_random.nextInt(4)];
      }));
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        buildPost();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: posts.length + 1,
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < posts.length) {
          return PostCard(post: posts[index]);
        } else {
          return const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(child: CircularProgressIndicator(color: Colors.cyan)),
          );
        }
      },
      separatorBuilder: (context, index) {
        return Container(height: 8, color: Colors.black12);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  List<Post> posts = [
    Post("Ahmed ali", "images/car1.jpg", "images/pr1.jpg"),
    Post("Nabeel hijaz", "images/car2.jpg", "images/pr2.jpg"),
    Post("Hamna arain", "images/car3.jpg", "images/pr3.jpg"),
    Post("Rafeeque mughal", "images/car4.jpg", "images/pr4.jpg"),
    Post("Ifraha ikram", "images/car5.jpg", "images/pr5.jpg"),
  ];
}
