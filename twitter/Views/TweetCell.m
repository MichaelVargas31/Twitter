//
//  TweetCell.m
//  twitter
//
//  Created by michaelvargas on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    } else {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self.retweetButton setSelected:YES];
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
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.likeButton setSelected:YES];
    }
    
    // make sure that you display the numbers, going to have to go to where name handle and date are set in order to set those values (where you return cell;]
    // TODO: Update cell UI
    [self refreshData];
    // TODO: Send a POST request to the POST favorites/create endpoint
}


- (void)refreshData{
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    
//    UIImage *retweetedIcon = [UIImage imageNamed:@"retweet-icon-green"];
//    [self.retweetButton setImage:retweetedIcon forState:UIControlStateNormal];
//    UIImage *notRetweetedIcon = [UIImage imageNamed:@"retweet-icon"];
//    [self.retweetButton setImage:notRetweetedIcon forState:UIControlStateSelected];
//
//    UIImage *notLikedIcon = [UIImage imageNamed:@"favor-icon"];
//    [self.likeButton setImage:notLikedIcon forState:UIControlStateSelected];
//    UIImage *likedIcon = [UIImage imageNamed:@"favor-icon-red"];
//    [self.likeButton setImage:likedIcon forState:UIControlStateNormal];
    
    

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
    
    
//    cell.nameLabel.text = tweet.user.name;
//    cell.handleLabel.text = tweet.user.screenName;
//    cell.dateLabel.text = tweet.createdAtString;
//    cell.tweetTextLabel.text = tweet.text;
//
//    cell.likeCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
//    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    
}


@end
