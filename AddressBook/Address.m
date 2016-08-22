//
//  Address.m
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "Address.h"

@implementation Address

- (instancetype)initWithFirstName:(NSString *)first lastName:(NSString *)last emailAddress:(NSString *)email {
    
    Address *rtn = nil;
    self = [super init];
    
    if (self && first != nil && last != nil && email != nil) {
        
        _first = first;
        _last = last;
        _email = email;
        
        rtn = self;
    }
    
    return rtn;
}

- (instancetype)init {
    return [self initWithFirstName:nil lastName:nil emailAddress:nil];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Full name: %@ %@\nEmail: %@", [self first], [self last], [self email]];
}



@end
