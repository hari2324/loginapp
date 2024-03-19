import 'package:flutter/material.dart';
import 'package:loginapp/fgtpwd.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignIn> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? pass;
  bool _visibile = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0,0.0,25.0,5.0),
        child: Expanded(
          child: Form(
            key:  formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.supervised_user_circle_rounded,size: 125,),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value,
                  decoration: const InputDecoration(
                    hintText: 'E-mail address',
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) => pass = value,
                  obscureText: _visibile,
                  decoration:  InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _visibile = !_visibile;
                          });
                        },
                      icon: Icon(_visibile ? Icons.visibility_off: Icons.visibility),),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => const  FgtPwd()),);
                      },
                      child: const Text('Forgot password?',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.end,
                  ))
                      ],
                  )
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print('Email: $email');
                      print('Password: $pass');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(211, 1, 196, 7),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(350, 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  child: const Text('Login',),)
                ],
            ),
          ),
        ),
      ),
    ));
  }
}