import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qwe/commom/utils/common_widget.dart';
import 'package:flutter_qwe/commom/utils/regex.dart';
import 'package:flutter_qwe/modules/auth/auth_controller.dart';
import 'package:flutter_qwe/widgets/border_button.dart';
import 'package:flutter_qwe/widgets/gradient_background.dart';
import 'package:flutter_qwe/widgets/input_field.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.loginNameController,
              keyboardType: TextInputType.text,
              labelText: 'name'.tr,
              placeholder: 'nameTip'.tr,
              validator: (value) {
                if (!Regex.isString(value!)) {
                  return 'nameErrorTip'.tr;
                }
                if (value.isEmpty) {
                  return 'nameEmptyTip'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.loginPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'password'.tr,
              placeholder: 'passwordTip'.tr,
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'passwordEmptyTip'.tr;
                }

                if (value.length < 2 || value.length > 15) {
                  return 'passwordLengthErrorTip'.tr + '6 ~ 15';
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(height: 50),
            BorderButton(
              text: 'login'.tr,
              backgroundColor: Colors.white,
              onPressed: () {
                controller.login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
