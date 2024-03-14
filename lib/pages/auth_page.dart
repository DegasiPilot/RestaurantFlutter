import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child:SingleChildScrollView( 
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',width: MediaQuery.of(context).size.width*0.5, height: MediaQuery.of(context).size.height*0.3,),
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
                obscureText: !visibility,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
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
                  suffixIcon: 
                    IconButton(
                      icon: !visibility ?
                     const Icon(Icons.visibility):
                     const Icon(Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          visibility = !visibility;
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
              child: ElevatedButton(onPressed:(){
                Navigator.popAndPushNamed(context, '/home');
              } ,
              child:const Text('Войти') ,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            InkWell(
              highlightColor: Colors.white,
              onTap: (){
                Navigator.popAndPushNamed(context, '/reg');
              },
              child:const Text('Нет аккаунта? Регистрация'),
            )
          ],
        ),
      ),
      ),
    );
  }
}