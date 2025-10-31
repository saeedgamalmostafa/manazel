import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/core/helpers/status_builder.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/widgets/custom_app_bar.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/core/widgets/custom_loading.dart';
import 'package:manazel/src/core/widgets/custom_shimmer.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';
import 'package:manazel/src/core/widgets/image_widgets/custom_avatar.dart';
import 'package:manazel/src/core/widgets/not_contain_data.dart';
import 'package:manazel/src/features/notifications/presentation/cubit/notifications_cubit.dart';

import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import '../../core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

part 'presentation/screens/notifications_screen.dart';
part 'presentation/widgets/notifications_body.dart';
part 'presentation/widgets/notifications_item_card.dart';
