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

+ (void) run {
    AddressBook *addressBook = [[AddressBook alloc] init];
    BOOL running = YES;
    
    while (running) {
        [addressBook addMultipleAddresses];
        
        NSLog(@"These are the addresses you've created:");
        [addressBook displayAllAddressKeys];
        
        [addressBook viewSingleOrAllAddresses];
        
        NSInteger cont = getNumberFromUser(2, @")0 Add more addresses 1) Quit");
        
        if (cont == 1) {
            running = NO;
        }
        
    }
}

- (void)addMultipleAddresses {
    BOOL addingAddresses = YES;
    
    while (addingAddresses) {
        [self addOneAddress];
        NSInteger cont = getNumberFromUser(2, @"Would you like to add another address? 0) No 1) Yes");
        
        if (cont == 0) {
            addingAddresses = NO;
        }
    }
    
}

- (BOOL)addOneAddress {
    
    NSInteger expectedCount = [self.addresses count] + 1;
    
    NSString *first = getStringFromUser(31, @"First name (30 characters or less):");
    NSString *last = getStringFromUser(31, @"Last name (30 characters or less):");
    NSString *email = getStringFromUser(31, @"Email (30 characters or less):");
    NSString *buddy = getStringFromUser(31, @"Buddy's name (30 characters or less):");
    
    Address *addr = [[Address alloc] initWithFirstName:first lastName:last emailAddress:email buddyName:buddy];
    [self.addresses setValue:addr forKey:addr.fullName];
    
    return [self.addresses count] == expectedCount;
}

-(void)viewSingleOrAllAddresses {
    NSInteger option = getNumberFromUser(2, @"0) See full info about all your addresses. 1) Select an address to view");
    
    if (option == 0) {
        [self displayAllAddresses];
        
    } else if(option == 1) {
        Address *selected = nil;
        
        while(selected == nil) {
            NSString *input = getStringFromUser(61, @"Enter the full name of the address you'd like to view. Ensure there are no typos.");
            
            selected = [self.addresses objectForKey:input];
        }
        
        NSLog(@"%@", selected);
    }
}

- (void)displayAllAddresses {
    for (NSString *key in self.addresses) {
        NSLog(@"%@", [self.addresses objectForKey:key]);
    }
}

- (void)displayAllAddressKeys {
    NSArray *fullNames = [self.addresses allKeys];
    
    for (NSString *key in fullNames) {
        NSLog(@"%@", key);
    }
}

@end
