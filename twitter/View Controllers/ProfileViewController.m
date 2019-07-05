//
//  ProfileViewController.m
//  twitter
//
//  Created by michaelvargas on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.screenNameLabel.text = [NSString stringWithFormat:@"%@", self.user.screenName];
//    self.user.screenName;
    self.followersCountLabel.text = [NSString stringWithFormat:@"%@", self.user.followers];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%@", self.user.friends];
    self.bioLabel.text = self.user.bio;
    
    [self.profilePicImageView setImageWithURL:self.user.profilePicURL];
    if (self.user.bannerPicURL != nil) {
        [self.bannerImageView setImageWithURL:self.user.bannerPicURL];
    }
//    [cell.profilePicImageView setImageWithURL:cell.tweet.user.profilePicURL];

}

- (IBAction)closeProfileButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
