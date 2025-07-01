import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_search/a_common/components/app_font.dart';

class CheckBox extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function() toggleCallBack;

  const CheckBox({
    super.key,
    required this.label,
    required this.isChecked,
    required this.toggleCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCallBack,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: isChecked
                    ? const Color(0xffFD6F1F)
                    : const Color(0xff3c3c3e),
              ),
              color: isChecked
                ? const Color(0xffFD6f1f)
                  :const Color(0xff3c3c3e).withValues(alpha: (0.0 * 255)),
            ),
            width: 24,
              height: 24,
            child: isChecked
            ? SvgPicture.asset('assets/svg/icons/checked.svg')
            : Container(),
          ),
          const SizedBox(width: 7),
          AppFont(
              label,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }
}
