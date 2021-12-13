import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FormDesignScreen extends StatefulWidget {
  const FormDesignScreen({Key key}) : super(key: key);

  @override
  _FormDesignScreenState createState() => _FormDesignScreenState();
}

class _FormDesignScreenState extends State<FormDesignScreen> {
  GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _address = TextEditingController();

  List<LanguageModel> _languageList = [
    LanguageModel("English", false),
    LanguageModel("Hindi", false),
    LanguageModel("Gujarati", false),
  ];

  List<HobbyModel> _hobbyList = [
    HobbyModel("Cricket", false),
    HobbyModel("Singing", false),
    HobbyModel("Travelling", false),
  ];

  String _genderRadioBtnVal = "Male";
  String _countryController;
  bool isLanguageSelected = false;
  bool isHobbySelected = false;
  bool isTerms = false;
  bool isPrivacy = false;
  bool isTermsSelected = false;
  bool isPrivacySelected = false;
  int val = 1;
  String language = '';
  String hobby = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Design'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter name',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto slab',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.person),
                      enabled: true,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      // return (value != null && value.contains('0123456789'))
                      //     ? 'Please enter valid name'
                      //     : 'Name can not empty';
                      if (value.isEmpty) {
                        return 'Name can not empty';
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Please enter valid name';
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
                  //Email
                  TextFormField(
                    controller: _email,
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
                  //Address
                  TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter address',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto slab',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.location_on),
                      enabled: true,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                    validator: (value) {
                      // return (value != null && value.contains('0123456789'))
                      //     ? 'Please enter valid name'
                      //     : 'Name can not empty';
                      if (value.isEmpty) {
                        return 'Address can not empty';
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
                  //Gender
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: "Male",
                        groupValue: _genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("Male"),
                      Radio<String>(
                        value: "Female",
                        groupValue: _genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("Female"),
                      Radio<String>(
                        value: "Other",
                        groupValue: _genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("Other"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Country
                  DropdownButtonFormField(
                    value: _countryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (String val) {
                      setState(() {
                        if (val != null) {
                          _countryController = val;
                        }
                      });
                    },
                    items: <String>[
                      "India",
                      "Russia",
                      "Israel",
                      "USA",
                      "France",
                      "Australia",
                    ].map<DropdownMenuItem<String>>((String e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    validator: (value) {
                      print(value);
                      if (value == null) {
                        return 'Please select any one country';
                      }
                      return null;
                    },
                    hint: Text(
                      'Please chose country',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Language
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _languageList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Checkbox(
                              value: _languageList[index].isChecked,
                              onChanged: (val) {
                                _languageList[index].isChecked = val;
                                setState(() {});
                              },
                            ),
                            Text(_languageList[index].language),
                          ],
                        );
                      },
                    ),
                  ),
                  Visibility(
                      visible: isLanguageSelected,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Please select language",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  //Hobby
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _hobbyList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Checkbox(
                              value: _hobbyList[index].isChecked,
                              onChanged: (val) {
                                _hobbyList[index].isChecked = val;
                                setState(() {});
                              },
                            ),
                            Text(_hobbyList[index].hobby),
                          ],
                        );
                      },
                    ),
                  ),
                  Visibility(
                      visible: isHobbySelected,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Please select hobby",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  //Password
                  TextFormField(
                    controller: _password,
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
                  //Confirm Password
                  TextFormField(
                    controller: _confirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Enter confirm password',
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
                    textInputAction: TextInputAction.done,
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
                      if (value != _password.text) {
                        return "Password do not match";
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
                  //Term & condition
                  Row(
                    children: [
                      Checkbox(
                        value: isTerms,
                        onChanged: (val) {
                          isTerms = val;
                          setState(() {});
                        },
                      ),
                      Text("Agree terms & condition")
                    ],
                  ),
                  Visibility(
                      visible: isTermsSelected,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Please check terms & condition",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  //Privacy & policy
                  Row(
                    children: [
                      Checkbox(
                        value: isPrivacy,
                        onChanged: (val) {
                          isPrivacy = val;
                          setState(() {});
                        },
                      ),
                      Text("Privacy & policy.")
                    ],
                  ),
                  Visibility(
                      visible: isPrivacySelected,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Please check privacy & policy",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  //Submit button
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: buttonEnable,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto slab',
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonEnable() {
    bool isLanguageTrue =
        _languageList.any((element) => element.isChecked == true);
    if (!isLanguageTrue) {
      isLanguageSelected = true;
    } else {
      isLanguageSelected = false;
    }

    bool isHobbyTrue = _hobbyList.any((element) => element.isChecked == true);
    if (!isHobbyTrue) {
      isHobbySelected = true;
    } else {
      isHobbySelected = false;
    }

    if (!isTerms) {
      isTermsSelected = true;
    } else {
      isTermsSelected = false;
    }

    if (!isPrivacy) {
      isPrivacySelected = true;
    } else {
      isPrivacySelected = false;
    }

    if (_formState.currentState.validate() &&
        !isLanguageSelected &&
        !isHobbySelected &&
        !isTermsSelected &&
        !isPrivacySelected) {
      List lanList = [];
      _languageList.forEach((element) {
        if (element.isChecked == true) {
          lanList.add(element.language);
        }
      });
      language = lanList.join(', ');

      List hobbyList = [];
      _hobbyList.forEach((element) {
        if (element.isChecked == true) {
          hobbyList.add(element.hobby);
        }
      });
      hobby = hobbyList.join(', ');

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Display Data'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Name :- ${_name.text}",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Email :- ${_email.text}",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Address :- ${_address.text}",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Gender :- $_genderRadioBtnVal",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Country :- $_countryController",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "language :- $language",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "language :- $hobby",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Password :- ${_password.text}",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                  Text(
                    "Confirm Password :- ${_confirmPassword.text}",
                    style: TextStyle(
                      fontFamily: 'Roboto slab',
                    ),
                  ),
                ],
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          });
    }
    setState(() {});
  }

  void _handleGenderChange(String value) {
    setState(() {
      _genderRadioBtnVal = value;
      print(value);
    });
  }
}

class LanguageModel {
  String language;
  bool isChecked;

  LanguageModel(this.language, this.isChecked);
}

class HobbyModel {
  String hobby;
  bool isChecked;

  HobbyModel(this.hobby, this.isChecked);
}
