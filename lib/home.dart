import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login_screen_ui/utils/constants.dart';
import 'package:flutter_login_screen_ui/utils/images.dart';
import 'package:flutter_login_screen_ui/utils/size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      Images.backgroundImage,
                      fit: BoxFit.cover,
                      color: Colors.white,
                      colorBlendMode: BlendMode.difference,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? SizedBox(
                                  height: 100,
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          Image.asset(
                            Images.flutterImage,
                            height: 20 * SizeConfig.imageSizeMultiplier,
                            width: 30 * SizeConfig.imageSizeMultiplier,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                height: SizeConfig.imageSizeMultiplier * 80,
                                width: SizeConfig.imageSizeMultiplier * 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextFormField(
                                      controller: _usernameController,
                                      autocorrect: false,
                                      autofocus: false,
                                      validator: (val) {
                                        if (val.isEmpty)
                                          return "Username cannot be empty";
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: Constants.usernameText,
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          contentPadding: EdgeInsets.all(10.0)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      autocorrect: false,
                                      autofocus: false,
                                      validator: (val) {
                                        if (val.isEmpty)
                                          return "Password cannot be empty";
                                        return null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: Constants.passwordText,
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Builder(
                                      builder: (context) => MaterialButton(
                                        onPressed: () {
                                          if (_passwordController.text != "" ||
                                              _usernameController.text != "")
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "${_usernameController.text} and ${_passwordController.text} just logged in!"),
                                            ));
                                        },
                                        splashColor: Colors.blue[900],
                                        minWidth: 120,
                                        padding: EdgeInsets.all(10),
                                        color: Colors.blue,
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
