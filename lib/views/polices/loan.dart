import 'package:application/controllers/loans.dart';
import 'package:application/controllers/policies.dart';
import 'package:application/views/shared/button.dart';
import 'package:application/views/shared/header_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoanPolicyView extends StatefulWidget {
  LoanPolicyView({super.key});

  @override
  State<LoanPolicyView> createState() => _LoanPolicyViewState();
}

class _LoanPolicyViewState extends State<LoanPolicyView> {
  final radioTitleStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Tajawal',
    color: Colors.black,
  );

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text(
          "القرض",
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: HeaderCard(
              title: "القرض",
              height: 70,
              width: Get.width * 0.8,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Color(0xFF9E773A),
              ),
            ),
          ).paddingOnly(top:30),
          SizedBox(
            width: Get.width * 0.8,
            child: const Text(
              "تعليمات التسجيل:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ).paddingOnly(top: 50, bottom: 10),
          ),
          SizedBox(
            width: Get.width * 0.85,
            child: RichText(
                textAlign: TextAlign.right,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "1. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "ان تكون حالة الطالب/ ـة الدراسية :منتظم",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: "2. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "ان يكون المعدل الدراسي اعلى من 2",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: "3. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "عدم وجود إنذار أكاديمي",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: "4. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "ان لا تكون حالة الطالب/ ـة  : متوقع تخرجة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: '\n'),
                  ],
                )).paddingOnly(right: 20),
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: const Text(
              "أتعهد أنا الطالب / ـة :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ).paddingOnly(top: 50, bottom: 10),
          ),
          SizedBox(
            width: Get.width * 0.85,
            child: RichText(
              textAlign: TextAlign.right,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "\u2022 ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Colors.black,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                  TextSpan(
                    text:
                        "على الموافقة لجميع الشروط التي يطبقها تطبيق تيسير ،بما فيها الخصم من المكافأة الشهرية المقدمة من جامعة أم القرى ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Tajawal',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text: "\u2022  ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "عند عدم إستوفاء احد المتطلبات او الشروط المتعلقة بالمكافأة، فعلى الجامعة حجز الوثيقة الجامعية حتى سداد المديونية.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Tajawal',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ).paddingOnly(right: 20),
          ),

          // radio button

          FutureBuilder<Map<String, dynamic>>(
              future: LoansController.instance.checkLoan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CupertinoActivityIndicator();
                }
                if (snapshot.hasError) {
                  return const Text('Error');
                }
                if (snapshot.data!['status'] == 'fail') {
                  return Text(
                    snapshot.data!['msg'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                    ),
                  ).paddingOnly(top: 50);
                }

                return SizedBox(
                  height: 200,
                  child: Column(
                    children: [

                  SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      snapshot.data!['msg'],
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                      ),
                      textAlign: TextAlign.right,
                    ).paddingOnly(top: 10, bottom: 30),
                  ),
                      const Spacer(),
                      SizedBox(
                        height: 35,
                        child: RadioListTile(
                            value: true,
                            groupValue: accept,
                            onChanged: (value) {
                              setState(() {
                                accept = value!;
                              });
                            },
                            title: Text(
                              "أوافق على الشروط",
                              style: radioTitleStyle,
                            )),
                      ),
                      SizedBox(
                        height: 35,
                        child: RadioListTile(
                          toggleable: true,
                          value: false,
                          groupValue: accept,
                          onChanged: (value) {
                            setState(() {
                              accept = value!;
                            });
                          },
                          title: const Text("لا أوافق على الشروط",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                                color: Colors.black,
                              )),
                        ),
                      ).paddingOnly(bottom: 20),
                      Visibility(
                        visible: accept,
                        child: Button(
                          text: "اوافق على الشروط",
                          onPressed: () async{
                            await LoansController.instance.loabApply();

                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
