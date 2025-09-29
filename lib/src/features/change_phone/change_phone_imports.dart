import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/core/helpers/validators.dart';
import 'package:manazel/src/core/widgets/buttons/bottom_button.dart';
import 'package:manazel/src/features/change_phone/cubit/chagne_phone_cubit.dart';

import '../../config/language/languages.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/app_sizes.dart';
import '../../core/navigator/app_navigator.dart';
import '../../core/widgets/Custom_text_form_field.dart';
import '../../core/widgets/buttons/custom_elevated_button.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_county_drop_down.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/default_bottom_sheet.dart';
import '../app_layout/app_layout_imports.dart';

import 'package:manazel/src/config/res/color_manager.dart';

part 'presentation/screens/change_phone_screen.dart';
part 'presentation/widgets/change_phone_body.dart';
part 'presentation/widgets/change_password_bottom_sheet.dart';
