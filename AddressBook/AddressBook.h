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
- (void)viewSingleOrAllAddresses;
- (BOOL)addOneAddress;
- (void)addMultipleAddresses;
- (void)displayAllAddresses;
- (void)displayAllAddressKeys;

@end
