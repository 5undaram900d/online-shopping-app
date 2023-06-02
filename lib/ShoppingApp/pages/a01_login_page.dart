
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/utils/a08_routes.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/widgets/a03_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login.png", fit: BoxFit.fitWidth,),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome $drawerName to FortuneArrt Led Lighting hyderabad', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Name",
                        hintText: "Enter full name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name can't be Empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        drawerName = value;
                        setState(() {

                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username can't be Empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        drawerEmail = value;
                        setState(() {

                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can't be Empty";
                        }
                        else if(value.length < 6){
                          return "password should have atleast 6 letter";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40,),

                    Material(
                      color: context.theme.floatingActionButtonTheme.backgroundColor,
                      // conditional statement when changeButton = true then borderRadius = 25 otherwise 8
                      borderRadius: BorderRadius.circular(changeButton ? 25 : 8),
                      child: InkWell(
                        splashColor: Colors.pink,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          // Conditional statement when changeButton = true then width = 45 otherwise 120
                          width: changeButton ? 45 : 120,
                          height: 45,
                          alignment: Alignment.center,
                          // conditional statement when changeButton = true then show Icon.done otherwise show LoginTextButton
                          child: changeButton ? const Icon(Icons.done, color: Colors.white,) : const Text('Login', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }


  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 450));
      /// After 450 millisecond move in the next page
      // await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => A02_HomePage()));
      await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

}
