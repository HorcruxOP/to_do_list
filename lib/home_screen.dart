import 'package:flutter/material.dart';
import 'package:to_do_list/taskinfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do-List"),
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Container(
                    height: 600,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          "Add new task",
                          style: TextStyle(fontSize: 28),
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: "Title",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: "Description",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              addTask(titleController.text,
                                  descriptionController.text);
                              Navigator.of(context).pop();
                              titleController.clear();
                              descriptionController.clear();
                            });
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add, size: 30),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: tasks.isEmpty == true
          ? Center(
              child: TextButton(
                child: Text(
                  "Add new task",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 600,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Text(
                              "Add new task",
                              style: TextStyle(fontSize: 28),
                            ),
                            TextFormField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                hintText: "Title",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: descriptionController,
                              decoration: const InputDecoration(
                                hintText: "Description",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  addTask(titleController.text,
                                      descriptionController.text);
                                  Navigator.of(context).pop();
                                  titleController.clear();
                                  descriptionController.clear();
                                });
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: isCompleted[index] == true
                      ? Text(
                          tasks[index],
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 25),
                        )
                      : Text(
                          tasks[index],
                          style: const TextStyle(fontSize: 25),
                        ),
                  leading: IconButton(
                    icon: isCompleted[index] == true
                        ? const Icon(
                            Icons.check_box,
                            size: 30,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        isCompleted[index] = !isCompleted[index];
                      });
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        removeTask(index);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  subtitle: isCompleted[index] == true
                      ? Text(
                          tasksDescription[index],
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15),
                        )
                      : Text(
                          tasksDescription[index],
                          style: const TextStyle(fontSize: 15),
                        ),
                );
              },
            ),
    );
  }
}
