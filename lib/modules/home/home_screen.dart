import 'package:flutter/material.dart';
import 'package:flutter_1/modules/bmi/bmi_calculator_screen.dart';
import 'package:flutter_1/modules/login/login_screen.dart';
import 'package:flutter_1/modules/messenger/messenger_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 54, 63),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2.5,
        shadowColor: const Color.fromARGB(255, 236, 226, 238),
        leading: Icon(Icons.menu),

        title: Text("Flutter"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined),
          ),
          IconButton(
            onPressed: () {
              print('inside search icon');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('inside settings icon');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          clipBehavior: Clip.antiAliasWithSaveLayer,

          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Image(
                      width: 300.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/06/19/20/13/sunset-815270_640.jpg',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      width: 300.0,
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Text(
                        "Sunset",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.blueGrey,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login Screen',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.blueGrey,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessengerScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Messenger Screen',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.blueGrey,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BmiCalculatorScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'BMI Screen',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
