import "package:dev_pleno_pokemon_api/utils/app_colors.dart";
import "package:dev_pleno_pokemon_api/views/pages/home_screen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

void main() {
  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
          theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              iconSize: 22.sp,
            ),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                size: 22.sp,
                color: Colors.white,
              ),
              actionsIconTheme: IconThemeData(
                size: 22.sp,
                color: Colors.white,
              ),
              titleTextStyle: GoogleFonts.nunito(
                fontSize: 22.sp,
                color: Colors.white,
              ),
              toolbarTextStyle: GoogleFonts.nunito(
                fontSize: 22.sp,
                color: Colors.white,
              ),
              toolbarHeight: 65.h,
              backgroundColor: AppColors.primary,
              scrolledUnderElevation: 0.0,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.primary,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: AppColors.primary,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
