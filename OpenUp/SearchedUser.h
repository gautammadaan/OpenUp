//
//  SearchedUser.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/30/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MTLModel.h"
//#import "MTLJSONAdapter.h"


@interface SearchedUser : NSObject

@property(strong, nonatomic) NSString *screen_name; //twitter handle
@property(strong, nonatomic) NSString *name;    // twitter name
@property(strong, nonatomic) NSString *profileDescription; // profile description
@property(strong, nonatomic) NSMutableString *profile_image_url; // http url, there is also a https link
@property(strong, nonatomic) NSString *whyMeet;
@property(nonatomic) BOOL resetPlaceholder;

@end
