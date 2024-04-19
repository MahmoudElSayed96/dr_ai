// ignore_for_file: deprecated_member_use

import 'package:dr_ai/core/constant/color.dart';
import 'package:dr_ai/core/constant/image.dart';
import 'package:dr_ai/core/helper/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/routes.dart';
import '../../../core/helper/scaffold_snakbar.dart';
import '../../../data/service/firebase/firebase_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final divider = Divider(color: ColorManager.grey, thickness: 1.w);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
          child: Column(
            children: [
              Gap(10.h),
              _buildUserCard(context),
              Gap(20.h),
              _buildProfileCard(context,
                  title: "Edit Profile", image: ImageManager.userIcon),
              divider,
              _buildProfileCard(context,
                  title: "Languages", image: ImageManager.languageIcon),
              divider,
              _buildProfileCard(context,
                  title: "Change Password",
                  image: ImageManager.changePasswordIcon),
              divider,
              _buildProfileCard(context,
                  title: "About Us", image: ImageManager.aboutUsIcon),
              divider,
              _buildProfileCard(context,
                  title: "Rate Us", image: ImageManager.rateUsIcon),
              divider,
              _buildProfileCard(context,
                  title: "Delete Account",
                  image: ImageManager.deteteAccountIcon,
                  color: ColorManager.error),
              divider,
              _buildProfileCard(
                context,
                title: "logout",
                iconData: Icons.logout,
                color: ColorManager.error,
                onPressed: () {
                  FirebaseService.logOut();
                  customSnackBar(context, "Log out");
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteManager.login, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context,
      {required String title,
      String? image,
      Color? color,
      IconData? iconData,
      VoidCallback? onPressed}) {
    return ListTile(
      contentPadding:
          EdgeInsets.only(left: 12.w, right: 4.w, bottom: 5.h, top: 5.h),
      title: Text(title, style: context.textTheme.bodyMedium),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward_ios,
            size: 16.r, grade: 60, color: color ?? ColorManager.green),
      ),
      leading: Container(
        width: 46.w,
        height: 46.w,
        decoration: BoxDecoration(
            color: (color ?? ColorManager.green).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.dm)),
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.w),
        child: iconData == null
            ? SvgPicture.asset(
                image!,
                color: color ?? ColorManager.green,
                width: 24.w,
                height: 24.w,
              )
            : Icon(
                iconData,
                color: ColorManager.error,
                size: 22.r,
              ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.dm),
        side: BorderSide(color: ColorManager.grey, width: 1.w),
      ),
      child: ListTile(
        leading: Container(
          alignment: Alignment.center,
          height: 50.w,
          width: 50.w,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8.dm),
            border: Border.all(
              width: 1.5.w,
              color: ColorManager.green,
            ),
          ),
          child: Text(
            "M",
            style: context.textTheme.bodyLarge,
          ),
        ),
        title: Text(
          "Mahmoud",
          style: context.textTheme.bodyMedium,
        ),
        subtitle: Text(
          "5h9pY@example.com",
          style: context.textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
        contentPadding:
            EdgeInsets.only(left: 12.w, right: 4.w, bottom: 5.h, top: 5.h),
        trailing: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageManager.editIcon,
              width: 20.w,
              height: 20.w,
            )),
      ),
    );
  }
}