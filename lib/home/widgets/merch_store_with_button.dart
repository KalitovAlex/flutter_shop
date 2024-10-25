import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MerchStoreWithButton extends StatelessWidget {
  const MerchStoreWithButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 90.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15.h,
              ),
              child: Image.asset(
                'assets/text.png',
                width: 90.w,
                height: 30.h,
              ),
            ),
            Container(
              width: 90.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 2.h,
                ),
                child: Text(
                  'SHOP NOW',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
