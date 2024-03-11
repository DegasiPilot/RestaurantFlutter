import 'package:flutter_application_1/pages/auth_page.dart';
import 'package:flutter_application_1/pages/reg_page.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/landing.dart';

final routes = {
  '/':(context)=>const LandingPage(),
  '/auth': (context)=>const Authpage(),
  '/reg': (context)=>const RegistrationPage(),
  '/home': (context)=>const HomePage(),
};