import 'package:flutter/material.dart';

class DeliveryRequestCard extends StatelessWidget {
  const DeliveryRequestCard(
      {super.key, required this.name, required this.product, this.onTap});

  final String name;

  final String product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 4,
        ),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          color: const Color(
            0xFF515E7D,
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              child: Image(
                image: AssetImage(
                  'assets/icons/avatar.png',
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // لابتوب  ماك بوك
                SizedBox(
                  width: 200,
                  child: Text(
                    product,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
