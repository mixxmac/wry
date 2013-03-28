//
//  UnmuteCommand.m
//  wry
//
//  Created by Rob Warner on 3/26/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "UnmuteCommand.h"
#import "ADNService.h"
#import "CommandUtils.h"

@implementation UnmuteCommand

- (BOOL)run:(WryApplication *)app params:(NSArray *)params error:(NSError **)error {
  return [CommandUtils performObjectOperation:app
                                       params:params
                                minimumParams:1
                               successMessage:@"Unmuted user:"
                                 errorMessage:@"You must specify a user ID or @username to unmute"
                                        error:error
                                    operation:(ADNOperationBlock) ^(ADNService *service) {
                                      return [service unmute:[params objectAtIndex:0] error:error];
                                    }];
}

- (NSString *)usage {
  return @"<userid | @username>";
}

- (NSString *)help {
  NSMutableString *help = [[NSMutableString alloc] init];
  [help appendString:@"Unmutes a user. You must specify either the user's ID or @username.\n"];
  [help appendString:@"Displays the user information for the user you've unmuted."];
  return help;
}

- (NSString *)summary {
  return @"Unmute a user";
}

@end