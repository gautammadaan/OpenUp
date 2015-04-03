//
//  ViewController.m
//  OpenUp
//
//  Created by Gautam Madaan on 3/19/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Standard Twitter setup
    [Fabric with:@[[Twitter sharedInstance]]];
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        // play with Twitter session
        if (session) {
            NSLog(@"signed in as %@", [session userName]);
            [self setUser:session];
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**************************** Helper Methods *************************/

// Set in local memory
-(void) setUser:(TWTRSession *)session
{
    // User is a singleton class to hold current user
    _twitterUser = [User getInstance];
    _twitterUser.name = session.userName;
    _twitterUser.twitterId = session.userID;
    [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID] completion:^(TWTRUser *user, NSError *error){
        _twitterUser.profilePicUrl = user.profileImageLargeURL;
        NSLog(@"%@", _twitterUser.profilePicUrl);
    }];
    
    [self redirectToMainView];
    return;
}

// Send to Database
-(void) postUser
{
    return;
}

// redirect to next view after Login i.e. Main view
-(void) redirectToMainView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainView *mainView = (MainView *)[storyboard instantiateViewControllerWithIdentifier:@"MainView"];    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainView];
    [self presentViewController:navigationController animated:YES completion:nil];
}
@end
