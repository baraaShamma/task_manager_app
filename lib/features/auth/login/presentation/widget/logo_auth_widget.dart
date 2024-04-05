
import 'package:flutter/material.dart';
import 'package:task_manager_app/app/constant/image_assets.dart';
import 'package:task_manager_app/resources/constant/values_manager.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      AppImageAssets.logo,
      width: AppSizeW.s200,
      height: AppSizeH.s200,
    );
  }
}