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
}

- (IBAction)didTapLike:(id)sender {
    // TODO: Update the local tweet model
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    // make sure that you display the numbers, going to have to go to where name handle and date are set in order to set those values (where you return cell;]
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
}
@end
