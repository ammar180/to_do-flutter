import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/custome_textfeild.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
    required this.taskTitleController,
    required this.buttonOnPressed,
    required this.taskDetailsController,
  });

  final TextEditingController taskTitleController;
  final TextEditingController taskDetailsController;

  final void Function() buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border(
            top: BorderSide(
                color: Colors.black,
                strokeAlign: 1,
                width: 1.5,
                style: BorderStyle.solid),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.cancel),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "New Task",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextField(
              text: "Task...",
              controller: taskTitleController,
            ),
            CustomTextField(
              text: "Task Details...",
              number: 4,
              controller: taskDetailsController,
            ),
            SizedBox(
              height: 70,
              child: ElevatedButton(
                onPressed: buttonOnPressed,
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      "Add Task",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
