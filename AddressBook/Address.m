//
//  Address.m
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "Address.h"

@implementation Address

- (instancetype)initWithFirstName:(NSString *)first
                         lastName:(NSString *)last
                     emailAddress:(NSString *)email
                        buddyName:(NSString *)buddy{
    
    Address *rtn = nil;
    self = [super init];
    
    if (self && first != nil && last != nil && email != nil) {
        
        _first = first;
        _last = last;
        _email = email;
        _buddy = buddy;
        
        rtn = self;
    }
    
    return rtn;
}

- (instancetype)init {
    return [self initWithFirstName:nil lastName:nil emailAddress:nil buddyName:nil];
}

- (NSString *)description {
    NSMutableString *rtn = [NSMutableString string];
    
    if(self.buddy) {
        rtn = [NSMutableString stringWithFormat: @"Full name: %@ %@ | Email: %@ | Buddy's name: %@", self.first, self.last, self.email, self.buddy];
    } else {
        rtn = [NSMutableString stringWithFormat: @"Full name: %@ %@ | Email: %@", self.first, self.last, self.email];
    }
    
    return rtn;
}

-(NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.first, self.last];
}


@end
