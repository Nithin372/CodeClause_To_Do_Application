class Todo {
  String? id;
  String? todotext;
  bool isdone;
  Todo({
    required this.id,
    required this.todotext,
    this.isdone = false,
  });
  static List<Todo> todolist() {
    return [
      Todo(id: '01', todotext: "Morning Gym", isdone: true),
      Todo(id: '02', todotext: "Morning Study hour", isdone: true),
      Todo(id: '03', todotext: "Internship Meeting", isdone: true),
      Todo(id: '04', todotext: "Lunch with Friends", isdone: true),
      Todo(id: '05', todotext: "Afternoon Study Hour", isdone: true),
      Todo(id: '06', todotext: "Chilling with Friends", isdone: true),
      Todo(id: '07', todotext: "Dinner with Family", isdone: true),
    ];
  }
}
