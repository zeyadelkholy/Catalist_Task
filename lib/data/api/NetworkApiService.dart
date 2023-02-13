import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:catalist/data/api/BaseApiServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import '../../utils/app_utils.dart';
import '../model/user_respose_model.dart';
import 'api_exception.dart';
import 'api_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NetworkApiService extends BaseApiServices {
  @override
  Future getLoginApiResponse(String url, data, BuildContext context,
      String username,
      String password, String langID) async {
    dynamic responseJson;
    try {
      Response response =
      await post(Uri.parse(AppUrl.baseUrl + url), body: data)
          .timeout(Duration(seconds: 10));

      responseJson =
          returnResponse(response, 'login', context, username, password , langID);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response, String type,
      BuildContext context, String username, String password , String langID) {
    if ((type == 'login' || type == 'update') && response.statusCode == 200) {
      print('ddd${response.statusCode}');
      Welcome5 responseJson = Welcome5.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      switch (responseJson.code) {
        case 200:
          print(response.body.toString());
          Welcome5 responseJson = Welcome5.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
          print(responseJson.message);
          print(responseJson.data!.token);
          var SharedPrefrence;
          SharedPrefrence.saveUser(responseJson, password, username);
          if (username == 'supervisor') {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'SupervisorLayout', (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'EmployeeLayout', (Route<dynamic> route) => false);

          }
          break;

        case 400:
          throw BadRequestException(responseJson.message.toString());

        case 500:
        case 404:
          throw UnauthorizedException(responseJson.message);
        default:
          throw FetchDataException(responseJson.message.toString());
      }
    } else if (response.statusCode == 400) {
      print('ddddddddd');
      print("error2 +");
      
      var responseJson;
      switch (responseJson.code) {
        case 400:
          throw BadRequestException(responseJson.message.toString());
      }
    } else if (response.statusCode == 500) {
      throw BadRequestException('هناك خطأ في السرفر حاول مرة أخرى');
    } else if (response.statusCode == 401) {
      Utils.flushBarErrorMessage('تأكد من صحة البيانات', context);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Future getLogoutApiResponse(String url, String authToken, String username, BuildContext context) {
    throw UnimplementedError();
  }




  }
