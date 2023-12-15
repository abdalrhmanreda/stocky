import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:project1/authentication/screens/register_screen/register_screen.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../../../../../core/components/flutter_toast.dart';
import '../../../core/components/app_colors.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
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
                      textPartOne: 'Log ',
                      textPartTwo: 'In',
                    ),
                    const Gap(30),
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
                    const Gap(10),
                    customTextNextToTextButton(
                      context: context,
                      textButton: 'Forget Password ?',
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Login',
                      height: 42,
                      color: AppColors.kPrimaryColor,
                      width: MediaQuery.of(context).size.width,
                      horizontal: 0,
                      vertical: 0,
                      radius: 10,
                      textColor: AppColors.kWhiteColor,
                      fontSize: 20,
                    ),
                    const Gap(10),
                    customTextNextToTextButton(
                      context: context,
                      text: 'Don\'t have account ?',
                      textButton: 'create account',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
