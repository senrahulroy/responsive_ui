
import 'package:flutter/material.dart';
import 'package:responsive_ui_mobile_web/ui/widget/shadow_container.dart';

import '../../../utils/const.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.borderRadius = 15,
    this.textLabel,
    this.onTap,
    this.shadowColors = Colors.black26,
    this.blurRadius = 6,
  });

  final double borderRadius;
  final double blurRadius;
  final String? textLabel;
  final VoidCallback? onTap;
  final Color shadowColors;

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
            gradient: AppColors.magentaGradient
        ),
        child: Column(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: const BoxDecoration(gradient: AppColors.bgGradient),
            ),
            ShadowContainer(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: InkWell(
                      onTap: onTap,
                      child: Text(
                        textLabel ?? "Login",
                        style: const TextStyle(
                            color: AppColors.magenta,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
