// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database/auth/service.dart';
import 'package:toast/toast.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  TextEditingController email_contl = TextEditingController();
  TextEditingController password_contl = TextEditingController();
  AuthService authService = AuthService();
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: email_contl,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: password_contl,
                  obscureText: !visibility,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: !visibility
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.55,
                child: ElevatedButton(
                  child: const Text('Войти'),
                  onPressed: () async {
                    if (email_contl.text.isEmpty || password_contl.text.isEmpty) {
                      Toast.show("Заполните поля");
                    } 
                    else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      var user = await authService.signIn(email_contl.text, password_contl.text);
                      if(user != null){
                        Toast.show("Успешно!");
                        Navigator.popAndPushNamed(context, '/');
                      }
                      else{
                        Toast.show("Нет пользователя с такими данными");
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              InkWell(
                highlightColor: Colors.white,
                onTap: () {
                  Navigator.popAndPushNamed(context, '/reg');
                },
                child: const Text('Нет аккаунта? Регистрация'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
