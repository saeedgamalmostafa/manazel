import 'package:easy_localization/easy_localization.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';

class Validators {
  static String? validateEmpty(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? LocaleKeys.fillField;
    }
    return null;
  }

  static String? validatePassword(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? LocaleKeys.passRequiredValidation.tr();
    } else if (value!.length < 6) {
      return message ?? LocaleKeys.passValidation.tr();
    }
    return null;
  }

  static String? validateEmail(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? LocaleKeys.fillField.tr();
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.["
            r"a-zA-Z]+")
        .hasMatch(value!)) {
      return message ?? LocaleKeys.mailValidation.tr();
    }
    return null;
  }

  static String? validatePhone(String? value, {String? message}) {
    final phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return message ?? LocaleKeys.fillField.tr();
    }

    // ✅ allow optional "+" and at least 9 digits
    final regex = RegExp(r'^\+?[0-9]{9,}$');

    if (!regex.hasMatch(phone)) {
      return message ?? LocaleKeys.phoneValidation.tr();
    }

    return null;
  }

  static String? validatePasswordConfirm(String? value, String? pass,
      {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? LocaleKeys.fillField.tr();
    } else if (value != pass) {
      return message ?? LocaleKeys.confirmValidation.tr();
    }
    return null;
  }

  static String? validateDropDown<T>(T? value, {String? message}) {
    if (value == null) {
      return message ?? LocaleKeys.fillField.tr();
    }
    return null;
  }
}
