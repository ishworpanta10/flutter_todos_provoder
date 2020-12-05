import 'package:flutter/material.dart';
import 'package:todo_provider/main.dart';
import 'package:todo_provider/widgets/add_todo_dialog.dart';
import 'package:todo_provider/widgets/completed_todo_list_item.dart';
import 'package:todo_provider/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    final _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined), label: 'Tasks'),
      BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Tasks')
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        items: _items,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddToDoDialog(),
            barrierDismissible: false,
          );
        },
        child: Icon(Icons.add),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.black,
      ),
      body: tabs[_selectedIndex],
    );
  }
}
