
import 'package:borcelle_wedding_app/utils/screen_utils.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:borcelle_wedding_app/utils/global_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlerts {
  AppAlerts._();

  static void showErrorSnackBar([String? message]) {
    if (navigatorKey.currentState?.overlay != null) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => ToastCard(
          color: Colors.red.shade100,
          leading: const Icon(
            Icons.error,
            size: 28,
            color: Colors.red,
          ),
          title: Text(
            message ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(navigatorKey.currentState!.context);
    }
  }

  static void showSuccessSnackBar(String message) {
    if (navigatorKey.currentState?.overlay != null) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => ToastCard(
          color: Colors.green.shade100,
          leading: const Icon(
            Icons.done,
            size: 28,
            color: Colors.green,
          ),
          title: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(navigatorKey.currentState!.context);
    }
  }

  static void showInfoMessage(String message) {
    if (navigatorKey.currentState?.overlay != null) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => ToastCard(
          color: Colors.blue.shade100,
          leading: const Icon(
            Icons.done,
            size: 28,
            color: Colors.blue,
          ),
          title: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(navigatorKey.currentState!.context);
    }
  }

  static Future<dynamic> showScrollableBottomSheet<T>({
    bool enableDrag = true,
    required BuildContext context,
    double minChildSize = 0.4,
    bool isDismissible = true,
    Widget Function(BuildContext context, ScrollController scrollController)?
        builder,
  }) {
    return showModalBottomSheet<T>(
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: isDismissible,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            shouldCloseOnMinExtent: isDismissible,
            initialChildSize: minChildSize + 0.1,
            minChildSize: minChildSize,
            builder: (_, scrollController) {
              return Material(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 18),
                        height: 6,
                        width: context.width * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade400,
                        ),
                      ),
                      if (builder != null)
                        Flexible(child: builder(context, scrollController)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<T?> showOptionSelectionSheet<T>({
    required BuildContext context,
    String? title,
    required Map<String, T> options,
  }) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(title ?? 'Choose an Option'),
        actions: options.keys
            .map(
              (key) => CupertinoActionSheetAction(
                child: Text(key),
                onPressed: () {
                  Navigator.pop(context, options[key]);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
