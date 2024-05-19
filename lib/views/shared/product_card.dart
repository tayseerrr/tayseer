import 'package:application/utilities/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      this.title = "title",
      required this.imageLink,
      this.imageWidth,
      this.imageHeight,
      this.price = "99",
      this.height = 380,
      this.width = 350, this.onTap});

  final String title;
  final String imageLink;
  final String price;
  final double height;
  final double width;
  final double? imageWidth;
  final double? imageHeight;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height+50,
        width: width,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Get.theme.primaryColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: imageWidth ?? width,
              height: imageHeight ?? width * 0.6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageLink.makeLink()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            Text(
              title.shorten(30),
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
              ),
            ).paddingOnly(left: 3,right: 3),
            Divider(
              color: Get.theme.primaryColor,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        const TextSpan(
                          text: ' ر.س',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        const TextSpan(
                          text: '\nشامل القيمة المضافة',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Get.theme.primaryColor,
                    size: 24,
                  ),
                ),
              ],
            ).paddingOnly(bottom: 10,left: 5,right: 5),
          ],
        ),
      ),
    );
  }
}
