import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/auth/service.dart';
import 'package:flutter_application_1/database/auth/users_collection.dart';
import 'package:toast/toast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool passwordVisibility = false;
  bool passwordConfirmVisibility = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  AuthService auth = AuthService();
  UsersCollection users = UsersCollection();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
 body: 
      Center(
        child:SingleChildScrollView( 
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',width: MediaQuery.of(context).size.width*0.5, height: MediaQuery.of(context).size.height*0.2,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: nameController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Никнейм',
                  hintText: 'Никнейм',
                  hintStyle:const TextStyle(
                    color: Colors.white54,
                  ),
                  labelStyle:const TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  prefixIcon:const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: emailController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  hintStyle:const TextStyle(
                    color: Colors.white54,
                  ),
                  labelStyle:const TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  prefixIcon:const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: phoneController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Телефон',
                  hintText: 'Телефон',
                  hintStyle:const TextStyle(
                    color: Colors.white54,
                  ),
                  labelStyle:const TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  prefixIcon:const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                obscureText: !passwordVisibility,
                controller: passwordController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Пароль',
                  hintStyle:const TextStyle(
                    color: Colors.white54,
                  ),
                  labelStyle:const TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  prefixIcon:const Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: !passwordVisibility ?
                     const Icon(Icons.visibility):
                     const Icon(Icons.visibility_off),
                      onPressed: (){
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                obscureText: !passwordConfirmVisibility,
                controller: passwordConfirmController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Подтвердить пароль',
                  hintText: 'Пароль',
                  hintStyle:const TextStyle(
                    color: Colors.white54,
                  ),
                  labelStyle:const TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color:Colors.white),
                  ),
                  prefixIcon:const Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: !passwordConfirmVisibility ?
                     const Icon(Icons.visibility):
                     const Icon(Icons.visibility_off),
                      onPressed: (){
                      setState(() {
                        passwordConfirmVisibility = !passwordConfirmVisibility;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.55,
              child: ElevatedButton(child:const Text('Зарегистрироваться') ,
              onPressed: () async {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passwordConfirmController.text.isEmpty) {
                      Toast.show('Заполните поля');
                    } else {
                      if (passwordConfirmController.text == passwordController.text) {
                        var usersVar = await auth.signUp(                               
                            emailController.text, passwordController.text);
                        if (usersVar != null) {
                          await users.addUserCollection(
                              usersVar.id!,
                              emailController.text,
                              phoneController.text,
                              nameController.text,
                              passwordController.text);
                        } else {
                          Toast.show('Проверьте правильность данных');
                        }
                      } else {
                        Toast.show('Пароли не совпадают');
                      }
                    }
                  },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            InkWell(
              highlightColor: Colors.white,
              onTap: (){
                Navigator.popAndPushNamed(context, '/');
              },
              child:const Text('Есть аккаунт? Войти'),
            )
          ],
        ),
      ),
      ),
    );
  }
}