import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../screens/screen_ecom_product_details.dart';

class ItemEcomProduct extends StatelessWidget {
  Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Get.to(ScreenEcomProductDetails(product: product));
      },
      child: Container(
        width: Get.width,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
              padding: EdgeInsets.all(5),
              height: 90,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                  child: Image.network(product.thumbnail,
                    fit: BoxFit.fill,
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(

                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: product.title.split(' ').take(2).join(' '), // Display the first two words
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      if (product.title.split(' ').length > 2)
                        TextSpan(text: ' ...', style: TextStyle(color: Colors.black)), // Ellipsis if more than two words
                    ],
                  ),
                ),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: product.description.split(' ').take(3).join(' '), // Display the first two words
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      if (product.description.split(' ').length > 2)
                        TextSpan(text: ' ...', style: TextStyle(color: Colors.grey)), // Ellipsis if more than two words
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  ItemEcomProduct({
    required this.product,
  });
}
