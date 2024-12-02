// Packages
import 'package:flutter/material.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';

// Files
import '/core/utils/_utils.dart';

class THelperFunctions {
  THelperFunctions._();

  // Is Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // URL Launcher
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // FOR SVG ICONS
  static String getIconSVG(String name) {
    try {
      return '${Constants.pathSystemIcons}$name.svg';
    } catch (e) {
      return '';
    }
  }

  // FOR PNG IMAGES
  static String getPngImage(String name) {
    try {
      return '${Constants.pathImages}$name.png';
    } catch (e) {
      return '';
    }
  }

  // Get Last 4 Digits in a String
  static String? returnLastNDigits(String? text, int? digits) {
    try {
      if (text == null) {
        return '';
      } else if (digits == null) {
        return '';
      } else {
        return text.substring(text.length - digits);
      }
    } catch (e) {
      return '';
    }
  }

  // Show Toast Bar
  static void showToastBar(BuildContext context, Widget title,
      {int? duration, Widget? subtitle, Widget? leading, Color? color, Color? shadowColor, Widget? trailing, dynamic Function()? onTap}) {
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: Duration(milliseconds: duration ?? 5000),
      builder: (context) => ToastCard(
        title: title,
        subtitle: subtitle,
        leading: leading,
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        shadowColor: shadowColor,
        trailing: trailing,
        onTap: onTap,
      ),
    ).show(context);
  }

  // Show Alert Dialog
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
