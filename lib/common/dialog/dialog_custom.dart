import 'package:flutter/material.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/widgets/custom_dialog_widget.dart';

enum DialogType {
  INFO,
  WARNING,
  ERROR,
  SUCCESS,
  QUESTION,
  OPTION,
}
enum DismissType { BTN_OK, BTN_CANCEL, TOP_ICON, OTHER }

class CustomDialog {
  /// [@required]
  final BuildContext? context;

  /// Dialog Type can be INFO, WARNING, ERROR, SUCCES,
  final DialogType? dialogType;

  final Color? colorHeaderIn;

  /// Dialog Title
  final String? title;

  /// Set the description text of the dialog.
  final String? desc;

  /// Create your own Widget for body, if this property is set title and description will be ignored.
  final Widget? body;

  /// Btn OK props
  final String? btnOkText;
  final Function? btnOkOnPress;
  final Color? btnOkColor;

  /// Btn Cancel props
  final String? btnCancelText;
  final Function? btnCancelOnPress;
  final Color? btnCancelColor;

  /// Btn Cancel props
  final String? btnOptionText;
  final Function? btnOptionOnPress;
  final Color? btnOptionColor;

  /// Custom Btn OK
  final Widget? btnOk;

  /// Custom Btn Cancel
  final Widget? btnCancel;

  /// Custom Btn Option
  final Widget? btnOption;

  /// Barrier Dissmisable
  final bool? dismissOnTouchOutside;

  /// Callback to execute after dialog get dissmised
  final Function(DismissType type)? onDissmissCallback;

  /// Alignment of the Dialog
  final AlignmentGeometry? aligment;

  /// Text style title, content
  final TextStyle? styleTitle;
  final TextStyle? styleDesc;

  /// Padding off inner content of Dialog
  final EdgeInsetsGeometry? padding;

  /// This Prop is usefull to Take advantage of screen dimensions
  final bool? isDense;

  final bool? showHeader;

  /// Whenever the animation Header loops or not.
  final bool? headerAnimationLoop;

  /// To use the Rootnavigator
  final bool? useRootNavigator;

  /// For Autho Hide Dialog after some Duration.
  final Duration? autoHide;

  ///Control if add or not the Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom).
  final bool? keyboardAware;

  ///Control if Dialog is dissmis by back key.
  final bool? dismissOnBackKeyPress;

  ///Max with of entire Dialog.
  final double? width;

  ///Border Radius for built in buttons.
  final double? buttonsBorderRadius;

  ///TextStyle for built in buttons.
  final TextStyle? buttonsTextStyle;

  /// Custom closeIcon.
  final Widget? closeIcon;

  /// Custom background color for dialog + header
  final Color? dialogBackgroundColor;

  /// Set BorderSide of DialogShape
  final BorderSide? borderSide;

  /// Control if close icon is appear.
  final bool? showCloseIcon;

  CustomDialog({
    this.showCloseIcon,
    this.styleTitle,
    this.styleDesc,
    required this.context,
    this.dialogType = DialogType.INFO,
    this.title,
    this.desc,
    this.body,
    this.btnOk,
    this.btnCancel,
    this.colorHeaderIn,
    this.btnOkText,
    this.btnOkOnPress,
    this.btnOkColor,
    this.showHeader = true,
    this.btnCancelText,
    this.btnCancelOnPress,
    this.btnCancelColor,
    this.onDissmissCallback,
    this.isDense = false,
    this.dismissOnTouchOutside = true,
    this.headerAnimationLoop = true,
    this.aligment = Alignment.center,
    this.padding,
    this.useRootNavigator = false,
    this.autoHide,
    this.keyboardAware = true,
    this.dismissOnBackKeyPress = true,
    this.width,
    this.buttonsBorderRadius = 10,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.buttonsTextStyle,
    this.btnOption,
    this.btnOptionText,
    this.btnOptionOnPress,
    this.btnOptionColor,
  });

  bool isDissmisedBySystem = false;

  DismissType _dismissType = DismissType.OTHER;

  Future show() => showDialog(
          context: this.context!,
          barrierDismissible: dismissOnTouchOutside!,
          builder: (BuildContext context) {
            if (autoHide != null) {
              Future.delayed(autoHide!).then((value) => dismiss());
            }
            return _buildDialog;
          }).then((_) {
        isDissmisedBySystem = true;
        if (onDissmissCallback != null) onDissmissCallback?.call(_dismissType);
      });

  Widget get _buildDialog => WillPopScope(
        onWillPop: _onWillPop,
        child: VerticalStackDialog(
          dialogBackgroundColor: dialogBackgroundColor,
          borderSide: borderSide,
          title: this.title,
          desc: this.desc,
          body: this.body,
          showCloseIcon: showCloseIcon,
          isDense: isDense,
          alignment: aligment,
          showHeader: showHeader,
          styleDesc: styleDesc,
          styleTitle: styleTitle,
          colorHeader: colorHeaderIn ?? colorHeader(),
          keyboardAware: keyboardAware,
          width: width,
          padding: padding ?? EdgeInsets.only(left: 5, right: 5),
          btnOk: btnOk ?? (btnOkOnPress != null ? _buildButtonOk : null),
          btnCancel: btnCancel ??
              (btnCancelOnPress != null ? _buildButtonCancel : null),
          btnOption: btnOption ??
              (btnOptionOnPress != null ? _buildButtonOption : null),
          onClose: () {
            _dismissType = DismissType.TOP_ICON;
            dismiss.call();
          },
          closeIcon: closeIcon,
        ),
      );

  colorHeader() {
    switch (dialogType) {
      case DialogType.INFO:
        return ThemeColor.clr_78A1FF;
      case DialogType.WARNING:
        return ThemeColor.clr_F36F21;
      case DialogType.ERROR:
        return ThemeColor.clr_FA6148;
      case DialogType.SUCCESS:
        return ThemeColor.clr_78A1FF;
      case DialogType.QUESTION:
        return ThemeColor.clr_78A1FF;
      case DialogType.OPTION:
        return ThemeColor.clr_4C5980;
      default:
        return ThemeColor.clr_4C5980;
    }
  }

  ///Button Cancel
  Widget get _buildButtonCancel => RaisedButton(
      child: Text(btnCancelText ?? 'Cancel',
          style: TextStyleCommon.bottomButton(context!,
              color: ThemeColor.clr_FFFFFF, fontWeight: FontWeight.bold)),
      color: btnCancelColor ?? ThemeColor.clr_FA6148,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonsBorderRadius!)),
      disabledColor: ThemeColor.clr_ECECEC,
      onPressed: () {
        _dismissType = DismissType.BTN_CANCEL;
        dismiss();
        btnCancelOnPress?.call();
      });

  /// Button Option
  Widget get _buildButtonOption => RaisedButton(
      child: Text(btnOptionText ?? 'Option',
          style: TextStyleCommon.bottomButton(context!,
              color: ThemeColor.clr_FFFFFF, fontWeight: FontWeight.bold)),
      color: btnOptionColor ?? ThemeColor.clr_54C9EB,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonsBorderRadius!)),
      disabledColor: ThemeColor.clr_ECECEC,
      onPressed: () {
        _dismissType = DismissType.BTN_OK;
        dismiss();
        btnCancelOnPress?.call();
      });

  /// Button Ok
  Widget get _buildButtonOk => RaisedButton(
      child: Text(btnOkText ?? 'Ok',
          style: TextStyleCommon.bottomButton(context!,
              color: ThemeColor.clr_FFFFFF, fontWeight: FontWeight.bold)),
      color: btnOkColor ?? ThemeColor.clr_78A1FF,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonsBorderRadius!)),
      disabledColor: ThemeColor.clr_ECECEC,
      onPressed: () {
        _dismissType = DismissType.OTHER;
        dismiss();
        btnOkOnPress?.call();
      });

  dismiss() {
    if (!isDissmisedBySystem)
      Navigator.of(context!, rootNavigator: useRootNavigator!).pop();
  }

  Future<bool> _onWillPop() async => dismissOnBackKeyPress!;
}
