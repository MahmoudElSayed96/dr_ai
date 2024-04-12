import 'package:dr_ai/core/constant/color.dart';
import 'package:dr_ai/core/helper/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.label,
      this.onSaved,
      this.onChanged,
      this.onFieldSubmitted,
      this.validator,
      this.controller,
      this.keyboardType,
      this.icon,
      this.title,
      this.isVisible,
      this.fillColor,
      this.isVisibleColor,
      this.cursorColor,
      this.obscureText,
      this.dropDownVisible,
      this.onDropDownSelected});
  final String? hintText;
  final String? label;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? icon;
  final String? title;
  final bool? isVisible;
  final Color? fillColor;
  final Color? isVisibleColor;
  final Color? cursorColor;
  final bool? obscureText;
  final bool? dropDownVisible;
  final void Function()? onDropDownSelected;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isTap = false;
  bool isObscure = true;
  bool isDropDown = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
        child: Text(
          widget.title ?? "",
          style: context.textTheme.bodyMedium,
        ),
      ),
      TextFormField(
        style: context.textTheme.bodySmall?.copyWith(color: ColorManager.black),
        cursorColor: widget.cursorColor ?? ColorManager.green,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obscureText ??
            (widget.isVisible == true ? isObscure : false),
        validator: widget.validator ??
            (value) {
              if (value!.isEmpty) {
                return "Field cannot be empty";
              } else {
                return null;
              }
            },
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        onTap: () {
          isTap = true;
          setState(() {});
        },
        onTapOutside: (_) {
          isTap = false;
          setState(() {});
        },
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          errorMaxLines: 2,
          errorStyle: context.textTheme.bodySmall
              ?.copyWith(color: ColorManager.error, fontSize: 14.spMin),
          suffixIcon: widget.isVisible == true
              ? _buildSuffixIcon(Icons.visibility_off, Icons.visibility)
              : widget.dropDownVisible == true
                  ? _buildSuffixIcon(
                      Icons.keyboard_arrow_down, Icons.keyboard_arrow_up)
                  : null,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          filled: true //true
          ,
          fillColor: widget.fillColor ?? ColorManager.white,
          hintText: widget.hintText,
          hintStyle: context.textTheme.bodySmall,
          enabledBorder: context.inputDecoration.enabledBorder,
          focusedBorder: context.inputDecoration.focusedBorder,
          errorBorder: context.inputDecoration.errorBorder,
          focusedErrorBorder: context.inputDecoration.focusedErrorBorder,
        ),
      )
    ]);
  }

  Widget _buildSuffixIcon(IconData icon1, IconData icon2) {
    return Builder(
      builder: (contxt) => IconButton(
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
          if (widget.dropDownVisible == true) {
            widget.onDropDownSelected!();
          }
        },
        icon: Icon(isObscure == true ? icon1 : icon2),
        color: isTap ? ColorManager.green : ColorManager.grey,
        iconSize: 21.r,
      ),
    );
  }
}

class CustomSelectedField extends StatefulWidget {
  @override
  _CustomSelectedFieldState createState() => _CustomSelectedFieldState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _CustomSelectedFieldState extends State<CustomSelectedField> {
  Item? selectedUser;
  List<Item> users = <Item>[
    const Item(
        'Android',
        Icon(
          Icons.android,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'Flutter',
        Icon(
          Icons.flag,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'ReactNative',
        Icon(
          Icons.format_indent_decrease,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'iOS',
        Icon(
          Icons.mobile_screen_share,
          color: const Color(0xFF167F67),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField<Item>(
        hint: const Text("Select item"),
        value: selectedUser,
        onChanged: (Item? value) {
          setState(() {
            selectedUser = value;
          });
        },
        items: users.map((Item user) {
          return DropdownMenuItem<Item>(
            value: user,
            child: Row(
              children: <Widget>[
                user.icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
