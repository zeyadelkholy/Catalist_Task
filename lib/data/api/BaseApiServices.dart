import 'package:flutter/cupertino.dart';

abstract class BaseApiServices {
  Future<dynamic> getLoginApiResponse(String url, dynamic data,BuildContext context,String username,String password,String langID);
  Future<dynamic> getLogoutApiResponse(String url, String authToken,String username,BuildContext context);
}