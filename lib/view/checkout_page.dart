import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:zaki_shop/controller/home_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:zaki_shop/view/adress_page.dart';
import 'package:zaki_shop/view/checkout_page.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final controller = Get.find<CartController>();

  double total = 0;

  hitungTotal() {
    for (var i = 0; i < controller.items.length; i++) {
      total = total + controller.items[i].price;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hitungTotal();
    // print('total' + total.toString());
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
            Get.to(() => AddressPage());
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
                    'Address',
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
            Center(
              child: Text(
                'CHECKOUT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                itemCount: controller.items.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFFFFF),
                              const Color(0xB0E7E9E7),
                            ],
                            begin: Alignment(0.2, 0.0),
                            end: Alignment(1.0, 0.0),
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Image.network(
                          controller.items[index].image,
                          width: size.width / 4,
                          height: size.width / 4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.items[index].title),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      controller.items[index].price.toString() +
                                          " \$",
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Color(0xffe06d72),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
                      'Total : ',
                      style: TextStyle(
                        color: Colors.grey,
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
}
