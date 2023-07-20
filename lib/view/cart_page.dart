import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:zaki_shop/controller/home_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:zaki_shop/view/checkout_page.dart';

class CartPage extends StatelessWidget {
  final controller = Get.find<CartController>();

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
    return Obx(() => controller.items.length == 0
        ? Center(
            child: Text("Empty"),
          )
        : Scaffold(
            bottomNavigationBar: Container(
              child: InkWell(
                onTap: () {
                  Get.to(() => CheckoutPage());
                },
                child: Container(
                  // width: size.width * 0.1,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xffe06d72),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.items[index].price
                                                .toString() +
                                            " \$",
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            color: Color(0xffe06d72),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: Color(0xffe06d72),
                                        onPressed: () {
                                          controller.deleteItem(
                                              controller.items[index]);
                                        },
                                        child: Icon(
                                          Icons.delete_forever,
                                          size: 20,
                                        ),
                                        mini: true,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        heroTag: null,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ]),
            )));
  }
}
