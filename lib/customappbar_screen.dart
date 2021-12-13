import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project_app/second_screen.dart';

class CustomAppBarScreen extends StatefulWidget {
  const CustomAppBarScreen({Key key}) : super(key: key);

  @override
  _CustomAppBarScreenState createState() => _CustomAppBarScreenState();
}

class _CustomAppBarScreenState extends State<CustomAppBarScreen> {
  GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController _name = TextEditingController();
  Map result = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: double.infinity,
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Name :- ${result['Name']}",
                style: TextStyle(
                  fontFamily: 'Roboto slab',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name can not empty';
                    }
                    // if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    //   return 'Please enter valid name';
                    // }
                    return null;
                  },
                  style: TextStyle(
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formState.currentState.validate()) {
                    result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            text: _name.text,
                          ),
                        ));
                    print(result);
                    setState(() {});
                  }
                  // _name.clear();
                },
                icon: Icon(Icons.send),
                label: Text('Go Next'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  elevation: 10,
                  primary: Colors.purple,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto slab',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, SecondScreen.id);
                },
                icon: Icon(Icons.send),
                label: Text('Go Navigator push name'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  elevation: 10,
                  primary: Colors.purple,
                  textStyle: TextStyle(
                    fontFamily: 'Roboto slab',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final Function onPress;
  final Function onTitleTap;

  const CustomAppBar({Key key, this.child, this.onPress, this.onTitleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "CustomAppBar",
                style: TextStyle(
                    fontFamily: 'Roboto slab',
                    fontSize: 20,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
