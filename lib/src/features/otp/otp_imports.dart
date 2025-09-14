import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';
import 'package:manazel/src/core/extensions/widget_extenstion.dart';
import 'package:manazel/src/core/helpers/request_state.dart';
import 'package:manazel/src/core/widgets/auth_titled_header.dart';
import 'package:manazel/src/core/widgets/buttons/bottom_button.dart';
import 'package:manazel/src/core/widgets/underline_text_widget.dart';

import 'package:manazel/src/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:manazel/src/features/otp/presentation/screens/otp_forms.dart';

import '../../config/language/locale_keys.g.dart';
import '../../config/res/color_manager.dart';
import '../../core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import '../../core/widgets/auth_language_status_button.dart';
import '../../core/widgets/custom_back_button.dart';

part 'presentation/screens/otp_screen.dart';
part 'presentation/widgets/otp_body.dart';
