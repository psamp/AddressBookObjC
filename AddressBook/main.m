//
//  main.m
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AddressBook *addrBook = [[AddressBook alloc] init];
        [addrBook addMultipleAddresses];
        [addrBook displayAddresses];
    }
    return 0;
}
