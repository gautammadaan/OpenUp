//
//  TwitterSearch.h
//  OpenUp
//
//  Created by Gautam Madaan on 3/28/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "SearchedUser.h"
#import "IntroReason.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>

@protocol TwitterSearchDelegate <NSObject>

-(void) updateMyList:(SearchedUser *) user;

@end

@interface TwitterSearch : UITableViewController <UISearchBarDelegate>

@property(strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property(strong, nonatomic) NSMutableArray *twitterUsers;

// delegate declaration
@property (nonatomic, weak) id<TwitterSearchDelegate> delegate;


@end
