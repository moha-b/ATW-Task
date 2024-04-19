part of 'resources.dart';

abstract class AppDecoration {
  static OutlineInputBorder ROUNDEDBORDER() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.GREY, width: 1),
      );
}
