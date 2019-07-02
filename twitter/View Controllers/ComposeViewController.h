//
//  ComposeViewController.h
//  twitter
//
//  Created by michaelvargas on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeComposeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendTweetButton;

- (IBAction)closeComposeButtonClicked:(id)sender;
- (IBAction)sendTweetButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
