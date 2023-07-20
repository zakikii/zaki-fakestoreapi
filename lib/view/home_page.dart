import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:zaki_shop/controller/home_controller.dart';
import 'package:zaki_shop/view/detail_page.dart';
import 'package:zaki_shop/view/detail_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final CartController cc = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "welcome to zaki shop",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchItems();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Wrap(
            runSpacing: 20,
            children: [wSearch(context), wCategories(), wItemList(context)],
          ),
        ),
      ),
    );
  }

  Widget wSearch(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 226, 185, 187),
          borderRadius: BorderRadius.circular(20)),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 243, 225, 226)),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 16, bottom: 10, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find the best\nproduct for you",
                    style: TextStyle(
                        color: Color(0xffe06d72),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_sharp,
                          color: Color(0xff757575),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search what you need",
                          style: TextStyle(color: Color(0xff757575)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wCategories() {
    return Obx(() => SizedBox(
          height: 30.0.sp,
          child: ListView.builder(
              itemCount: controller.categoryItems.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffBDBDBD), width: 0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          controller.categoryItems[index].toString(),
                          style: TextStyle(
                              fontSize: 10.0.sp, color: Color(0xff616161)),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
        ));
  }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => controller.loading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: controller.itemItems.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
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
                        controller.itemItems[index].image,
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
                            Text(controller.itemItems[index].title),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.itemItems[index].price.toString() +
                                      " \$",
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      color: Color(0xffe06d72),
                                      fontWeight: FontWeight.bold),
                                ),
                                FloatingActionButton(
                                  backgroundColor: Color(0xffe06d72),
                                  onPressed: () {
                                    cc.addToCart(controller.itemItems[index]);
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 20,
                                  ),
                                  mini: true,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  heroTag: null,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.to(() => ProductPage(), arguments: [index]);
                },
              );
            }));
  }
}
