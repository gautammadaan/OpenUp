//
//  MainView.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Constants.h"
#import "TwitterSearch.h"
#import "IntroReason.h"

@interface MainView : UIViewController <TwitterSearchDelegate>//, IntroReasonDelegate>
{
    NSInteger imageTapped;
}
@property(strong, nonatomic) IBOutlet UIImageView *userImage;
@property(strong, nonatomic) IBOutlet UIImageView *user1Image;
@property(strong, nonatomic) IBOutlet UIImageView *user2Image;
@property(strong, nonatomic) IBOutlet UIImageView *user3Image;
@property(strong, nonatomic) IBOutlet UIImageView *user4Image;
@property(strong, nonatomic) IBOutlet UIImageView *user5Image;
@property(strong, nonatomic) IBOutlet UIImageView *user6Image;
@property(strong, nonatomic) IBOutlet UIImageView *user7Image;
@property(strong, nonatomic) IBOutlet UIImageView *user8Image;
@property(strong, nonatomic) IBOutlet UIImageView *user9Image;

@property(strong, nonatomic) NSMutableArray *userLabels;
@property(strong, nonatomic) NSMutableArray *userImages;

@property(strong, nonatomic) IBOutlet UILabel *userName;
@property(strong, nonatomic) IBOutlet UILabel *user1Name;
@property(strong, nonatomic) IBOutlet UILabel *user2Name;
@property(strong, nonatomic) IBOutlet UILabel *user3Name;
@property(strong, nonatomic) IBOutlet UILabel *user4Name;
@property(strong, nonatomic) IBOutlet UILabel *user5Name;
@property(strong, nonatomic) IBOutlet UILabel *user6Name;
@property(strong, nonatomic) IBOutlet UILabel *user7Name;
@property(strong, nonatomic) IBOutlet UILabel *user8Name;
@property(strong, nonatomic) IBOutlet UILabel *user9Name;

-(void) setUserDetails:(User *) me;

@end
