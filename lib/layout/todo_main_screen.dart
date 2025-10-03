import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1/modules/todo/archived/archived_tasks_screen.dart';
import 'package:flutter_1/modules/todo/done/done_tasks_screen.dart';
import 'package:flutter_1/modules/todo/tasks/tasks_screen.dart';
import 'package:flutter_1/shared/components/component.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class TodoMainScreen extends StatefulWidget {
  const TodoMainScreen({super.key});

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  // switching between screens
  int currentIndex = 0;
  List<Widget> screens = [
    TasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = ['Tasks', 'Done', 'Archived'];
  // instance of Data base
  late Database database;
  // flag for buttom sheet and his key
  bool isButtomSheetShown = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  // Controllers
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
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
            // here we check if the form is valid
            if (formKey.currentState!.validate()) {
              // here we insert to data base with its values
              insertToDatabase(
                title: titleController.text,
                date: dateController.text,
                time: timeController.text,
              ).then((value) {
                // after inserting we close the bottom sheet and clear the controllers
                Navigator.pop(context);
                setState(() {
                  isButtomSheetShown = false;
                  titleController.clear();
                  dateController.clear();
                  timeController.clear();
                });
              });
            }
          } else {
            // here we show the bottom sheet
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(20.0),
                    // here we make the form
                    child: Form(
                      key: formKey,
                      child: Column(
                        // we use main axis size to make the form take the minimum height
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // default input is a custom input i created in shared components
                          defaultInput(
                            controller: titleController,
                            type: TextInputType.text,
                            text: 'Task Title',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Title is required";
                              }
                              return null;
                            },
                            prefix: const Icon(Icons.title),
                          ),
                          const SizedBox(height: 10.0),
                          defaultInput(
                            controller: timeController,
                            type: TextInputType.datetime,
                            text: 'Task Time',
                            readOnly: true,
                            onTap: () async {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                timeController.text = pickedTime.format(
                                  context,
                                );
                              }
                            },
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Time is required";
                              }
                              return null;
                            },
                            prefix: const Icon(Icons.watch_later_outlined),
                          ),
                          const SizedBox(height: 10.0),
                          // here we use external package intl to format the date
                          defaultInput(
                            controller: dateController,
                            type: TextInputType.datetime,
                            text: 'Task Date',
                            readOnly: true,
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2026),
                              );

                              if (pickedDate != null) {
                                dateController.text = DateFormat.yMMMd().format(
                                  pickedDate,
                                );
                              }
                            },
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Date is required";
                              }
                              return null;
                            },
                            prefix: const Icon(Icons.calendar_today_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                // here we handle the closing of the bottom sheet
                .closed
                .then((value) {
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

  // here we create the database
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
              // called once when creating table
              print("Table Created");
            })
            .catchError((error) {
              print("Error when creating table: ${error.toString()}");
            });
      },
      // open the database
      onOpen: (db) {
        // called every time we run the app
        print("Database Opened");
      },
    );
  }

  // here we insert to database
  Future insertToDatabase({
    // required data
    required String title,
    required String date,
    required String time,
  }) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
            'INSERT INTO Tasks(title , date , time , status) VALUES("$title" , "$date","$time","new") ',
          )
          .then((value) {
            print('$value added successfully to data base ');
          })
          .catchError((error) {
            print("Error when inserting record: ${error.toString()}");
          });
    });
  }
}
