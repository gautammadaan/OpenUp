//
//  User.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

@interface User : NSObject


@property(nonatomic) NSString *name;
@property(nonatomic) NSString *gender;
@property(nonatomic) NSString *dob;
@property(nonatomic) NSString *email;
@property(nonatomic) NSString *twitterId;
@property(nonatomic) NSString *profilePicUrl;

+(id) getInstance;

@end
