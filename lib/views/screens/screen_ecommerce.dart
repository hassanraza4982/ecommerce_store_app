import 'package:ecommerce_store_app/views/layouts/item_ecom_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/ecommerce_controller.dart';

class ScreenEcommerce extends StatelessWidget {
  const ScreenEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EcommerceController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Store App", style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.w800,
          fontSize: 22
        ),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            children: controller.products.map((element) => ItemEcomProduct(product: element)).toList(),
            alignment: WrapAlignment.spaceBetween,
            spacing: 20,
          ),
        ),
      ),
    );
  }
}
