import 'package:flutter/material.dart';
import 'task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _controller;

  var task = <String>['Task 1', 'Task 2', 'Task 3'];

  void addTask(String str) {
    setState(() {
      task.add(str);
    });
  }

  void editTask(String newTask, int indexTask) {
    setState(() {
      task[indexTask] = newTask;
    });
  }

  void deleteTask(int indexTask) {
    setState(() {
      task.remove(task.elementAt(indexTask));
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              margin: const EdgeInsets.all(60),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Type the task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 10, color: Colors.indigo))),
                onSubmitted: (String newTask) {
                  setState(() {
                    task.add(newTask);
                  });
                },
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.only(left: 170),
              shrinkWrap: true,
              itemCount: task.length,
              itemBuilder: (_, i) => ListTile(
                  title: Text(task.elementAt(i)),
                  onTap: () {
                    Navigator.pushNamed(context, '/DetailScreen',
                        arguments: Task(
                            valueTask: task.elementAt(i),
                            indexTask: i,
                            editTask: editTask,
                            deleteTask: deleteTask,
                            nameTask: task.elementAt(i)));
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
