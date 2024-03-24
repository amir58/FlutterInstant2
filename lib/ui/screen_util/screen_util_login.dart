import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilLogin extends StatefulWidget {
  const ScreenUtilLogin({super.key});

  @override
  State<ScreenUtilLogin> createState() => _ScreenUtilLoginState();
}

class _ScreenUtilLoginState extends State<ScreenUtilLogin> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: const Color(0xFF1E0C1F),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              children: [
                Text(
                  'قم بتسجيل الدخول الى حسابك',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 26.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 311.w,
                  height: 56.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.h,
                    vertical: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color(0xFF413682),
                        Color(0xFFFB77C6),
                      ],
                    ),
                  ),
                  child: Text(
                    'دخول',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
