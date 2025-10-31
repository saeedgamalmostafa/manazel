import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/helpers/helpers.dart';
import 'package:manazel/src/core/helpers/lancher_helper.dart';
import 'package:manazel/src/core/helpers/validators.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/core/widgets/buttons/loading_button.dart';
import 'package:manazel/src/core/widgets/custom_app_bar.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';
import 'package:manazel/src/core/widgets/text_fields/default_text_field.dart';
import 'package:manazel/src/features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:path/path.dart';

import '../../core/widgets/Custom_text_form_field.dart';

part 'presentation/widgets/contact_us_body.dart';
part 'presentation/screens/contact_us_screen.dart';
part 'presentation/widgets/social_item.dart';
