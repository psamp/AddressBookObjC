//
//  main.m
//  AddressBook
//
//  Created by Princess Sampson on 8/22/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [[Address alloc] initWithFirstName:@"Princess" lastName:@"Sampson" emailAddress:@"nospam@gmail.com"]);
    }
    return 0;
}
