import 'package:flutter/material.dart';

const mini = 10.0;
const Small = 13.0;
const SmallMedium = 14.0;
const Medium = 15.0;
const ExtraMedium = 17.0;
const Large = 20.0;
const String fontFamily = "Poppins";


TextStyle kminismall(Color colors) =>  TextStyle(
    color: colors,
    fontSize: mini,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);


TextStyle kTabText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: 17,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
);

TextStyle ksmallText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Small,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300
);

TextStyle ksmallMediumText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: SmallMedium,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);


TextStyle ksmallTextBold(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Small,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);


TextStyle kmediumText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Medium,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);



TextStyle kmediumTextBold(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Medium,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);



TextStyle kmediumTextExtra(Color colors) =>  TextStyle(
    color: colors,
    fontSize: ExtraMedium,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400
);



TextStyle kmediumTextBoldExtra(Color colors) =>  TextStyle(
    color: colors,
    fontSize: ExtraMedium,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500
);

TextStyle klargeText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Large,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500
);

TextStyle klargeTextBold(Color colors) =>  TextStyle(
    color: colors,
    fontSize: Large,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700
);


TextStyle kextralargeText(Color colors) =>  TextStyle(
    color: colors,
    fontSize: 45,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700
);

