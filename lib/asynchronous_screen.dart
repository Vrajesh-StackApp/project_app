import 'package:flutter/material.dart';

class AsynchronousScreen extends StatefulWidget {
  const AsynchronousScreen({Key key}) : super(key: key);

  @override
  _AsynchronousScreenState createState() => _AsynchronousScreenState();
}

class _AsynchronousScreenState extends State<AsynchronousScreen> {
  int price;
  String name = 'Data';

  Future fetchUserOrder() {
    return Future.delayed(Duration(seconds: 2), () => print("DATA"));
  }

  Future<User> getUser() async {
    return User(1, 101, "Vrajesh");
  }

  Future<Order> getOrder(uid) async {
    var user = await getUser();
    if (user.uid == uid) {
      return Future.delayed(
          Duration(seconds: 2), () => Order(101, 1001, "Samsung m32"));
    } else {
      return Future.delayed(
          Duration(seconds: 2), () => Order(101, 1001, "Samsung m32"));
    }
  }

  Future<Product> getProduct(pid) async {
    var order = await getOrder(pid);
    if (order.pid == pid) {
      return Future.delayed(Duration(seconds: 3), () => Product(1001, 14999));
    }
    return null;
  }

  Future getProductCostForUser() async {
    var user = await getUser();

    var order = await getOrder(user.uid);

    var product = await getProduct(order.pid);

    price = product.productCost;

    setState(() {});
    print(product.productCost);
  }

  Future gettingData() async {
    Future.delayed(
        Duration(seconds: 2),
        () => setState(() {
              name = "Getting Data...";
            }));
  }

  Future getName() async {
    Future.delayed(
        Duration(seconds: 4),
        () => setState(() {
              name = "Vrajesh";
            }));
  }

  Future getString() async {
    await gettingData();
    print("Hello");
    await getName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Asynchronous"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      getString();
                      print('Getting Data...');
                    },
                    label: Text('Asynchronous'),
                    icon: Icon(Icons.touch_app),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      primary: Colors.blue,
                      elevation: 5,
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(width: 1, color: Colors.white),
                      ),
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Roboto slab',
                      ),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: 'Roboto slab'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  int uid;
  int oid;
  String name;
  User(this.uid, this.oid, this.name);
}

class Order {
  int oid;
  int pid;
  String orderName;
  Order(this.oid, this.pid, this.orderName);
}

class Product {
  int pid;
  int productCost;
  Product(this.pid, this.productCost);
}
