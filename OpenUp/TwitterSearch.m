//
//  TwitterSearch.m
//  OpenUp
//
//  Created by Gautam Madaan on 3/28/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "TwitterSearch.h"

@interface TwitterSearch ()

@end

@implementation TwitterSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.twitterUsers = [[NSMutableArray alloc] init];
    self.tableView.delegate = self;
    self.searchBar.delegate = self;
    [self.searchBar becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.twitterUsers count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    Update delegate here
    ((SearchedUser *)[_twitterUsers objectAtIndex:indexPath.row]).resetPlaceholder = YES;
    [self.delegate updateMyList:[_twitterUsers objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
//    [self getReasonToMeet:[_twitterUsers objectAtIndex:indexPath.row]];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"TwitterUserCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    if (cell==nil)
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    SearchedUser *user = [[SearchedUser alloc] init];
    user = [self.twitterUsers objectAtIndex:indexPath.row];
    
    // Update twitter user
    cell.textLabel.text = [NSString stringWithFormat:@"%@: @%@", user.name, user.screen_name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", user.profileDescription];
    cell.detailTextLabel.numberOfLines = 2;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", user.profile_image_url]]]];
    cell.imageView.layer.cornerRadius = 23.0f;
    [cell.imageView setClipsToBounds:YES];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/***************** Search Bar Delegate ****************/
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{                     // called when keyboard search button pressed
    
    if (![searchBar.text isEqualToString:@""]) {
        NSString *statusesShowEndpoint = TwitterUserSearch;
        NSDictionary *params = @{@"q" : searchBar.text};
        NSError *clientError;
        NSURLRequest *request = [[[Twitter sharedInstance] APIClient]
                                 URLRequestWithMethod:@"GET"
                                 URL:statusesShowEndpoint
                                 parameters:params
                                 error:&clientError];
        
        if (request) {
            [[[Twitter sharedInstance] APIClient]
             sendTwitterRequest:request
             completion:^(NSURLResponse *response, 
                          NSData *data,
                          NSError *connectionError) {
                 if (data) {
                     // handle the response data e.g.
                     NSError *jsonError;
                     NSArray *json = [NSJSONSerialization
                                           JSONObjectWithData:data
                                           options:kNilOptions
                                           error:&jsonError];
                     [self setSearchedUsers:json];
                 }
                 else {
                     NSLog(@"Error: %@", connectionError);
                 }
             }];
        }
        else {
            NSLog(@"Error: %@", clientError);
        }
    }
}

/******************* Helper Methods ****************************/

-(void) setSearchedUsers:(NSArray *)searchedUsers{
    [self.twitterUsers removeAllObjects];
    for(int i=0; i<[searchedUsers count]; i++) {
            SearchedUser *user = [[SearchedUser alloc] init];
        
            user.profile_image_url = [[searchedUsers objectAtIndex:i] valueForKey:@"profile_image_url"];
            user.profile_image_url = (NSMutableString *)[user.profile_image_url stringByReplacingOccurrencesOfString:@"_normal.png"
                                             withString:@"_bigger.png"];
        
            user.name = [[searchedUsers objectAtIndex:i] valueForKey:@"name"];
            user.screen_name = [[searchedUsers objectAtIndex:i] valueForKey:@"screen_name"];
            user.profileDescription = [[searchedUsers objectAtIndex:i] valueForKey:@"description"];
        
            [self.twitterUsers addObject:user];
    }
    [self.tableView reloadData];
}


//-(void) getReasonToMeet:(SearchedUser *)personToMeet{
//    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    IntroReason *Intro = [mainStoryBoard instantiateViewControllerWithIdentifier:@"IntroReason"];
//    [self.navigationController pushViewController:Intro animated:YES];
//}

@end
