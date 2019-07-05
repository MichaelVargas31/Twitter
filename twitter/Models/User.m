//
//  User.m
//  twitter
//
//  Created by michaelvargas on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicURL = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
//        self.bannerPicURL = [NSURL URLWithString:dictionary[@"profile_background_image_url"]];
        self.bannerPicURL = [NSURL URLWithString:dictionary[@"profile_banner_url"]];
        self.bio = dictionary[@"description"];

        self.followers = dictionary[@"followers_count"];
        self.friends = dictionary[@"friends_count"];
        
    }
    return self;
}

@end
