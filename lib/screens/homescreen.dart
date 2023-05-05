// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:to_do_app/constatnts/colors.dart';
import 'package:to_do_app/widgets/itemlist.dart';
import 'package:to_do_app/model/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final todoslist = Todo.todolist();
  List<Todo> _searchfound = [];
  final tocontroller = TextEditingController();

  @override
  void initState() {
    _searchfound = todoslist;
    super.initState();
  }

  void handlethechange(Todo todo) {
    setState(() {
      todo.isdone = !todo.isdone;
    });
  }

  void tododelete(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void additem(String toDo) {
    setState(() {
      todoslist.add(Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    tocontroller.clear();
  }

  void searchitem(String key) {
    List<Todo> solution = [];
    if (key.isEmpty) {
      solution = todoslist;
    } else {
      solution = todoslist
          .where((element) =>
              element.todotext!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchfound = solution;
    });
  }

  Widget searchGadget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => searchitem(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: tdblack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search for To-Do',
          hintStyle: TextStyle(color: tdgrey),
          fillColor: tdblue,
          iconColor: tdblue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: _buildAppbar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchGadget(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, bottom: 20, left: 100),
                          child: const Text(
                            'All To-DOs',
                            selectionColor: tdblue,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ),
                        for (Todo todoo in _searchfound.reversed)
                          ToDoItem(
                            todo: todoo,
                            todoischanged: handlethechange,
                            todeleteitem: tododelete,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: tocontroller,
                        decoration: const InputDecoration(
                          hintText: "Add a New TO-DO item",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdgrey,
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        additem(tocontroller.text);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: Colors.amberAccent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/av.jpg'),
          ),
        ),
        const Icon(
          Icons.menu,
          color: tdblack,
          size: 30,
        ),
      ],
    ),
  );
}
