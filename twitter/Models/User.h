//
//  User.h
//  twitter
//
//  Created by michaelvargas on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSURL *profilePicURL;
@property (strong, nonatomic) NSURL *bannerPicURL;
@property (strong, nonatomic) NSString *followers;
@property (strong, nonatomic) NSString *friends;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSString *numberOfTweets;




- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
