import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/core/helpers/status_builder.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/widgets/custom_app_bar.dart';
import 'package:manazel/src/core/widgets/custom_loading.dart';
import 'package:manazel/src/core/widgets/not_contain_data.dart';
import 'package:manazel/src/features/My_orders/presentation/cubit/reservation_cubit.dart';
import 'package:manazel/src/features/favorite/favorite_imports.dart';

import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import '../../core/widgets/custom_text.dart';
import 'package:manazel/src/config/res/assets.gen.dart';

part 'presentation/screens/my_orders_screen.dart';
part 'presentation/widgets/my_orders_body.dart';
part 'presentation/widgets/my_orders_item_card.dart';
