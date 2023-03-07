import 'package:flutter/material.dart';

import '../Utility/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool val = false;
  final _formkey = GlobalKey<FormState>();
  bool valueButton = false;

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      await Future.delayed(
        Duration(seconds: 1),
      );
      setState(() {
        val = true;
        valueButton = true;
      });
      // Wait for one second and then get to the another page
      await Future.delayed(
        Duration(seconds: 1),
      );
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        // to reset the button state for ios if they back to the login page
        val = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          // by doing this you attach these form field to the keys
          child: Column(
            children: [
              Image.asset('assets/images/hey.png', fit: BoxFit.contain),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pls Enter the Username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pls Enter the Password";
                        } else if (value.length < 6) {
                          return "Length of password should be greater than 6";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Material(
                color: valueButton ? Colors.green : Colors.deepPurple,
                borderRadius: BorderRadius.circular(2),
                child: InkWell(
                  // this is property which can be used to make button which is not act lke button this provide  a option for the button to be act like a tapable buttonm
                  splashColor: Colors.red,
                  // this work only well with Ink class wrap elements
                  onTap: () => movetoHome(context),
                  child: AnimatedContainer(
                    //AnimatedContainer in place of this you can use Ink to work well with inkwell class
                    duration: Duration(seconds: 1),

                    width: val ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: val
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              )
              // ElevatedButton
              //   onPressed: () {
              //     //TODO add action on button press Login
              //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
              //   },
              //   child: Text(
              //     "Login",
              //     style: TextStyle(fontSize: 20, letterSpacing: 2),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size.fromHeight(40),
              //     // fromHeight use double.infinity as width and 40 is the height
              //   ),
              // )
            ],
          ),
        )));
  }
}
