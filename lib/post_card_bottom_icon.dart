import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCardBottomIcon extends StatelessWidget {
  const PostCardBottomIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6.0),
        Text(
          title,
          style: GoogleFonts.sourceSansPro(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
