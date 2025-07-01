import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final String? hintText;
  final Color? hintColor;
  final String? initText;
  final int? maxLine;
  final TextInputType textInputType;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final Function(String)? onChange;

  const CommonTextField({
    super.key,
    this.hintText,
    this.hintColor,
    this.initText,
    this.maxLine,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChange,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {

  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.initText == null) return;
    controller = TextEditingController(text: widget.initText);
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      keyboardType: widget.textInputType,
      maxLines: widget.maxLine,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintColor),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: widget.onChange,
    );
  }
}
