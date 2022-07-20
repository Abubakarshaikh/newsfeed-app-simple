import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post.dart';
import 'post_card_bottom_icon.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(post.profileImage),
              ),
              const SizedBox(width: 18),
              Text(post.userName,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 18,
                  )),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 4 / 2,
          child: ClipRect(
            child: Image.asset(post.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              PostCardBottomIcon(icon: Icons.thumb_up_outlined, title: "Likes"),
              PostCardBottomIcon(
                  icon: Icons.comment_outlined, title: "Comments"),
              PostCardBottomIcon(icon: Icons.share_outlined, title: "Share"),
            ],
          ),
        ),
      ],
    );
  }
}
