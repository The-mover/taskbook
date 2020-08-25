import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbook/business_logic/models/todo.dart';
import 'package:taskbook/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:taskbook/router.dart';
import 'package:taskbook/services/service_locator.dart';

class HomeScreen extends StatelessWidget {
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
            title: Text('Home Screen'),
          ),
          body: Center(
            child: StreamBuilder(
              stream: model.getTodos(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.data == null) {
                  return Text('Data is Empty!!');
                } else if (snapshot.hasData) {
                  return _buildListview(snapshot.data);
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              final todo =
                  Todo(title: 'Hello world', details: 'I love the world');
              model.addTodo(todo);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListview(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${todos[index].title}'),
          subtitle: Text('${todos[index].details}'),
        );
      },
    );
  }
}
