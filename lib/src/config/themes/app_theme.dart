import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/extensions/material_color_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        fontFamilyFallback: const ["Alexandria"],
        useMaterial3: true,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primaryContainer: AppColors.white,
          primary: AppColors.primary,
          onPrimary: AppColors.primary,
          secondary: AppColors.primary.withValues(alpha: 0.1),
          onSecondary: AppColors.primary.withValues(alpha: 0.1),
          error: AppColors.error,
          onError: AppColors.error,
          surface: AppColors.white,
          onSurface: AppColors.black,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.white),
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return AppColors.grey; // Change to the desired border color
              }
              return AppColors
                  .grey; // No border color when not in the inactive state
            },
          ),
        ),
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.bR15))),
        tabBarTheme: const TabBarTheme(
          mouseCursor: WidgetStatePropertyAll(MouseCursor.defer),
          tabAlignment: TabAlignment.fill,
          unselectedLabelColor: AppColors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.black,
        ),
        checkboxTheme: const CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          mouseCursor: WidgetStatePropertyAll(MouseCursor.uncontrolled),
        ),
        // visualDensity: VisualDensity.compact,
        fontFamily: 'Alexandria',
        menuButtonTheme: const MenuButtonThemeData(
            style: ButtonStyle(
                side: WidgetStatePropertyAll(
                    BorderSide(color: AppColors.primary)))),
        dropdownMenuTheme: const DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary))),
            menuStyle: MenuStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary))))),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: AppColors.primary,
              fontSize: AppRadius.bR24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Alexandria'),
          headlineMedium: TextStyle(
              color: AppColors.primary,
              fontSize: AppRadius.bR20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Alexandria'),
          headlineSmall: TextStyle(
            color: AppColors.primary,
            fontFamily: 'Alexandria',
            fontSize: AppRadius.bR18,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: AppRadius.bR16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Alexandria'),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: AppRadius.bR14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Alexandria'),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: AppRadius.bR12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Alexandria'),
          bodyLarge: TextStyle(
              color: AppColors.grey,
              fontSize: AppRadius.bR10,
              fontWeight: FontWeight.w500,
              fontFamily: 'Alexandria'),
          bodyMedium: TextStyle(
              color: AppColors.grey,
              fontSize: AppRadius.bR8,
              fontWeight: FontWeight.w600,
              fontFamily: 'Alexandria'),
          bodySmall: TextStyle(
              color: AppColors.grey,
              fontSize: AppRadius.bR6,
              fontWeight: FontWeight.w600,
              fontFamily: 'Alexandria'),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.bR48),
          ),
          backgroundColor: AppColors.primary,
          iconSize: AppRadius.bR25,
          enableFeedback: true,
        ),
        indicatorColor: AppColors.primary.withValues(alpha: 0.5),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),

        /// TODO :Dnd4: implement appbar theme.
        appBarTheme: AppBarTheme(
          color: AppColors.white,
          foregroundColor: AppColors.white,
          surfaceTintColor: AppColors.primary,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: AppColors.transparent,
          //   statusBarIconBrightness: Brightness.dark,
          // ),
          iconTheme: const IconThemeData(
            size: 20.0,
            color: AppColors.black,
          ),
          centerTitle: true,

          titleTextStyle: TextStyle(
              fontSize: AppSizes.sH20,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
              fontFamily: 'Alexandria'),
          // titleSpacing: 32,
          elevation: 0.0,
        ),

        // iconTheme: IconThemeData(color: AppColors.white),
        bottomAppBarTheme: BottomAppBarTheme(
            color: AppColors.white,
            height: AppSizes.sH75,
            surfaceTintColor: AppColors.white),
        textButtonTheme: const TextButtonThemeData(
            style:
                ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                // minimumSize: WidgetStatePropertyAll(
                //     Size(AppSizes.screenWidth, AppSizes.sH45)),
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.primary),
                minimumSize: WidgetStatePropertyAll(Size(323.w, 54.h)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.bR8))))),
        // iconButtonTheme: IconButtonThemeData(
        //     style: ButtonStyle(
        //         minimumSize: WidgetStatePropertyAll(
        //             Size(AppSizes.sW45, AppSizes.sH45)),
        //         backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        //         shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(AppRadius.bR25))))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(AppColors.white),
                minimumSize: WidgetStatePropertyAll(Size(323.w, 54.h)),
                side: const WidgetStatePropertyAll(
                    BorderSide(color: AppColors.primary)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(AppRadius.bR8),
                )))),
        inputDecorationTheme: InputDecorationTheme(
          isCollapsed: true,
          isDense: true,
          constraints: BoxConstraints(
            minHeight: 54.h,
            maxHeight: 54.h,
          ),
          activeIndicatorBorder: BorderSide.none,
          labelStyle: TextStyle(
              color: AppColors.grey,
              fontSize: AppRadius.bR12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Alexandria'),
          hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: AppRadius.bR12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Alexandria'),
          contentPadding: EdgeInsets.symmetric(
              vertical: AppRadius.bR10, horizontal: AppSizes.sW16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.bR8),
              borderSide: BorderSide(
                  color: AppColors.grey.withValues(alpha: 0.35),
                  width: AppRadius.bR2_5 / 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.bR8),
              borderSide: BorderSide(
                  color: AppColors.error, width: AppRadius.bR2_5 / 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.bR8),
              borderSide: BorderSide(
                  color: AppColors.grey, width: AppRadius.bR2_5 / 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.bR8),
              borderSide: BorderSide(
                  color: AppColors.primary, width: AppRadius.bR2_5 / 2)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.bR8),
            borderSide:
                BorderSide(color: AppColors.grey, width: AppRadius.bR2_5 / 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.bR8),
            borderSide:
                BorderSide(color: AppColors.error, width: AppRadius.bR2_5 / 2),
          ),
          outlineBorder:
              BorderSide(color: AppColors.grey, width: AppRadius.bR2_5 / 2),
        ));
  }

  static ThemeData get dark {
    return ThemeData(
      primarySwatch: AppColorsWithDarkMode.primary.toMaterialColor(),
      primaryColor: AppColorsWithDarkMode.primary,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColorsWithDarkMode.white,
      ),
      scaffoldBackgroundColor: AppColorsWithDarkMode.border,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColorsWithDarkMode.white,
        selectedItemColor: AppColorsWithDarkMode.primary,
        unselectedItemColor: AppColorsWithDarkMode.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: AppColorsWithDarkMode.primary,
          minimumSize: Size(AppSizes.sW30, AppSizes.sH30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.sH0,
            ),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColorsWithDarkMode.white,
      ),
      iconTheme: const IconThemeData(
        color: AppColorsWithDarkMode.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: AppColorsWithDarkMode.border,
      ),
      textTheme: GoogleFonts.alexandriaTextTheme(
        TextTheme(
          // This Style For AppBar Text
          headlineLarge: TextStyle(
            fontSize: FontSize.s18,
            color: AppColors.secondary,
            fontWeight: FontWeightManager.medium,
          ),
          // This Style For Normal Text With PrimaryColor
          titleLarge: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primary,
          ),
          // This Style For Normal Text With SecondryColor
          titleMedium: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primary,
          ),
          // This Style For Normal Text With ThirdColor
          titleSmall: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primary,
          ),
          // This Style For Hint Text
          bodySmall: TextStyle(
            fontSize: FontSize.s8,
            color: AppColors.hintText,
          ),
        ),
      ),
    );
  }
}
