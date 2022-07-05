// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceKeys {
  static SharedPreferences? _preferences;
  static const _isLogedIn = 'false';
  static const _company_id = 'company_id';
  static const _company_name = 'company_name';
  static const _company_logo = 'company_logo';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserLoginRememberMeInfo(bool isLogin) async =>
      await _preferences?.setBool(_isLogedIn, isLogin);

  static getUserLoginRememberMeInfo() =>
      _preferences?.getBool(_isLogedIn) ?? false;
  static getCompanyId() => _preferences?.getString(_company_id);
  static getCompanyName() => _preferences?.getString(_company_name);
  static getCompanyLogo() => _preferences?.getString(_company_logo);

  static Future setUserLoginInfo(
    String companyId,
    String companyName,
    String companyLogo,
  ) async {
    await _preferences?.setString(_company_id, companyId);
    await _preferences?.setString(_company_name, companyName);
    await _preferences?.setString(_company_logo, companyLogo);
  }
}
