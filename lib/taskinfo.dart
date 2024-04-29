List tasks = [];
List tasksDescription = [];
List isCompleted = [];

void addTask(String task, String taskDescription) {
  tasks.add(task);
  tasksDescription.add(taskDescription);
  isCompleted.add(false);
}

void removeTask(int index) {
  tasks.removeAt(index);
  tasksDescription.removeAt(index);
  isCompleted.removeAt(index);
}
