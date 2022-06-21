import 'package:flutter/material.dart';
import 'package:weather/common/resource/sizes.dart';
import 'package:weather/common/resource/theme_color.dart';

class VerticalStackDialog extends StatelessWidget {
  final String? title;
  final String? desc;
  final Widget? btnOk;
  final Widget? btnCancel;
  final Widget? btnOption;
  final Widget? body;
  final TextStyle? styleTitle;
  final TextStyle? styleDesc;
  final bool? isDense;
  final bool? showHeader;
  final AlignmentGeometry? alignment;
  final bool? showCloseIcon;
  final EdgeInsetsGeometry? padding;
  final bool? keyboardAware;
  final double? width;
  final Function onClose;
  final Widget? closeIcon;
  final Color? dialogBackgroundColor;
  final BorderSide? borderSide;
  final Color? colorHeader;

  const VerticalStackDialog({
    Key? key,
    this.title,
    this.desc,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.alignment,
    this.isDense = true,
    this.padding,
    this.keyboardAware = true,
    this.width,
   required this.onClose,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.showCloseIcon,
    this.colorHeader,
    this.styleTitle,
    this.styleDesc,
    this.btnOption,
    this.showHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(
          bottom: keyboardAware! ? mediaQueryData.viewInsets.bottom : 0),
      child: Stack(
        children: <Widget>[
          Container(
            width: width ?? mediaQueryData.size.width,
            padding: isDense!
                ? EdgeInsets.only(
                    top: 65.0, left: 15.0, right: 15.0, bottom: 10.0)
                : EdgeInsets.only(
                    top: 65.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: borderSide ?? BorderSide.none,
              ),
              elevation: 0.5,
              color: dialogBackgroundColor ?? theme.cardColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    body ??
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (title != null) ..._titleBody(title!, theme),
                            if (desc != null)
                              Flexible(
                                fit: FlexFit.loose,
                                child: SingleChildScrollView(
                                  padding: padding,
                                  physics: BouncingScrollPhysics(),
                                  child: Text(
                                    desc!,
                                    textAlign: TextAlign.center,
                                    style: styleDesc ??
                                        TextStyle(
                                            color: Colors.black87,
                                            fontSize: fontSize_14,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    if (desc != null)
                      SizedBox(
                        height: 16.0,
                      ),
                    if (btnOk != null || btnCancel != null || btnOption != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            if (btnCancel != null)
                              Expanded(
                                child: btnCancel ?? Container(),
                              ),
                            if (btnCancel != null)
                              SizedBox(
                                width: 10,
                              ),
                            if (btnOption != null)
                              Expanded(
                                child: btnOption ?? Container(),
                              ),
                            if (btnOk != null)
                              SizedBox(
                                width: 10,
                              ),
                            if (btnOk != null)
                              Expanded(
                                child: btnOk!,
                              )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          if (showCloseIcon!)
            Positioned(
              right: 50.0,
              top: 70.0,
              child: GestureDetector(
                onTap: () {
                  onClose.call();
                },
                child: closeIcon ??  Icon(Icons.close),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _titleBody(String title, ThemeData theme) => [
        Container(
          width: double.infinity,
          height: showHeader!? 35:0,
          decoration: BoxDecoration(
            color: colorHeader == null ? ThemeColor.clr_3E3E3E : colorHeader,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: styleTitle ??
                  TextStyle(
                      color: ThemeColor.clr_FFFFFF,
                      fontSize: fontSize_18,
                      fontWeight: FontWeight.bold),
            ),
          ),
        ),
         SizedBox(
          height: 10.0,
        ),
      ];
}
