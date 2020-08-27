import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbook/business_logic/models/todo.dart';
import 'package:taskbook/business_logic/view_models/create_todo_viewmodel.dart';
import 'package:taskbook/services/service_locator.dart';
import 'package:taskbook/ui/shared/buttons/primary_button.dart';

class CreateTodoScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateTodoViewModel>(
      create: (context) => serviceLocator<CreateTodoViewModel>(),
      child: Consumer<CreateTodoViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Add Todo'),
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _detailsController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Details',
                  ),
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  label: 'Add Todo',
                  onPressed: () async {
                    String title = _titleController.text.trim();
                    String details = _detailsController.text.trim();
                    Todo todo = Todo(title: title, details: details);
                    await model.addTodo(todo);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
