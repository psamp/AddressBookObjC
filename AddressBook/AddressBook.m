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
        _addresses = [NSMutableDictionary <NSString *, Address *> dictionary];
    }
    return self;
}

+ (void)run {
    AddressBook *addressBook = [[AddressBook alloc] init];
    BOOL running = YES;
    
    while (running) {
        [addressBook addMultipleAddresses];
        
        NSLog(@"These are the addresses you've created.");
        [addressBook displayAllAddressKeys];
        
        if([addressBook.addresses count] > 1) {
            [addressBook updateAddressBuddy];
        }
        
        [addressBook viewInfoAboutOneOrAllAddresses];
        
        running = [addressBook askUserToContinue:@"Add more addresses" orQuit:@"Quit"];
        
    }
}

- (void)addMultipleAddresses {
    BOOL addingAddresses = YES;
    
    while (addingAddresses) {
        [self getAddressFromUser];
        
        addingAddresses = [self askUserToContinue:@"Add another address" orQuit:@"Quit adding addresses"];;
    }
    
}

- (BOOL)getAddressFromUser {
    
    NSInteger expectedCount = [self.addresses count] + 1;
    
    NSString *first = getStringFromUser(31, @"First name (30 characters or less):");
    NSString *last = getStringFromUser(31, @"Last name (30 characters or less):");
    NSString *email = getStringFromUser(31, @"Email (30 characters or less):");
    
    Address *addr = [[Address alloc] initWithFirstName:first lastName:last emailAddress:email buddyName:nil];
    [self.addresses setValue:addr forKey:addr.fullName];
    
    return [self.addresses count] == expectedCount;
}

- (void)updateAddressBuddy {
    BOOL addingBuddies = YES;
    
    while (addingBuddies) {
        Address *selected = nil;
        Address *existingAddress = nil;
        
        while (selected == nil) {
            selected = [self.addresses objectForKey:getStringFromUser(61, @"Which address would you like to give a buddy? Enter their full name:")];
        }
        
        while (existingAddress == nil) {
            existingAddress = [self.addresses objectForKey:getStringFromUser(61, @"Enter the full name of one of your other addresses:")];
        }
        
        selected.buddy = [self.addresses objectForKey:existingAddress.fullName];
        
        addingBuddies = [self askUserToContinue:@"Give someone else a buddy" orQuit:@"Stop adding buddies"];
        
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

-(void)viewInfoAboutOneOrAllAddresses {
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

- (BOOL)askUserToContinue:(NSString *)yes orQuit:(NSString *)no {
    NSString *prompt = [NSString stringWithFormat:@"0) %@ 1) %@", no, yes];
    NSInteger cont = getNumberFromUser(2, prompt);
    
    return cont == 1;
}

@end
