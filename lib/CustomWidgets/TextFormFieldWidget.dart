import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class TextFormFieldWidget extends StatelessWidget {
  //
  TextFormFieldWidget({
    this.controller,
    this.hintText,
    this.hintColor,
    this.helpText,
    this.prefixIcon,
    this.suffix,
    this.isPassword,
    this.enabled,
    this.readOnly,
    this.borderColor,
    this.textColor,
    this.isDense,
    this.labelText,
    this.labelColor,
    this.focusBorderColor,
    this.toggleObscured,
    this.textInputType,
    this.regExp,
    this.maxLength
  });

  final TextEditingController? controller;
  final String? hintText,helpText,labelText;
  final IconData? prefixIcon;
  final bool? suffix;
  final bool? isPassword,enabled,readOnly, isDense;
  final Color? borderColor,focusBorderColor;
  final Color? textColor,hintColor,labelColor;
  final VoidCallback? toggleObscured;
 final TextInputType? textInputType;
 final RegExp? regExp ;
 final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        controller: controller,

        maxLength: maxLength,
        inputFormatters: <TextInputFormatter>[

         if(textInputType!=null && textInputType==TextInputType.number)
          FilteringTextInputFormatter.digitsOnly

        ],
        keyboardType:textInputType??TextInputType.text ,
        readOnly: readOnly?? false,
        obscureText: isPassword ?? false,
        style: TextStyle(
            color: textColor ?? Colors.white,
          fontSize: 14.sp
        ),
        decoration: InputDecoration(
          isDense: isDense,
          counterStyle: TextStyle(color: hintColor ?? MyColors.liteWhite,
          fontSize: 11.sp
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color:focusBorderColor?? MyColors.colorPrimary,
              width: 1.0.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0.h,
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius:  BorderRadius.circular(20.0.w),
              borderSide: BorderSide(width: 1, color: borderColor??Colors.transparent)),

          border: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color:  borderColor??Colors.transparent,
              width: 1.0.h,
            ),
          ),
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            color: hintColor ?? MyColors.liteWhite,
            fontSize: 14.sp
          ),
          helperText: helpText ?? '',
          prefixIcon: null == prefixIcon ? null : Icon(prefixIcon),
          suffix: null == suffix ? null : Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: toggleObscured,
              child: Icon(
                isPassword??false
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 18.w,
                color: MyColors.liteWhite
                ,
              ),
            ),
          ),
          enabled: enabled ?? true,
          labelText: labelText,
          labelStyle: TextStyle(
              color: labelColor
        ),
      ),
      ),
    );
  }
}