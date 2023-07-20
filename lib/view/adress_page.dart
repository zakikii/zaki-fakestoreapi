import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:zaki_shop/view/payment_page.dart';

class AddressPage extends StatefulWidget {
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final controller = Get.find<CartController>();

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
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
            Get.to(() => PaymentPage());
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
                    'Payment',
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
                'ADDRESS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            wTextField("Delivery", Icons.map_outlined),
            SizedBox(
              height: 5,
            ),
            wTextField("City", Icons.location_city_outlined),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.45,
                    child:
                        wTextField("State", Icons.local_post_office_outlined)),
                SizedBox(
                    width: size.width * 0.45,
                    child: wTextField("Zip", Icons.folder_zip_outlined)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RoundCheckBox(
                      checkedColor: Color(0xffe06d72),
                      size: 30,
                      onTap: (selected) {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Billing address same as delivery',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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
          hintText: hint,
        ),
        onChanged: (text) {
          // setState(() {
          //   UserName = text;
          //   //you can access nameController in its scope to get
          //   // the value of text entered as shown below
          //   //UserName = nameController.text;
          // });
        },
      ),
    );
  }
}
