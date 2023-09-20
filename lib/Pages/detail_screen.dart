import 'package:flutter/material.dart';
import 'task.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: Text(argument.nameTask),
        actions: [
          IconButton(
              onPressed: () {
                argument.deleteTask(argument.indexTask);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              argument.nameTask,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'edit task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSubmitted: (value) {
                argument.editTask(value, argument.indexTask);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
