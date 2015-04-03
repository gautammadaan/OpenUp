//
//  AppDelegate.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>
#import "Constants.h"

//#import <FacebookSDK/FacebookSDK.h>
#import "User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    User *user;
}


@property (strong, nonatomic) UIWindow *window;


@end

