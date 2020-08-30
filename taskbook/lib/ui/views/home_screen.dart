import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbook/business_logic/models/todo.dart';
import 'package:taskbook/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:taskbook/router.dart';
import 'package:taskbook/services/service_locator.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel viewModel = serviceLocator<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(
      create: (context) => serviceLocator<HomeScreenViewModel>(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await model.userLogout();
                  removeEverythingPushLogin(context);
                },
              ),
            ],
            title: Text('Todos'),
          ),
          body: Center(
            child: StreamBuilder(
              stream: model.getTodos(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/empty_box.png'),
                      Text('No data to show!!'),
                    ],
                  );
                } else if (snapshot.hasData) {
                  return _buildListview(snapshot.data);
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => openCreateTodoScreen(context),
          ),
        ),
      ),
    );
  }

  Widget _buildListview(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.blue[100],
            child: ListTile(
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  viewModel.deleteTodo(todos[index]);
                },
              ),
              leading: todos[index].isComplete
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              onTap: () {
                Todo todo = todos[index];
                todo.isComplete = !todos[index].isComplete;
                viewModel.updateTodo(todo);
              },
              title: Text('${todos[index].title}'),
              subtitle: Text('${todos[index].details}'),
            ),
          ),
        );
      },
    );
  }
}
