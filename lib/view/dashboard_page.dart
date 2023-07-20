import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zaki_shop/controller/cart_controller.dart';
import 'package:zaki_shop/controller/dashboard_controller.dart';
import 'package:zaki_shop/controller/home_controller.dart';
import 'package:zaki_shop/view/cart_page.dart';
import 'package:zaki_shop/view/home_page.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  final CartController cc = Get.put(CartController());
  final HomeController hc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.index.value,
          children: [
            HomePage(),
            CartPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xffe06d72),
          items: bottomItems(),
          onTap: controller.onChange,
          currentIndex: controller.index.value,
        ),
      );
    });
  }

  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.shopify), label: "Cart"),
    ];
  }
}
