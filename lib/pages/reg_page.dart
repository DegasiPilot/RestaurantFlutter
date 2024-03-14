import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool passwordVisibility = false;
  bool passwordConfirmVisibility = false;

  @override
  Widget build(BuildContext context) {
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
              child: ElevatedButton(onPressed:(){} ,child:const Text('Зарегистрироваться') ,),
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