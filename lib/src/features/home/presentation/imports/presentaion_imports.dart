import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/status_builder.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/widgets/custom_item_card.dart';
import 'package:manazel/src/core/widgets/custom_shimmer.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/features/building_details/building_details_imports.dart';
import 'package:manazel/src/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:manazel/src/features/notifications/notifications_imports.dart';
import 'package:manazel/src/features/search/search_imports.dart';

import '../../../../config/language/languages.dart';
import '../../../../config/language/locale_keys.g.dart';

import '../../../../core/widgets/custom_circlur_button.dart';
import '../widgets/home_image_slider.dart';

part '../cubit/home_cubit.dart';
part '../cubit/home_state.dart';
part '../screens/home_screen.dart';
part '../widgets/home_body.dart';
part '../widgets/appbar_home.dart';
part '../widgets/home_actions.dart';
part '../widgets/home_items_card.dart';
