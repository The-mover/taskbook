import 'package:flutter/material.dart';
import 'package:taskbook/ui/utils/fade_in_route.dart';
import 'package:taskbook/ui/views/login_screen.dart';
import 'package:taskbook/ui/views/signup_screen.dart';
import 'package:taskbook/ui/views/splash_screen.dart';

typedef RouterMethod = PageRoute Function(RouteSettings, Map<String, String>);

/*
* Page builder methods
*/

final Map<String, RouterMethod> _definitions = {
  '/': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return SplashScreen();
      },
    );
  },
  '/login': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return LoginScreen();
      },
    );
  },
  '/signup': (settings, _) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return SignupScreen();
      },
    );
  }
};

Map<String, String> _buildParams(String key, String name) {
  final uri = Uri.parse(key);
  final path = uri.pathSegments;
  final params = Map<String, String>.from(uri.queryParameters);

  final instance = Uri.parse(name).pathSegments;
  if (instance.length != path.length) {
    return null;
  }

  for (int i = 0; i < instance.length; ++i) {
    if (path[i] == '*') {
      break;
    } else if (path[i][0] == ':') {
      params[path[i].substring(1)] = instance[i];
    } else if (path[i] != instance[i]) {
      return null;
    }
  }
  return params;
}

Route buildRouter(RouteSettings settings) {
  for (final entry in _definitions.entries) {
    final params = _buildParams(entry.key, settings.name);
    if (params != null) {
      print('Visiting: ${settings.name} as ${entry.key}');
      return entry.value(settings, params);
    }
  }

  print('<!> Not recognized: ${settings.name}');
  return FadeInRoute(
    settings: settings,
    builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            '"${settings.name}"\nYou should not be here!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    },
  );
}

void openSignupPage(BuildContext context) {
  Navigator.of(context).pushReplacementNamed("/signup");
}

void openLoginPage(BuildContext context) {
  Navigator.of(context).pushReplacementNamed("/login");
}

// void openMainPage(BuildContext context) {
//   Navigator.of(context).pushReplacementNamed("/main");
// }
