import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../core/components/app_colors.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomRichText(
                    textPartOne: 'Sign ',
                    textPartTwo: 'Up',
                  ),
                  const Gap(30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(AppColors.kLoginWithGoogleColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CustomTextFormField(
                        isPassword: false,
                        maxLine: 1,
                        prefixIcon: IconlyBroken.profile,
                        controller: nameController,
                        border: InputBorder.none,
                        label: 'username',
                        validate: (value) {}),
                  ),
                  const Gap(20),
                  CustomTwoTextFromField(
                    controller1: emailController,
                    controller2: passController,
                    label1: 'Email',
                    label2: 'Password',
                    isPass: false,
                    isPass2: true,
                    prefixIcon1: IconlyBroken.message,
                    prefixIcon2: IconlyBroken.lock,
                  ),
                  const Gap(30),
                  const Gap(20),
                  CustomButton(
                    onPressed: () {},
                    text: 'Sign Up',
                    height: 42,
                    color: AppColors.kPrimaryColor,
                    width: MediaQuery.of(context).size.width,
                    horizontal: 0,
                    vertical: 0,
                    radius: 10,
                    textColor: AppColors.kWhiteColor,
                    fontSize: 20,
                  ),
                  const Gap(30),
                  customTextNextToTextButton(
                      context: context,
                      text: 'Already have account ?',
                      textButton: 'Login',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
