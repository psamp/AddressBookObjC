//
//  Address.h
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property(nonatomic, readwrite, copy) NSString *first;
@property(nonatomic, readwrite, copy) NSString *last;
@property(nonatomic, readwrite, copy) NSString *email;

- (instancetype)initWithFirstName:(NSString *)first
                         lastName:(NSString *)last
                     emailAddress:(NSString *)email NS_DESIGNATED_INITIALIZER;

@end
