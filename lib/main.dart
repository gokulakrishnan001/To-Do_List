import 'dart:html';

import 'package:alert/schedule.dart';
import 'package:alert/task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do List",
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 65, 57, 170),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final navigate = [const Task(), Schedule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
      ),
      body: navigate[index],
      bottomNavigationBar: customNavBar(context),
    );
  }

  Container customNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () => setState(() {
              index = 0;
            }),
            icon: index == 0
                ? const Icon(
                    Icons.task,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.task_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () => setState(() {
              index = 1;
            }),
            icon: index == 1
                ? const Icon(
                    Icons.schedule,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.schedule_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
