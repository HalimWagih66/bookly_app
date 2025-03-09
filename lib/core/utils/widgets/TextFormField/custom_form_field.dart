import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:bookly_app/core/utils/widgets/TextFormField/text_form_field_border.dart';
import 'package:flutter/material.dart';


typedef FunctionValidate = String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? inputField;
  final FunctionValidate functionValidate;
  final bool obscureText;
  final TextInputType textInputType;
  final String? textLabel;
  final IconData? suffixIcon;
  final String? hintText;
  final String fontFamily;
  final double contentPadding;
  final InputBorder? borderField;
  final Function? onPressedSuffixIcon;
  final int maxLines;
  final int minLines;
  final Color? fillColor;
  final bool enabled;
  final IconData? prefixIcon;
  final String? initialValue;
  final FunctionValidate? functionOnChanged;
  final TextInputAction? textInputAction;
  CustomTextFormField(
      {super.key,
        this.inputField,
      required this.functionValidate,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
        this.textLabel,
      this.suffixIcon,
      this.fontFamily = "Poppins",
       this.borderField,
        this.onPressedSuffixIcon,
        this.maxLines = 1,
        this.minLines = 1,
        this.functionOnChanged,
        this.initialValue,
        this.textInputAction, this.hintText, this.prefixIcon, this.enabled = true, this.contentPadding = 23, this.fillColor
      });
  final themeApp = LightThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textLabel != null?Text(textLabel!,style: themeApp.textStyle18(context).copyWith(letterSpacing: 1.5,decorationThickness: 0),):const SizedBox(),
         const SizedBox(height: 13),
        TextFormField(
          enabled: enabled,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          cursorColor: themeApp.primaryColor,
          controller: inputField,
          validator: functionValidate,
          maxLines: maxLines,
          onChanged: functionOnChanged,
          initialValue: initialValue,
          minLines: minLines,
          style: themeApp.textStyle18(context),
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 13
            ),
            hintText: hintText,
            filled: true,
            enabled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 23,horizontal: 0),
            fillColor:  fillColor??const Color(0xff000000),
            hintStyle: themeApp.textStyle18(context),
            enabledBorder:fieldBorderDefault(color: const Color(0x679b9b9b)),
              border: fieldBorderDefault(color: Colors.white),
              focusedBorder:fieldBorderDefault(color: themeApp.primaryColor),
              errorBorder:fieldBorderDefault(color: Colors.red),
            focusedErrorBorder:fieldBorderDefault(color: Colors.red),
            prefixIcon:Icon(prefixIcon),
            suffixIcon:suffixIcon !=null?IconButton(
              onPressed: (){
                onPressedSuffixIcon!();
              },
              icon: Icon(
                suffixIcon,
                color: Colors.grey,
              )
            ):null,
          )
        ),
      ],
    );
  }
}