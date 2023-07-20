import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:zaki_shop/view/dashboard_page.dart';
import 'package:zaki_shop/view/home_page.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final controller = Get.find<CartController>();

  double total = 0;

  hitungTotal() {
    for (var i = 0; i < controller.items.length; i++) {
      total = total + controller.items[i].price;
    }
  }

  checkout() {
    controller.deleteAlltem();
    Get.off(() => DashboardPage());
    Dialogs.materialDialog(
      context: context,
      color: Colors.white,
      msg: 'your transaction is success',
      title: 'Transaction Succes',
      lottieBuilder: LottieBuilder.asset(
        'assets/success.json',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    hitungTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: wItemList(context),
      ),
    );
  }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Dialogs.materialDialog(
              context: context,
              color: Colors.white,
              msg: 'Are u sure to pay this ?',
              title: 'PAYMENT',
              lottieBuilder: LottieBuilder.asset(
                'assets/ask.json',
                fit: BoxFit.contain,
              ),
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'No',
                  iconData: Icons.cancel_outlined,
                  // color: Color(0xffe06d72),
                  textStyle: TextStyle(color: Colors.grey),
                  iconColor: Colors.grey,
                ),
                IconsButton(
                  onPressed: () {
                    checkout();
                  },
                  text: 'Yes',
                  iconData: Icons.done,
                  color: Color(0xffe06d72),
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            );
          },
          child: Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xffe06d72),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'PAYMENT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            wTextField("Card Number", Icons.paypal_outlined),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.45,
                    child: wTextField(
                        'Expiration', Icons.data_exploration_rounded)),
                SizedBox(
                    width: size.width * 0.45,
                    child: wTextField('S Code', Icons.security_outlined)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'SubTotal : ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0), // Margin kanan untuk ikon panah
                    child: Text(
                      total.toString() + " \$",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Taxes : ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0), // Margin kanan untuk ikon panah
                    child: Text(
                      "0 \$",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Total : ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0), // Margin kanan untuk ikon panah
                    child: Text(
                      total.toString() + " \$",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget wTextField(String hint, IconData icon) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xfff3f3f3), borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(bottom: 20),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(icon),
              hintText: hint),
          onChanged: (text) {
            // setState(() {
            //   UserName = text;
            //   //you can access nameController in its scope to get
            //   // the value of text entered as shown below
            //   //UserName = nameController.text;
            // });
          },
        ));
  }
}
