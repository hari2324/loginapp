import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUp> {

  final _formkey =GlobalKey<FormState>();
  String? email;
  String? user;
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
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Tell us a bit more about yourself',style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Field can\'t be left blank';
                    }
                    return null;
                  },
                  onSaved: (value) =>user = value,
                  decoration: const InputDecoration(
                    hintText: 'Enter name',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Field can\'t be left blank';
                    }
                    if(!value.contains('@')){
                      return 'Enter a valid email id';
                    }
                    return null;
                  },
                  onSaved: (value) =>email = value,
                  decoration: const InputDecoration(
                    hintText: 'E-mail address',
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Field can\'t be left blank';
                    }
                    return null;
                  },
                  onSaved: (value) =>pass = value,
                  obscureText: _visibile,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _visibile = !_visibile;
                          });
                        },
                      icon: Icon(_visibile ? Icons.visibility_off: Icons.visibility),)
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(211, 1, 196, 7),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(350, 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  onPressed: () {
                    if(_formkey.currentState!.validate()){
                      _formkey.currentState!.save();
                      print('Email: $email');
                    }
                  },
                  child: const Text('Sign up',),)
                ],
            ),
          ),
        ),
      ),
    ));
  }
}