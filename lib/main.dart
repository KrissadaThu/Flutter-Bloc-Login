import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_responce/Login/Models/loginModel.dart';
import 'package:ui_responce/Login/bloc/login_bloc.dart';
import 'package:ui_responce/Login/bloc/login_event.dart';
import 'package:ui_responce/Login/bloc/login_state.dart';
import 'package:ui_responce/bloc/counter_bloc.dart';
import 'package:ui_responce/bloc/counter_event.dart';
import 'package:ui_responce/bloc/counter_state.dart';
import 'package:ui_responce/bloc/models/todos.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
        child: LoginForm(),
      ),
    );
  }
}

// class home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
//     return Scaffold(
//       body: BlocBuilder<CounterBloc, CounterState>(
//           builder: (BuildContext context, state) {
//         if (state is getDecrement) {
//           final item = (state.wordDe as TodosModel);
//           return Center(
//             child: Text('${item.id}', style: TextStyle(fontSize: 24.0)),
//           );
//         } else if (state is getIncrement) {
//           final item = (state.wordIn as TodosModel);
//           return Center(
//             child: Text('${item.name}', style: TextStyle(fontSize: 24.0)),
//           );
//         } else {
//           return Center(
//             child: new CircularProgressIndicator(),
//           );
//         }
//       }),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 final item = TodosModel(id: 1, name: 'NK');
//                 counterBloc.add(Increment(item: item));
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: Icon(Icons.remove),
//               onPressed: () {
//                 final item = TodosModel(id: 2, name: 'Nake');
//                 counterBloc.add(Decrement(item: item));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class LoginForm extends StatefulWidget{
  @override
  _myLoginForm createState() => _myLoginForm();
}
class _myLoginForm extends State<LoginForm>
{
   final txtEmail = TextEditingController();
  final txtPass = TextEditingController();
  final txtResult = TextEditingController();

  //final LoginModel  user = new LoginModel(email: txtEmail.text, pass: txtPass.text);

  @override
  Widget build(BuildContext context) {
     final LoginBloc loginBloc = context.bloc<LoginBloc>();
     return Scaffold(
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 63.0,
              ),
              //text title app
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 28.0),
                ),
              ),
              Expanded(
                  child: new Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100.0))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 33.0,
                      ),
                      TextField(
                        controller: txtEmail,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Email",
                            contentPadding: EdgeInsets.all(2.0),
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        controller: txtPass,
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(2.0),
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (BuildContext context, state) {
                          return TextField(
                            decoration: InputDecoration(
                                hintText: '${state}',
                                counterText: '${state}',
                                contentPadding: EdgeInsets.all(2.0),
                                icon: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                )),
                          );
                        },
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      FlatButton(
                          onPressed: () {
                            final LoginModel  user = new LoginModel(email: txtEmail.text, pass: txtPass.text);
                            loginBloc.add(LoginClick(userInfo: user));
                          },
                          child: Text('Login'))
                    ],
                  ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
  }


   

