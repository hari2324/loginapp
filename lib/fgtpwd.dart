import 'package:flutter/material.dart';

class FgtPwd extends StatefulWidget {
  const FgtPwd({super.key});

  @override
  State<FgtPwd> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FgtPwd> {

  final _formkey =GlobalKey<FormState>();
  String? email;
  String? user;
  String? pass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back))),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(25.0,0.0,25.0,10.0),
        child: Expanded(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text('Tell us your email address',style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
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
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    _formkey.currentState!.save();
                    print('Email: $email');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(211, 1, 196, 7),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                child: const Text('send',),)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}