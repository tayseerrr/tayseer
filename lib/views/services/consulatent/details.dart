import 'package:application/controllers/consulting.dart';
import 'package:application/core/consultant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConsultantDetailsView extends StatefulWidget {
  const ConsultantDetailsView({super.key, required this.consultant});

  final ConsultantModel consultant;

  @override
  State<ConsultantDetailsView> createState() => _ConsultantDetailsViewState();
}

class _ConsultantDetailsViewState extends State<ConsultantDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "تفاصيل المستشار",
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: Get.width * 0.25,
                height: Get.width * 0.25,
                decoration: BoxDecoration(
                  image: (widget.consultant.image.isNotEmpty &&
                          widget.consultant.image.startsWith('http'))
                      ? DecorationImage(
                          image: NetworkImage(widget.consultant.image),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage('assets/icons/avatar.png'),
                          fit: BoxFit.cover,
                        ),
                  color: const Color(0xFFCDE7EB),
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(
                    color: Get.theme.primaryColor,
                    width: 1,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Text(
                      widget.consultant.name,
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                      ),
                    ).paddingOnly(bottom: 10, right: 10),
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Row(
                      children: [
                        Text(
                          ' سنوات الخبرة: ',
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tajawal',
                          ),
                        ).paddingOnly(bottom: 10),
                        Text(
                          '${widget.consultant.experience} سنة',
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Tajawal',
                          ),
                        ).paddingOnly(bottom: 10),
                      ],
                    ),
                  ),

                ],
              ).paddingOnly(left: 10, top: 20, bottom: 10, right: 10),
            ],
          ).paddingOnly(top: 30, right: 10),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              // 515E7D
              color: const Color(0xFF515E7D),
              borderRadius: BorderRadius.circular(15),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'خبرته: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  TextSpan(
                    text: widget.consultant.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.85,
            child: Text(
              'حجز موعد',
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
              ),
            ).paddingOnly(top: 20, bottom: 10, right: 10),
          ),
          const Row(
            children: [
              Text(
                'المواعيد المتاحة',
                style: TextStyle(
                  color: Color(0xFF00A3BA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                ),
              ),
            ],
          ).paddingOnly(top: 10, right: 30),
          FutureBuilder<List<String>>(
            future: ConsultingController.instance.booked(id: widget.consultant.id),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Wrap(
                children: [
                  if (!snapshot.data!.contains('2'))
                    TextButton(
                      onPressed: () async {
                        await ConsultingController.instance
                            .booking(id:int.parse( widget.consultant.id), hour: 2);
                        setState(() {});
                      },
                      child: const Text(
                        ' 02:00 ظهراً - 03:00 عصراً',
                        style: TextStyle(
                          color: Color(0xFF00A3BA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                  if (!snapshot.data!.contains('3'))
                    TextButton(
                      onPressed: () async {
                        await ConsultingController.instance
                            .booking(id: int.parse(widget.consultant.id), hour: 3);
                        setState(() {});
                      },
                      child: const Text(
                        ' 03:00 ظهراً - 04:00 عصراً',
                        style: TextStyle(
                          color: Color(0xFF00A3BA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                  if (!snapshot.data!.contains('4'))
                    TextButton(
                      onPressed: () async {
                        await ConsultingController.instance
                            .booking(id: int.parse( widget.consultant.id), hour: 4);
                        setState(() {});
                      },
                      child: const Text(
                        ' 04:00 ظهراً - 05:00 عصراً',
                        style: TextStyle(
                          color: Color(0xFF00A3BA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                  if (!snapshot.data!.contains('5'))
                    TextButton(
                      onPressed: () async {
                        await ConsultingController.instance
                            .booking(id:int.parse( widget.consultant.id), hour: 5);
                        setState(() {});
                      },
                      child: const Text(
                        ' 05:00 ظهراً - 06:00 عصراً',
                        style: TextStyle(
                          color: Color(0xFF00A3BA),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
