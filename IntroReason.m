////
////  IntroReason.m
////  OpenUp
////
////  Created by Gautam Madaan on 4/2/15.
////  Copyright (c) 2015 Gautam Madaan. All rights reserved.
////
//
//#import "IntroReason.h"
//
//@interface IntroReason ()
//
//@end
//
//@implementation IntroReason
//
//-(void) viewDidLoad {
//    [super viewDidLoad];
//    /****************************** Done Button framing ********************************/
//    UIButton *btn_bar=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
////    [btn_bar setBackgroundColor:[UIColor clearColor]];
//    [btn_bar setTitle:@"Done" forState:UIControlStateNormal];
//    [btn_bar addTarget:self action:@selector(doneEditing:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *doneEdit=[[UIBarButtonItem alloc]initWithCustomView:btn_bar];
//    self.navigationItem.rightBarButtonItem=doneEdit;
//    self.whyMeet.layer.cornerRadius = 10.0f;
//    self.whyMeet.clipsToBounds = YES;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//// Implement the twitter Protocol
//-(void) updateMyList:(SearchedUser *)user{
//    self.name.text = user.name;
//    self.profilePic.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", user.profile_image_url]]]];
//}
//
//-(void) doneEditing:(id)sender{
//    [self.delegate updateReason:self.whyMeet.text];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}
//
//@end
