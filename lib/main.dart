import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(MaterialAppCustom());
}

class MaterialAppCustom extends StatelessWidget {
  const MaterialAppCustom();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatelessWidget {
  ToDoList({super.key});

  List<Task> tasks = TaskFactory().generateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.check),
            tooltip: 'Lista de tareas',
            onPressed: null,
          ),
          title: const Text("Lista de tareas de sara gomez "),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              children: tasks
                  .map((task) => Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.lightBlue.shade100),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.arrow_circle_right_outlined),
                            Text(task.name()),
                            task.status()
                                ? const Icon(Icons.check_box)
                                : const Icon(
                                    Icons.check_box_outline_blank_outlined),
                          ],
                        ),
                      ))
                  .toList()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
          tooltip: 'Welcome',
          child: Icon(Icons.thumb_up),
        ));
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
      ),
      body: Container(
        color: Colors.pink,
        child: Center(
          child: Text(
            "Segunda pantalla de sara",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
