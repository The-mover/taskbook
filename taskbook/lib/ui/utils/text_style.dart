import 'package:flutter/material.dart';
import 'package:taskbook/ui/utils/colors.dart';

class HeadingStyle {
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xffffffff),
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static const accent = TextStyle(
    fontFamily: 'Rubik',
    color: MyColors.accent,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

class SubHeadingStyle {
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xbfffffff),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static const bold = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xbfffffff),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static const accent = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xff54ffe0),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

class ButtonTextStyle {
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xffffffff),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static const accent = TextStyle(
    fontFamily: 'Rubik',
    color: MyColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static const small = TextStyle(
    fontFamily: 'Rubik',
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static const smallColored = TextStyle(
    fontFamily: 'Rubik',
    color: Color(0xff54ffe0),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}

class BodyStyle {
  static const bold = TextStyle(
    fontFamily: 'Rubik',
    color: Colors.black,
    fontSize: 19.657142639160156,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static const extraSmall = TextStyle(
    fontFamily: 'Rubik',
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

class DropdownTextStyle {
  static const primary = TextStyle(
    fontFamily: 'CircularStd',
    color: MyColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
