import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../core/components/app_colors.dart';

class CustomTwoTextFromField extends StatelessWidget {
  CustomTwoTextFromField({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.label1,
    required this.label2,
    required this.isPass,
    required this.isPass2,
    this.prefixIcon1,
    this.prefixIcon2,
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String label1;
  final String label2;
  final bool isPass;
  final bool isPass2;
  IconData? prefixIcon1;
  IconData? prefixIcon2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(AppColors.kLoginWithGoogleColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass,
            maxLine: 1,
            controller: controller1,
            border: InputBorder.none,
            label: label1,
            type: TextInputType.emailAddress,
            validate: (value) {},
            prefixIcon: prefixIcon1,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
        const Gap(20),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(AppColors.kLoginWithGoogleColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass2,
            maxLine: 1,
            type: TextInputType.visiblePassword,
            controller: controller2,
            validate: (value) {},
            border: InputBorder.none,
            label: label2,
            prefixIcon: prefixIcon2,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ],
    );
  }
}
