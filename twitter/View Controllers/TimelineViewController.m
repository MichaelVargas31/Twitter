//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "User.h"
#import "TweetCell.h"
#import "ComposeViewController.h"

// Step 3: viewController has a tableView as a subView
// Step 8: tableView asks dataSource for #OfRows and cellForRowAt
@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate>


@property (strong, nonatomic) NSArray *tweetArray;
@property (strong, nonatomic) UIRefreshControl *refreshControl;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self getTimeline];

    // for refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getTimeline) forControlEvents:UIControlEventValueChanged];
    // [self.timelineTableView addSubview:self.refreshControl];
    [self.timelineTableView insertSubview:self.refreshControl atIndex:0];
    
    // for Table View
    self.timelineTableView.dataSource = self;
    self.timelineTableView.delegate = self;
    

}


- (void) getTimeline{
    // Get timeline
    // Step 5: APIManager calls the completion handler
    // completion block: first part (tweets) is just something you give to the function, the function will do something with it if its successful
    // the error will execute if the function is unsuccessful
    // We use this completion manager as a deferred execution, if we didn't include this, our app would stop functioning completely until the network request came back
    // This way, we can continue setting up other things while this request is finishing up
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *tweet in tweets) {
                //                NSLog(@"%@", dictionary[@"text"]);
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
            // self.tweetArray = [Tweet tweetsWithArray:dictionary];
            // Step 6: viewController stores the data
            self.tweetArray = tweets;
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
        // Step 7: Releoad the tableView
        [self.timelineTableView reloadData];
        [self.refreshControl endRefreshing];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// Step 9: does something, returns the information
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    //     NSDictionary *movie = self.filteredMovies[indexPath.row];
    Tweet *tweet = self.tweetArray[indexPath.row];
    NSLog(@"---------------");
    NSLog(@"---------------");
    NSLog(@"---------------");
    NSLog(@"%@", tweet);
    cell.tweet = tweet;
    cell.nameLabel.text = tweet.user.name;
    cell.handleLabel.text = tweet.user.screenName;
    cell.dateLabel.text = tweet.createdAtString;
    cell.tweetTextLabel.text = tweet.text;
    
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    
    // Step 10: cellForRows returns the instance of custom cell
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetArray.count;
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     // set the TimelineViewController as the delegate of the ComposeViewController
     UINavigationController *navigationController = [segue destinationViewController];
     ComposeViewController *composeController = (ComposeViewController *)navigationController.topViewController;
     composeController.delegate = self;

 }
 


- (void)didTweet:(nonnull Tweet *)tweet {
    // add the new tweet to the tweets array
    // NSArray *newArray = [self.tweetArray arrayByAddingObject:tweet];
    NSArray *newArray = [[[[[self.tweetArray reverseObjectEnumerator] allObjects] arrayByAddingObject:tweet] reverseObjectEnumerator] allObjects];
    self.tweetArray = newArray;
    
    [self.timelineTableView reloadData];
}

@end
