import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../models/product.dart';

class ScreenEcomProductDetails extends StatelessWidget {
  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
          onPressed: (){Get.back();},
        ),
        backgroundColor: Colors.white,
        title: Text(
          product.title, style: TextStyle(
          color: Colors.brown
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: product.images?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var url = product.images?[index] ?? "";

                return Hero(
                  tag: product.id.toString(),
                  child: Image.network(
                    url,
                    height: Get.height * .2,
                    width: Get.width * .3,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis, // Change to ellipsis
                    maxLines: 2, // Reduce the number of lines
                  ),
                  Text(
                    product.category,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text(
                "\$${product.price.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          Row(
            children: [
              RatingBarIndicator(
                rating: product.rating ?? 0,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
              ),
              Text("(${product.rating})"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            product.description,
            style: TextStyle(color: Colors.black, fontSize: 17),
            overflow: TextOverflow.visible,
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ).paddingSymmetric(horizontal: 18),
    );
  }

  ScreenEcomProductDetails({
    required this.product,
  });
}
