import 'package:get_it/get_it.dart';
import 'package:taskbook/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:taskbook/business_logic/view_models/login_viewmodel.dart';
import 'package:taskbook/business_logic/view_models/signup_viewmodel.dart';
import 'package:taskbook/business_logic/view_models/splash_screen_viewmodel.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/firestore_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // register lazy singleton
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator
      .registerLazySingleton<FirestoreService>(() => FirestoreService());

  // register factory
  serviceLocator.registerFactory<SignupViewModel>(() => SignupViewModel());
  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
  serviceLocator
      .registerFactory<HomeScreenViewModel>(() => HomeScreenViewModel());
  serviceLocator
      .registerFactory<SplashScreenViewModel>(() => SplashScreenViewModel());
}
