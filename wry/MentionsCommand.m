//
//  MentionsCommand.m
//  wry
//
//  Created by Rob Warner on 3/25/13.
//  Copyright (c) 2013 Rob Warner. All rights reserved.
//

#import "MentionsCommand.h"
#import "ADNService.h"
#import "CommandUtils.h"

@implementation MentionsCommand

- (BOOL)run:(WryApplication *)app params:(NSArray *)params error:(NSError **)error {
  return [CommandUtils performListOperation:app
                                     params:params
                              minimumParams:0
                             successMessage:@"Mentions:"
                               errorMessage:nil
                                      error:error
                                  operation:^id(ADNService *service) {
                                    return params.count > 0 ? [service getMentions:[params objectAtIndex:0]
                                                                             error:error] :
                                      [service getMentions:error];
                                  }];
}

- (NSString *)usage {
  return @"[userid | @username]";
}

- (NSString *)help {
  return @"Displays the mentions for a user. If no user is specified, displays your mentions.";
}

- (NSString *)summary {
  return @"Display the mentions for a user";
}

@end