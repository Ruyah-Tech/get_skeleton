import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_scaffold_controller.dart';

class GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final double? height;
  final Color? backgroundColor;
  final Color? color;
  final Widget? leadIcon;
  final double? elevation;
  /// A custom widget to be placed inside the app bar, which will override the
/// default layout of the leading icon, title, and actions.
///
/// Use this property when you need a completely custom design for the app bar content.
  final Widget? child;

  const GetAppBar({
    super.key,
    this.title,
    this.height,
    this.backgroundColor,
    this.color,
    this.leadIcon,
    this.actions,
    this.elevation,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final GetScaffoldController getScaffoldController =
        Get.put(GetScaffoldController());
    double xheight = height ?? Get.mediaQuery.size.height / 8;

    return Container(
      color: backgroundColor ?? Colors.blue,
      height: xheight,
      child: Column(
        children: [
          Container(
            height: Get.mediaQuery.padding.top,
          ),
          SizedBox(
              height: xheight - Get.mediaQuery.padding.top,
              child: child ??
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      if (leadIcon != null)
                        leadIcon!
                        else if (getScaffoldController.hasDrawer.isTrue 
                          )
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            getScaffoldController.toggleDrawer();
                          },
                        )
                      else
                        const SizedBox(
                          width: 24,
                        ),
                      if (title != null) title!,
                      if (actions != null)
                        Row(
                          children: actions!,
                        )
                      
                      else
                        const SizedBox(
                          width: 48,
                        ),
                    ],
                  )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
