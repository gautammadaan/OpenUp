//
//  User.m
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User
//@synthesize gender, email, lastName, firstName, dob, fbId, name;

+ (id)getInstance {
    static User *user = nil;
    
    @synchronized(self) {
        if (user == nil)
            user = [[self alloc] init];
    }
    return user;
}

//-(void) setDetails:(NSString *) first last:(NSString *)last
//            gender:(NSString *) gen dob:(NSString *) birthDate email:(NSString *) mailID fbId:(NSString *)fbID
//{
//    self.firstName = first;
//    self.lastName = lastName;
//    self.dob = birthDate;
//    self.email = mailID;
//    self.gender = gen;
//    self.fbId = fbID;
//    self.name = [NSString stringWithFormat:@"%@ %@",first, last];
//}

@end