import 'package:flutter/material.dart';
import 'package:flutter_1/models/chat_model.dart';
import 'package:flutter_1/models/story_model.dart';
// import 'package:flutter_1/models/story_model.dart';
import 'package:flutter_1/templates/chat_user.dart';
import 'package:flutter_1/templates/story_user.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StoryModel> stories = [
      StoryModel(
        name: "You",
        imageUrl: "https://avatars.githubusercontent.com/u/113725174?v=4",
        isOwn: true,
      ),
      StoryModel(
        name: "Sarah",
        imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
      ),
      StoryModel(
        name: "John",
        imageUrl: "https://randomuser.me/api/portraits/men/46.jpg",
        status: "Active",
      ),
      StoryModel(
        name: "Sarah",
        imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
      ),
      StoryModel(
        name: "John",
        imageUrl: "https://randomuser.me/api/portraits/men/46.jpg",
        status: "Active",
      ),
      StoryModel(
        name: "Sarah",
        imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
      ),
      StoryModel(
        name: "John",
        imageUrl: "https://randomuser.me/api/portraits/men/46.jpg",
        status: "Active",
      ),
      StoryModel(
        name: "Sarah",
        imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
      ),
      StoryModel(
        name: "John",
        imageUrl: "https://randomuser.me/api/portraits/men/46.jpg",
        status: "Active",
      ),
      StoryModel(
        name: "Sarah",
        imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
      ),
      StoryModel(
        name: "John",
        imageUrl: "https://randomuser.me/api/portraits/men/46.jpg",
        status: "Active",
      ),
    ];
    final List<ChatModel> chats = [
      ChatModel(
        name: "John Doe",
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        lastMessage: "Hey, are you coming tonight?",
        time: "11:38 AM",
        isOnline: true,
      ),
      ChatModel(
        name: "Sarah Connor",
        avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        lastMessage: "Sure, I’ll send it now.",
        time: "09:15 AM",
        isOnline: false,
      ),
      ChatModel(
        name: "John Doe",
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        lastMessage: "Hey, are you coming tonight?",
        time: "11:38 AM",
        isOnline: true,
      ),
      ChatModel(
        name: "Sarah Connor",
        avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        lastMessage: "Sure, I’ll send it now.",
        time: "09:15 AM",
        isOnline: false,
      ),
      ChatModel(
        name: "John Doe",
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        lastMessage: "Hey, are you coming tonight?",
        time: "11:38 AM",
        isOnline: true,
      ),
      ChatModel(
        name: "Sarah Connor",
        avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        lastMessage: "Sure, I’ll send it now.",
        time: "09:15 AM",
        isOnline: false,
      ),
      ChatModel(
        name: "John Doe",
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        lastMessage: "Hey, are you coming tonight?",
        time: "11:38 AM",
        isOnline: true,
      ),
      ChatModel(
        name: "Sarah Connor",
        avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        lastMessage: "Sure, I’ll send it now.",
        time: "09:15 AM",
        isOnline: false,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Messnger',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_square, size: 20, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.facebook_rounded, size: 20, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/meta-ai-icon.png',
                      ),
                      backgroundColor: Color.fromARGB(116, 77, 75, 75),
                      radius: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Ask Meta Ai Or Search..",
                      style: TextStyle(color: Colors.blueGrey[300]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return StoryUser(story: stories[index]);
                  },
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: chats.length,
                separatorBuilder: (_, __) => SizedBox(height: 5),
                itemBuilder: (context, index) {
                  return ChatUser(chat: chats[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
