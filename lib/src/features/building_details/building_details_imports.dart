import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';
import 'package:manazel/src/core/helpers/helpers.dart';
import 'package:manazel/src/core/helpers/lancher_helper.dart';
import 'package:manazel/src/core/helpers/status_builder.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/core/widgets/buttons/custom_outlined_button.dart';
import 'package:manazel/src/core/widgets/custom_circlur_button.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';
import 'package:manazel/src/features/building_details/cubit/property_details_cubit.dart';
import 'package:manazel/src/features/favorite/presentation/cubit/fav_cubit.dart';

import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import '../../core/widgets/buttons/default_button.dart';
import '../../core/widgets/custom_back_button.dart';
import '../book_appointment/book_appointment_imports.dart';

part 'presentation/screens/building_details_screen.dart';
part 'presentation/widgets/building_details_body.dart';
part 'presentation/widgets/building_details_image_slider.dart';
part 'presentation/widgets/change_container_building_details.dart';
part 'presentation/widgets/building_details_item_card.dart';
part 'presentation/widgets/building_details_text.dart';
part 'presentation/widgets/building_details_bottom_nav_bar.dart';
