//
//  ViewController.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <FacebookSDK/FacebookSDK.h>
#import "MainView.h"
#import "AppDelegate.h"
#import "User.h"
//#import "AFNetworking.h"
#import <TwitterKit/TwitterKit.h>


@interface ViewController : UIViewController //<FBLoginViewDelegate>

@property(strong, nonatomic) IBOutlet UILabel *mainTitle;
@property(strong, nonatomic) IBOutlet UILabel *subTitle;
@property(strong, nonatomic) User *twitterUser;

@end

