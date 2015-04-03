//
//  MainView.m
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "MainView.h"

@interface MainView ()

@end

@implementation MainView

- (void)viewDidLoad {
    [super viewDidLoad];
    // get List from Database
    [self setMyList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    // Set image actions on image holders
    [self setImageActions];
    // set User Details
    [self setUserDetails:[User getInstance]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/************** Twitter Search Protocol **********************/

// Update profile pic and name in the list from selection in twitter search
-(void) updateMyList:(SearchedUser *)user{
    UIImageView *pic = (UIImageView *)[self.view viewWithTag:imageTapped];
    pic.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", user.profile_image_url]]]];
    
    // if image tapped is of tag i, then its label tag is (i)*100 = 100
    NSInteger labelTag = (imageTapped*100);
    UILabel *name = (UILabel *)[self.view viewWithTag: labelTag];
    name.text = user.name;
}

/************* Intro Reason Protocol ********************/

-(void) updateReason:(NSString *)reason{
    NSLog(@"Reason to Meet: %@", reason);
}

/************************ Header Methods ************************/

-(void) setUserDetails:(User *)me
{
    UIImageView *currUserImage = (UIImageView *)[self.view viewWithTag:1];
        currUserImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", me.profilePicUrl]]]];
    currUserImage.layer.cornerRadius = 33.0f;
    currUserImage.clipsToBounds = YES;
    UILabel *currUserLabel = (UILabel *)[self.view viewWithTag:100];
    currUserLabel.text = [NSString stringWithFormat:@"@%@", me.name];
}

// Set My List
-(void) setMyList{
    
}

// Make image clickable
-(void) setImageActions{
    // User Interaction enabled in Storyboard
//    for (UIImageView *object in self.userImages) {
    UIImageView *object = [[UIImageView alloc] init];
    for(int i=1; i<=10; i++){
        object = (UIImageView *)[self.view viewWithTag:i];
        // Just set image place holder for profile pic
        if (i==1) {
            object.image = [UIImage imageNamed:@"AddUserHolder.png"];
            continue;
        }
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoTwitterSearch:)];
        singleTap.numberOfTapsRequired = 1;
        [object addGestureRecognizer:singleTap];
        [object setUserInteractionEnabled:YES];
    
        NSInteger labelTag = (i*100);
        // If name not set then set placeholder Image
        if ([((UILabel*)[self.view viewWithTag:labelTag]).text isEqualToString:@" "]) {
            object.image = [UIImage imageNamed:@"AddUserHolder.png"];
        }
        object.layer.cornerRadius = 20.0f;
        object.clipsToBounds = YES;
    }    
}

// On click of image make a transition with tag and set delegate self.twitterSearch.delegate = self.
-(void) gotoTwitterSearch:(UITapGestureRecognizer* ) sender{
    // set the tag of image tapped
    imageTapped = sender.view.tag;
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TwitterSearch *twtrSearch = [story instantiateViewControllerWithIdentifier:@"TwitterSearch"];
    twtrSearch.delegate = self;
    [self.navigationController pushViewController:twtrSearch animated:YES];
}



@end
