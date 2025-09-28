import 'package:flutter/material.dart';
import 'package:flutter_1/modules/todo/archived/archived_tasks_screen.dart';
import 'package:flutter_1/modules/todo/done/done_tasks_screen.dart';
import 'package:flutter_1/modules/todo/tasks/tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

class TodoMainScreen extends StatefulWidget {
  const TodoMainScreen({super.key});

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    TasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = ['Tasks', 'Done', 'Archived'];
  late Database database;
  bool isButtomSheetShown = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text(titles[currentIndex])),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isButtomSheetShown) {
            // Close the sheet
            Navigator.pop(context);
            setState(() {
              isButtomSheetShown = false;
            });
          } else {
            // Show the sheet
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.redAccent,
                    width: double.infinity,
                    height: 120.0,
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        'Bottom sheet content',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
                .closed
                .then((value) {
                  // Reset when sheet is closed manually
                  setState(() {
                    isButtomSheetShown = false;
                  });
                });

            setState(() {
              isButtomSheetShown = true;
            });
          }
        },
        child: Icon(isButtomSheetShown ? Icons.add : Icons.edit),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.tealAccent,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all_outlined),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print("Database Created");
        await database
            .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
            )
            .then((value) {
              print("Table Created");
            })
            .catchError((error) {
              print("Error when creating table: ${error.toString()}");
            });
      },
      onOpen: (db) {
        print("Database Opened");
      },
    );
  }

  void insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
            'INSERT INTO Tasks(title, date, time, status) VALUES(?, ?, ?, ?)',
            [title, date, time, 'new'],
          )
          .then((value) {
            print('$value inserted successfully');
            print('$value inserted successfully');
          })
          .catchError((error) {
            print('Error inserting new record: ${error.toString()}');
          });
    });
  }

  Future<String> getName() async {
    return 'Mustafa Muhammad';
  }
}
