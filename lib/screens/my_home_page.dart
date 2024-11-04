import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/add_task_widget.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/providers/to_do_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final taskTitleController = TextEditingController();
  final taskDetailsController = TextEditingController();
  final int userId = 13;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ToDoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Tasks User: $userId'),
        leading:
            const Icon(Icons.checklist_sharp, color: Colors.white, size: 32),
      ),
      body: Consumer<ToDoProvider>(
        builder: (context, prov, child) => FutureBuilder(
          future: prov.featchUserTasks(userId),
          builder:
              (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
            List<TaskModel> tasks = snapshot.data ?? List.empty();
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text((index + 1).toString(),
                            style: const TextStyle(fontSize: 42)),
                        trailing: Icon(
                          tasks[index].status
                              ? Icons.done
                              : Icons.pending_actions_sharp,
                          size: 35,
                          color:
                              tasks[index].status ? Colors.green : Colors.red,
                        ),
                        title: Text(tasks[index].title,
                            style: const TextStyle(
                                color: Colors.green, fontSize: 24)),
                        subtitle: Text(tasks[index].status
                            ? "Compleated"
                            : "Not Compleated"),
                      );
                    }) // tasks view
                : snapshot.hasError
                    ? Center(
                        // error view
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'))
                        ],
                      ))
                    : const Center(
                        // waiting view
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        ],
                      ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTask(
                    taskTitleController: taskTitleController,
                    taskDetailsController: taskDetailsController,
                    buttonOnPressed: () {
                      if (taskTitleController.text.trim() == "") {
                        return;
                      }
                      provider.handleAddingTask(taskTitleController.text);
                      taskTitleController.text = "";
                      taskDetailsController.text = "";
                      Navigator.pop(context);
                    });
              });
        },
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
