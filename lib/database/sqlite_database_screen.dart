import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/database/database_helper.dart';
import 'package:project_app/database/display_databse_screen.dart';

class SqliteDatabaseScreen extends StatefulWidget {
  const SqliteDatabaseScreen({Key key}) : super(key: key);

  @override
  _SqliteDatabaseScreenState createState() => _SqliteDatabaseScreenState();
}

class _SqliteDatabaseScreenState extends State<SqliteDatabaseScreen> {
  GlobalKey<FormState> _formLoginState = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  TextEditingController _lemail = TextEditingController();
  TextEditingController _lpassword = TextEditingController();
  List<Map> allRows = [];
  DatabaseHelper helper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sqlite Database"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Form(
          key: _formLoginState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      color: Colors.grey,
                      offset: Offset(0.5, 1),
                    ),
                  ],
                  letterSpacing: 0.8,
                  fontFamily: 'Roboto slab',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Email
              TextFormField(
                controller: _lemail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter email',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto slab',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.mail),
                  enabled: true,
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email can not empty';
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                style: TextStyle(
                  fontFamily: 'Roboto slab',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Password
              TextFormField(
                controller: _lpassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto slab',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  enabled: true,
                  errorMaxLines: 2,
                ),
                textInputAction: TextInputAction.next,
                obscureText: true,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password can not empty';
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password should contains at least One upper case letter and one digit and one special character.';
                  }
                  return null;
                },
                style: TextStyle(
                  fontFamily: 'Roboto slab',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formLoginState.currentState.validate()) {
                      insertData();
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => DisplayDatabaseScreen())),
                  icon: Icon(
                    Icons.tv,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Display All Data",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  insertData() async {
    allRows = await helper.getEmail(_lemail.text);

    Map<String, String> data = {
      DatabaseHelper.columnEmail: _lemail.text,
      DatabaseHelper.columnPassword: _lpassword.text,
    };

    if (allRows.isNotEmpty) {
      if (allRows[0]['Email'] == _lemail.text) {
        print(allRows[0]['Email']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Duplicate Email'),
        ));
      }
    } else {
      final id = helper.insert(data);
      print("Inserted Row ID is :- $id");

      _lemail.clear();
      _lpassword.clear();

      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => DisplayDatabaseScreen()));
    }
  }
}
