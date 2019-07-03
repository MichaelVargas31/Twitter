//
//  ComposeViewController.m
//  twitter
//
//  Created by michaelvargas on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composeTextView;
@property (strong, nonatomic) NSString *textViewText;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeComposeButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)sendTweetButtonClicked:(id)sender {
    // how do I know ot use [APIManager shared]?
    NSLog(@"%@", self.composeTextView.text);
    [[APIManager shared] postStatusWithText:self.composeTextView.text completion:^(Tweet *composedTweet, NSError *error) {
        if (composedTweet) {
            NSLog(@"posted tweet? possibly...");
            [self.delegate didTweet:composedTweet];
            [self dismissViewControllerAnimated:true completion:nil];
            
        } else {
            NSLog(@"😫 Your error coming from composeViewController: %@", error.localizedDescription);

        }
    }];
    
    
}

@end
