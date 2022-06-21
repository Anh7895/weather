import 'dart:io';

import 'package:weather/bloc/base_state/base_state.dart';
import 'package:weather/common/dialog/bottom_sheet_dialog_utils.dart';
import 'package:weather/common/resource/name_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/common/config/routers_name.dart';
import 'package:weather/common/resource/theme_color.dart';
import 'package:weather/common/multi_language/internationalization.dart' as language;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/common/resource/strings.dart';
import 'package:weather/common/resource/text_style.dart';
import 'package:weather/common/exceptions/network_connection_exception.dart';

import 'base_screen.dart';

///
/// An utility [Widget] takes responsibility for handling events and errors in a [Stream]
/// of http responses, base on BlocConsumer Widget
///
class HttpStreamHandler<B extends Bloc<dynamic, S>, S extends BaseState>
    extends StatefulWidget {
  final B? bloc;
  final BlocWidgetBuilder<S> builder;
  final Function(BuildContext context, S state)? listener;
  final bool? isNeedReset;
  final S? state;

  const HttpStreamHandler(
      {Key? key,
      required this.builder,
      required this.listener,
      this.bloc,
      this.state,
      this.isNeedReset = false})
      : super(key: key);

  @override
  _HttpStreamHandler<B, S> createState() => _HttpStreamHandler<B, S>();
}

class _HttpStreamHandler<B extends Bloc<dynamic, S>, S extends BaseState>
    extends State<HttpStreamHandler<B, S>> {
  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isNeedReset!) {
      _subscribe();
    }
    return BlocConsumer<B, S>(
        bloc: widget.bloc, builder: widget.builder, listener: widget.listener!);
  }

  void _subscribe() {
    widget.bloc?.stream.listen((state) {
      if (state is StartCallApiState) {
        // BaseScreen.showLoading(context);
      } else if (state is ApiSuccessState) {
        // BaseScreen.hideLoading(context);
      } else if (state is HideLoadingState) {
        // BaseScreen.hideLoading(context);
      } else if (state is ApiErrorState) {
        // BaseScreen.hideLoading(context);
        var _errorCode = state.errorCode;
        var _errorMessage = state.errorMessage;
        var _errorDescription = state.errorDescription;
        var err = state.error;
        if(err is NetworkConnectionException){
          showAlertBottomSheetDialog(context, onConfirm: () {
          }, title: TextConstants.textFailed, message: language.S.of(context).translate('text101Err'),icon: ic_error);
        }else if(err is DioError){
          if (err.response?.statusCode ==
              HttpStatus.internalServerError) {
            showAlertBottomSheetDialog(context,
                onConfirm: () {},
                title: TextConstants.textFailed,
                message: language.S.of(context).translate('text100Err'),
                icon: ic_error);
          } else if (err.type == DioErrorType.connectTimeout ||
              err.type == DioErrorType.receiveTimeout) {
            _mappingError(
                _errorCode ?? "", language.S.of(context).translate('text109Err'), _errorDescription ?? "");
          } else {
            print("Err $err");
            _mappingError(
                _errorCode ?? "", _errorMessage ?? "", _errorDescription ?? "");
          }
        } else {
          _mappingError(
              _errorCode ?? "", _errorMessage ?? "", _errorDescription ?? "");
        }
      }
    }, onError: (onError) {
      showAlertBottomSheetDialog(context, onConfirm: () {
      }, title: TextConstants.textFailed, message: '',icon: ic_error);
    }, onDone: () {}, cancelOnError: true);
  }

  void _mappingError(
      String errorCode, String errorMessage, String errorDescription) {
    var _transformMessage = "";
    if (errorMessage == TextConstants.textSystemIsBusyPleaseTryAgainLater) {
      _transformMessage = language.S
          .of(context)
          .translate(TextConstants.textSystemIsBusyPleaseTryAgainLater);
      showAlertBottomSheetDialog(context, onConfirm: () {
      }, title: TextConstants.textFailed, message: '${errorMessage}',icon: ic_error);
    } else if (errorMessage ==
        TextConstants.textNoConnectionPleaseCheckYourConnectionAndTryAgain) {
      _transformMessage = language.S.of(context).translate(
          TextConstants.textNoConnectionPleaseCheckYourConnectionAndTryAgain);
      showAlertBottomSheetDialog(context, onConfirm: () {
      }, title: TextConstants.textFailed, message: '${errorMessage}',icon: ic_error);
    } else {
      showAlertBottomSheetDialog(context, onConfirm: () {
      }, title: TextConstants.textFailed, message: '${errorMessage}',icon: ic_error);
    }
  }
}

String handleResponseError(error) {
  print(error);
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.sendTimeout:
        return TextConstants.textSystemIsBusyPleaseTryAgainLater;
      case DioErrorType.receiveTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.response:
        break;
      case DioErrorType.cancel:
        // TODO: Handle this case.
        break;
      case DioErrorType.other:
        // TODO: Handle this case.
        break;
    }
  } else if (error is NetworkConnectionException) {
    return TextConstants.textNoConnectionPleaseCheckYourConnectionAndTryAgain;
  } else if (error is SocketException) {
    return TextConstants.textSystemIsBusyPleaseTryAgainLater;
  } else if (error is PlatformException) {
    return error.message!;
  }

  return TextConstants.textSystemIsBusyPleaseTryAgainLater;
}

showAlert(BuildContext context, String title, String message,
    {Function(BuildContext)? onDismiss, bool? dismissible, bool? canPop}) {
  final mediaData = MediaQuery.of(context);
  showDialog(
      barrierDismissible: dismissible ?? true,
      context: context,
      builder: (c) => WillPopScope(
        onWillPop: () => Future.value(canPop ?? true),
        child: MediaQuery(
          // prevent UI broken when text-scale is changed by system
          data: mediaData.copyWith(textScaleFactor: 1.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(title,
                      style: TextStyleCommon.dialogContentAlertLight(
                        context,
                      ),
                      textAlign: TextAlign.center),
                  Text(
                    message,
                    style: TextStyleCommon.dialogContentAlertLight(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      )).whenComplete(() {
    if (onDismiss != null) {
      onDismiss(context);
    }
  });
}
