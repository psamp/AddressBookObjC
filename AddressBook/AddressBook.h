//
//  AddressBook.h
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface AddressBook : NSObject

@property(nonatomic, readonly, copy) NSMutableDictionary *addresses;

+ (void) run;

- (void)addMultipleAddresses;
- (BOOL)getAddressFromUser;
- (void)updateAddressBuddy;

- (void)displayAllAddresses;
- (void)displayAllAddressKeys;
- (void)viewInfoAboutOneOrAllAddresses;

- (BOOL)askUserToContinue:(NSString *)yes orQuit:(NSString *)no;
@end
