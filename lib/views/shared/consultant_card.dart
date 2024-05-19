import 'package:application/core/consultant.dart';
import 'package:application/utilities/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantCard extends StatelessWidget {
  const ConsultantCard({super.key,required this.consultant,this.onTap,
    this.width=190,

  });

  //   this.name='الدكتور محمد',this.experience='13 سنة'
  //   ,this.field='استشاري الأمراض الجلديةاستشاري الأمراض الجلدية',

  //   this.onTap
  //   ,this.image='https://source.unsplash.com/random/1920x1080'});
  // final String name ;
  // final String experience ;
  // final String field ;
  // final String image ;
  final double? width;
  final VoidCallback? onTap;
  final ConsultantModel consultant;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: consultant.speciality.length>25?300:300,
          margin: const EdgeInsets.all(2),
        width: width??MediaQuery.of(context).size.width*0.5-10,
        color: const Color(0xFFCDE7EB),
        child: Container(
          padding: const EdgeInsets.all(10),
          //
          decoration: BoxDecoration(
            color: const Color(0xFFCDE7EB),
            borderRadius: BorderRadius.circular(12.5),
            border: Border.all(
              color: const Color(0xFF00A3BA),
              width: 1,
            ),
          ),
          width: 200,
          // height: 220,
          child: Column(
            children: [
              Container(
                width: Get.width*0.3,
                height: Get.width*0.3,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFF00A3BA),
                    width: 2,
                  ),
                  image:(consultant.image.isNotEmpty && consultant.image.startsWith('http'))?  DecorationImage(
                    image: NetworkImage(consultant.image),
                    fit: BoxFit.cover,
                  ):
                  const DecorationImage(
                    image: AssetImage('assets/icons/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ).paddingOnly(top: 10),
              const SizedBox(height: 10),
               Text(
                 consultant.name,
                style: const TextStyle(
                  color: Color(0xFF00A3BA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                ),
              ).paddingOnly(bottom: 10),
              // const SizedBox(height: 10),
              SizedBox(
                width: Get.width*0.5-20,
                child: RichText(
                  textAlign: TextAlign.right,
                  text:  TextSpan(
                  children: [
                    const TextSpan(
                      text: 'الخبرة: ',
                      style: TextStyle(
                        color: Color(0xFF00A3BA),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    TextSpan(
                      text: consultant.experience,
                      style: const TextStyle(
                        color: Color(0xFF00A3BA),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ],
                ),).paddingOnly(bottom: 10),
              ),
              SizedBox(
                width: Get.width*0.5-20,

                child: RichText(
                  softWrap: true,

                  text:  TextSpan(
                  children: [
                    const TextSpan(
                      text: 'نبذة: ',
                      style: TextStyle(
                        color: Color(0xFF00A3BA),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    TextSpan(
                      text: consultant.description.shorten(50),
                      style: const TextStyle(
                        color: Color(0xFF00A3BA),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ],
                ),).paddingOnly(bottom: 10),
              ),
            ],
          ),
        )
      ),
    );
  }
}
