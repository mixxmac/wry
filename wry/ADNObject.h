//
//  ADNObject.h
//  wry
//
//  Created by Rob Warner on 6/25/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WrySettings.h"

extern NSString * const TagColorStart;
extern NSString * const TagColorEnd;

@interface ADNObject : NSObject

- (NSString *)colorDescription;
- (NSString *)colorize:(NSString *)text colorSetting:(WryColor)wryColor;

@end
