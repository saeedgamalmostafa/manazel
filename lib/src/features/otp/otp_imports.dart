import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/widgets/auth_titled_header.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';
import 'package:manazel/src/features/login/login_imports.dart';
import 'package:manazel/src/features/otp/presentation/screens/otp_forms.dart';

import '../../config/language/locale_keys.g.dart';
import '../../config/res/color_manager.dart';
import '../../core/widgets/auth_language_status_button.dart';
import '../../core/widgets/custom_back_button.dart';

part 'presentation/screens/otp_screen.dart';
part 'presentation/widgets/otp_body.dart';
part 'presentation/widgets/otp_actions.dart';