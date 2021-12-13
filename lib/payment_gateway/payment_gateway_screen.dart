import 'package:flutter/material.dart';
import 'package:project_app/payment_gateway/paypal_payment_screen.dart';
import 'package:project_app/payment_gateway/stripe_payment_screen.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({Key key}) : super(key: key);

  @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => StripPaymentScreen()));
                },
                label: Text('Strip Payment'),
                icon: Icon(Icons.paid),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => PaypalPaymentScreen()));
                },
                label: Text('Paypal Payment'),
                icon: Icon(Icons.paid),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Roboto slab',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
