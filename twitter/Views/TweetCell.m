//
//  TweetCell.m
//  twitter
//
//  Created by michaelvargas on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // initializing gesture recognizer programatically
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.profilePicImageView addGestureRecognizer:profileTapGestureRecognizer];
    [self.profilePicImageView setUserInteractionEnabled:YES];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapRetweet:(id)sender {
    // TODO: Update the local tweet model
    if (self.tweet.retweeted == YES) {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self.retweetButton setSelected:NO];
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *newTweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully UNRETWEETED the following Tweet: %@", newTweet.text);
            }
        }];
    } else {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self.retweetButton setSelected:YES];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *newTweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully RETWEETED the following Tweet: %@", newTweet.text);
            }
        }];
    }
    // make sure that you display the numbers, going to have to go to where name handle and date are set in order to set those values (where you return cell;]
    // TODO: Update cell UI
    [self refreshData];
    // TODO: Send a POST request to the POST favorites/create endpoint
}

- (IBAction)didTapLike:(id)sender {
    // TODO: Update the local tweet model
    if (self.tweet.favorited == YES) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.likeButton setSelected:NO];
        
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *newTweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully UNFAVORITED the following Tweet: %@", newTweet.text);
            }
        }];
        
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.likeButton setSelected:YES];
        // not actually send the favorite POST request
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *newTweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", newTweet.text);
            }
        }];

    }
    
    
    
    // make sure that you display the numbers, going to have to go to where name handle and date are set in order to set those values (where you return cell;]
    // TODO: Update cell UI
    [self refreshData];
    // TODO: Send a POST request to the POST favorites/create endpoint
}


- (void)refreshData{
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];

    if (self.tweet.favorited == YES) {
        // change button color
//        NSLog(@"%lu", self.likeButton.state);
        UIImage *likedIcon = [UIImage imageNamed:@"favor-icon-red"];
        [self.likeButton setImage:likedIcon forState:UIControlStateSelected];
    } else {
        // change the button back
        UIImage *notLikedIcon = [UIImage imageNamed:@"favor-icon"];
        [self.likeButton setImage:notLikedIcon forState:UIControlStateNormal];
    }

    if (self.tweet.retweeted == YES) {
        UIImage *retweetedIcon = [UIImage imageNamed:@"retweet-icon-green"];
        [self.retweetButton setImage:retweetedIcon forState:UIControlStateSelected];
    } else {
        UIImage *notRetweetedIcon = [UIImage imageNamed:@"retweet-icon"];
        [self.retweetButton setImage:notRetweetedIcon forState:UIControlStateNormal];
    }
}

- (void) didTapUserProfile:(UITapGestureRecognizer *)sender{
    // TODO: Call method on delegate
    [self.delegate tweetCell:self didTap:self.tweet.user];
}


@end
