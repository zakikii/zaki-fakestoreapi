import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:zaki_shop/controller/home_controller.dart';
import 'package:zaki_shop/helper/marquee_widget.dart';
import 'package:sizer/sizer.dart';

class ProductPage extends StatelessWidget {
  final item = Get.find<HomeController>().getDetails(Get.arguments[0]);

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe06d72),
      appBar: AppBar(
        title: MarqueeWidget(
          child: Text(
            item.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xffe06d72),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$" + item.price.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15.0.sp),
            ),
            TextButton(
              onPressed: () {
                cartController.addToCart(item);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.shopify,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          width: double.infinity,
          child: Column(
            children: [
              Image.network(
                item.image,
                width: size.width / 2,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft, child: Text(item.category)),
              SizedBox(
                height: 10,
              ),
              Text(
                item.title,
                style:
                    TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_purple500_outlined,
                    color: Colors.amber,
                  ),
                  Text(item.rating.rate.toString()),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                item.description,
                style: TextStyle(fontSize: 10.0.sp),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
