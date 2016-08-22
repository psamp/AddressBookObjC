//
//  AddressBook.m
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "AddressBook.h"
#import "Input.h"

@implementation AddressBook

- (instancetype)init {
    self = [super init];
    if (self) {
        _addresses = [NSMutableDictionary dictionary];
    }
    return self;
}

- (BOOL)addNewAddress {
    
    NSInteger expectedCount = [self.addresses count] + 1;
    
    NSString *first = getStringFromUser(30, @"First name (30 characters or less):");
    NSString *last = getStringFromUser(30, @"Last name (30 characters or less):");
    NSString *email = getStringFromUser(30, @"Email (30 characters or less):");
    NSString *buddy = getStringFromUser(30, @"Best bud's name (30 characters or less):");
    
    Address *addr = [[Address alloc] initWithFirstName:first lastName:last emailAddress:email buddyName:buddy];
    
    [self.addresses setValue:addr forKey:addr.fullName];
    
    return [self.addresses count] == expectedCount;
}

- (void)displayAddresses {
    for (NSString *key in self.addresses) {
        NSLog(@"%@", [self.addresses objectForKey:key]);
    }
}

@end
