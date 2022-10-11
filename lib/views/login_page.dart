import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/views/dashboard.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Image.asset('img/logo.png'),
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    showCursor: true,
                    cursorHeight: 15,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusColor: Colors.white,
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 19.0, color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Email cannot be empty";
                    //   }
                    //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    //       .hasMatch(value)) {
                    //     return ("Please enter a valid email");
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                ),

                //Password input field
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                      obscureText: isObscure,
                      style: const TextStyle(color: Colors.white),
                      showCursor: true,
                      cursorHeight: 15,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusColor: Colors.white,
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontSize: 19.0, color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              )))),
                ),

                //Forgot Password
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (context) => ForgotPass()));
                          },
                          child: const Text(
                            "Forgot Password ?",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                //Login Button
                //Added loading state
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });

                    signIn(_emailController.text.trim(),
                        _passwordController.text.trim());

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: isLoading
                            ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.blue,
                            backgroundColor: Colors.green,
                          ),
                        )
                            : const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        )),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                //SignUp Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context) => const SignupPage()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  


  Future<User> getCurrentUser() async {
    return await _auth.currentUser!;
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
      
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // i shouldnt be using BuildContexts across async gaps.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(
                            child: Text(
                              "Oops! Check your Credentials",
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ))
                      ],
                    ),
                  ),
                );
              });
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(
                            child: Text(
                          "No user found for that email.",
                          style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                        ))
                      ],
                    ),
                  ),
                );
              });
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {


    final path = Path();
    path.moveTo(size.width,size.height*0.5041800);
    path.quadraticBezierTo(size.width*0.8977429,size.height*0.7920600,size.width*0.8621857,size.height*0.8939600);
    path.quadraticBezierTo(size.width*0.8070286,size.height*1.0067800,size.width*0.6446857,size.height*0.9788200);
    path.lineTo(0,size.height*0.7872400);
    path.lineTo(0,0);
    path.lineTo(size.width,0);



    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}