import 'package:flutter/material.dart';
import 'package:monthly_ui_components/components/buttons/simple_button.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';
import 'package:monthly_ui_components/themes/app_themes.dart';

class BottomSheetMessage {
  BottomSheetMessage({
    required this.title,
    required this.message,
    this.onButtonPressed,
    this.onClosePressed,
    this.firstButtonLabel,
    this.secondButtonLabel,
    this.modalHeight,
  });

  final String title;
  final String message;
  final void Function()? onButtonPressed;
  final void Function()? onClosePressed;
  final String? firstButtonLabel;
  final String? secondButtonLabel;
  final double? modalHeight;
}

class AppBottomSheetMessage {
  static void show(BuildContext context, Widget container) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: container,
          ),
        );
      },
    );
  }

  static void showChoice({
    required BuildContext context,
    required BottomSheetMessage bottomSheetMessage,
  }) {
    show(
      context,
      SimpleModal(
        modalHeight: bottomSheetMessage.modalHeight,
        firstButtonLabel: bottomSheetMessage.firstButtonLabel,
        secondButtonLabel: bottomSheetMessage.secondButtonLabel,
        title: bottomSheetMessage.title,
        message: bottomSheetMessage.message,
        onClosePressed: () {
          bottomSheetMessage.onClosePressed?.call();
          return closeBottomSheet(context);
        },
        onOkPressed: () {
          bottomSheetMessage.onButtonPressed?.call();
          return closeBottomSheet(context);
        },
        onClosePopupPressed: () => closeBottomSheet(context),
      ),
    );
  }

  static void closeBottomSheet(BuildContext context) {
    Navigator.pop(context);
  }
}

class SimpleModal extends StatelessWidget {
  const SimpleModal({
    required this.title,
    required this.message,
    required this.onOkPressed,
    required this.onClosePressed,
    required this.onClosePopupPressed,
    super.key,
    this.icon,
    this.firstButtonLabel,
    this.secondButtonLabel,
    this.modalHeight,
  });

  final String title;
  final String message;
  final void Function()? onOkPressed;
  final void Function() onClosePressed;
  final void Function() onClosePopupPressed;
  final Icon? icon;
  final String? firstButtonLabel;
  final String? secondButtonLabel;
  final double? modalHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hNormalSpace),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.primaryLight, width: 1.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultRadius),
            topRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: hNormalSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: AppColors.primaryDark),
                        ),
                      ),
                      _loadIcon(),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onClosePopupPressed,
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.primaryDark,
                    size: closeIconSize,
                  ),
                ),
              ],
            ),
            SizedBox(height: hNormalSpace),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: defaultFontSize,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: hNormalSpace),
            Visibility(
              visible: onOkPressed != null,
              child: SimpleButton(
                onPressed: () {
                  onOkPressed?.call();
                },
                label: firstButtonLabel ?? 'OK',
                buttonColor: AppColors.secondary,
              ),
            ),
            SizedBox(height: hNormalSpace),
            SimpleButton(
              onPressed: onClosePressed,
              label: secondButtonLabel ?? '',
              buttonColor: AppColors.warning,
            ),
            SizedBox(height: hNormalSpace),
          ],
        ),
      ),
    );
  }

  Widget _loadIcon() {
    if (icon != null) {
      return Padding(padding: EdgeInsets.only(right: hSmallSpace), child: icon);
    }

    return const SizedBox.shrink();
  }
}
