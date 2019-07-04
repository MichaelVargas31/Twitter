//
//  TweetCell.h
//  twitter
//
//  Created by michaelvargas on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TweetCell.h"
#import "APIManager.h"


NS_ASSUME_NONNULL_BEGIN


@protocol TweetCellDelegate;

@interface TweetCell : UITableViewCell

@property (nonatomic, weak) id<TweetCellDelegate> delegate;

@property Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

- (void) didTapUserProfile:(UITapGestureRecognizer *)sender;
- (IBAction)didTapRetweet:(id)sender;
- (IBAction)didTapLike:(id)sender;
- (void)refreshData;

@end

@protocol TweetCellDelegate
// TODO: Add required methods the delegate needs to implement
// Tweet MAY BE AN ISSUE LATER, WE SHALL SEE
- (void)tweetCell:(TweetCell *) tweetCell didTap: (User *)user;

@end


NS_ASSUME_NONNULL_END
