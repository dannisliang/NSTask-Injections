//
//  NSTask+Injection.m
//  parent
//
//  Created by Silas Schwarz on 7/7/15.
//  Copyright (c) 2015 Silas Schwarz. All rights reserved.
//

#import "NSTask+Injection.h"

#define INJECTION_ENV_VAR @"DYLD_INSERT_LIBRARIES"

@implementation NSTask (Injection)

- (NSArray *)injections {
    NSString *injections = self.environment[INJECTION_ENV_VAR];
    if (!injections) {
        injections = @"";
    }
    return [injections componentsSeparatedByString:@":"];
}

- (void)setInjections:(NSArray *)injections {
    NSMutableDictionary *environment = [NSMutableDictionary dictionaryWithDictionary:self.environment];
    environment[INJECTION_ENV_VAR] = [injections componentsJoinedByString:@":"];
    self.environment = [NSDictionary dictionaryWithDictionary:environment];
}

@end
