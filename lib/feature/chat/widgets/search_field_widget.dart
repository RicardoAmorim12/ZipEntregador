import 'package:fastdelivery_multivendor_driver/util/dimensions.dart';
import 'package:fastdelivery_multivendor_driver/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData suffixIcon;
  final Function iconPressed;
  final Function? onSubmit;
  final Function? onChanged;
  const SearchFieldWidget({super.key, required this.controller, required this.hint, required this.suffixIcon, required this.iconPressed,
    this.onSubmit, this.onChanged});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, spreadRadius: 1, blurRadius: 5)],
      ),
      child: TextField(
        controller: widget.controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall), borderSide: BorderSide.none),
          filled: true, fillColor: Theme.of(context).cardColor,
          isDense: true,
          suffixIcon: IconButton(
            onPressed: widget.iconPressed as void Function()?,
            icon: Icon(widget.suffixIcon),
          ),
        ),
        onSubmitted: widget.onSubmit as void Function(String)?,
        onChanged: widget.onChanged as void Function(String)?,
      ),
    );
  }
}