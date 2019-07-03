import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_app/data/moor_database.dart';

class NewTaskInput extends StatefulWidget {
  NewTaskInput({Key key}) : super(key: key);

  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime newTaskDate;
  TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[_buildTextField(context), _buildDateField(context)],
      ),
    );
  }

  Expanded _buildDateField(BuildContext context) {
    return Expanded(
      flex: 3,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(hintText: 'Task name'),
        onSubmitted: (inputName) {
          final database = Provider.of<AppDatabase>(context);
          final task = Task(
            name: inputName,
            dueDate: newTaskDate,
          );
          database.insert(task);
          resetValueAfterSubmit();
        },
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () async {
          newTaskDate = await showDatePicker(
              context: context,
              firstDate: DateTime(2010),
              initialDate: DateTime.now(),
              lastDate: DateTime(2050));
        },
      ),
    );
  }

  void resetValueAfterSubmit() {
    newTaskDate = null;
    textEditingController.clear();
  }
}
