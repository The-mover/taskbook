import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                  // Todo: Logout here
                  await model.userLogout();
                  removeEverythingPushLogin(context);
                },
              ),
            ],
            title: Text('Home Screen'),
          ),
          body: Center(
            child: Text('Hello Home!'),
          ),
        ),
      ),
    );
  }
}
