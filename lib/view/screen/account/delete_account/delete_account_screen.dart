import 'package:dr_ai/core/helper/extention.dart';
import 'package:dr_ai/logic/account/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image.dart';
import '../../../../core/helper/custom_dialog.dart';
import '../../../widget/my_stepper_form.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callDialog();
    });
  }

  void callDialog() => customDialog(context,
      secondButtoncolor: ColorManager.error,
      title: "Delete Account?!",
      subtitle: "Are you sure you want to delete your account?",
      buttonTitle: "Delete",
      onCancle: () => Navigator.popUntil(context, (route) => route.isFirst),
      image: ImageManager.errorIcon,
      dismiss: false,
      onPressed: () => context.bloc<AccountCubit>().deleteAccount());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text("Delete Account",
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 18.spMin)),
      ),
      body: Column(
        children: [
          Gap(20.h),
          const Column(
            children: [
              ReAuthanticateStepper(
                stepReachedNumber: 1,
                stepColorTwo: ColorManager.error,
                stepIconTwo: ImageManager.deteteAccountIcon,
                stepTitleOne: "Password",
                stepTitleTwo: "Delete Account",
              ),
            ],
          )
        ],
      ),
    );
  }
}