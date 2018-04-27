//
//  General.h
//  learningTest
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef General_h
#define General_h

#define RGB(R,G,B)                    [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#define RGBA(R,G,B,A)                 [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define HexColor(value)     [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0]

// 屏幕高度
#define SCREENHEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREENWIDTH          [[UIScreen mainScreen] bounds].size.width

#define ZXYLocalizedString(key) [kLanguageManager localizedStringForKey:key table:LocalizableName_Normal value:nil]

#define appDelegate     ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define PublicTitleFont    (iPhone6plus_6Splus || iPhone6_6S || iPhone6plusZoomMode) ? [UIFont fontWithName:@"Telugu Sangam MN" size:17.f] : [UIFont fontWithName:@"Telugu Sangam MN" size:14.f]


#define SharedNotification            [NSNotificationCenter defaultCenter]


#endif /* General_h */
