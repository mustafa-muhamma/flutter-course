import 'package:flutter/material.dart';
import '../models/story_model.dart';

class StoryUser extends StatelessWidget {
  final StoryModel story;

  const StoryUser({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(story.imageUrl),
              backgroundColor: const Color(0xff333333),
              radius: 30,
            ),

            // 👇 If it's your own story → show "+"
            if (story.isOwn)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CircleAvatar(
                  backgroundColor: const Color(0xff333333),
                  radius: 10,
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              )
            else
              // 👇 If it's NOT your own → show green dot
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 50,
          child: Text(
            textAlign: TextAlign.center,
            story.isOwn ? "Create a story" : story.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
