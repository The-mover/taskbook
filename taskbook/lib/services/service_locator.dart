import 'package:get_it/get_it.dart';
import 'package:taskbook/business_logic/view_models/login_viewmodel.dart';
import 'package:taskbook/business_logic/view_models/signup_viewmodel.dart';
import 'package:taskbook/services/auth_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());

  serviceLocator.registerFactory<SignupViewModel>(() => SignupViewModel());
  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
}
