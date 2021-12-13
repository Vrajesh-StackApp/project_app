import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/database/database_helper.dart';

class DisplayDatabaseScreen extends StatefulWidget {
  const DisplayDatabaseScreen({Key key}) : super(key: key);

  @override
  _DisplayDatabaseScreenState createState() => _DisplayDatabaseScreenState();
}

class _DisplayDatabaseScreenState extends State<DisplayDatabaseScreen> {
  GlobalKey<FormState> _fState = GlobalKey();
  TextEditingController _updateEmail = TextEditingController();
  TextEditingController _updatePassword = TextEditingController();
  List<Map> allRows = [];
  DatabaseHelper helper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  getAllData() async {
    allRows = await helper.displayAllData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Display Data"),
      ),
      body: ListView.builder(
        itemCount: allRows.length,
        itemBuilder: (context, index) {
          print('builder ${allRows.length}');

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          allRows[index]['Email'],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto slab',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          allRows[index]['Password'],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto slab',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _updateEmail.text = allRows[index]['Email'];
                          _updatePassword.text = allRows[index]['Password'];

                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontFamily: 'Roboto slab',
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Form(
                                  key: _fState,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        controller: _updateEmail,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          hintText: 'Enter email',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Roboto slab',
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          prefixIcon: Icon(Icons.mail),
                                          enabled: true,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        controller: _updatePassword,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          hintText: 'Enter password',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Roboto slab',
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: Icon(Icons.visibility),
                                          enabled: true,
                                          errorMaxLines: 2,
                                        ),
                                        textInputAction: TextInputAction.next,
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: double.infinity,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.cancel,
                                                  color: Colors.white,
                                                ),
                                                label: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(left: 5),
                                              width: double.infinity,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  if (_fState.currentState
                                                      .validate()) {
                                                    Map<String, String> data = {
                                                      DatabaseHelper
                                                              .columnEmail:
                                                          _updateEmail.text,
                                                      DatabaseHelper
                                                              .columnPassword:
                                                          _updatePassword.text
                                                    };

                                                    helper.updateData(
                                                        allRows[index]['_id'],
                                                        data);
                                                    getAllData();
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.update,
                                                  color: Colors.white,
                                                ),
                                                label: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          helper.deleteRecord(allRows[index]["_id"]);
                          getAllData();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
