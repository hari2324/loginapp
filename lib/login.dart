import 'package:flutter/material.dart';
import 'package:loginapp/Signin.dart';
import 'package:loginapp/signup.dart';

void main(){
  runApp(const InitialPage());
}

class InitialPage extends StatelessWidget{
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0,50.0,25.0,5.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.supervised_user_circle_rounded,size: 175,),
              const Text('Listen audiobooks in tamil anywhere',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(350, 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.network('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.xYm-VIDJ4RDBprBbydEDZAHaHa%26pid%3DApi&f=1&ipt=5f825eb09dc54e755bb84c5d38ac31118b247b45180ac38dc330b7d37e1b2ef4&ipo=images',fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(width: 25,),
                    const Text('Sign in with Google',),],
                  ),
              ),
              const SizedBox(height: 20,),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                ),
                const Text("Or"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                ),
              ]),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(211, 1, 196, 7),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  SignUp()),);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 25,),
                    Text('Sign up with email',),
                  ],
                )
                ),
                const SizedBox(height: 20,),
                Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already Have An Account?',
                    style: TextStyle(fontSize: 12),
                ),
                TextButton(onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  SignIn()),);
                } , child: const Text(' Login Here', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                ],
                )
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25.0,175.0,25.0,0),
                child: Text('By creating an account, I accept Almost Everything\'s \n Terms of Service & Privacy Policy',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Color.fromARGB(255, 62, 59, 59)),textAlign: TextAlign.center,),
              ),
              ],
          ),
        ),
      ),
    ));
  }
}