//
//  JERestaurantsDataSource.m
//  JustEat
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantsDataSource.h"
#import "JEApiClient.h"

@interface JERestaurantsDataSource()

@property (strong, nonatomic, readwrite) NSArray *restaurants;

@end

@implementation JERestaurantsDataSource

- (void)loadRestaurantsListForPostCode:(NSString *)postCode withCompletion:(void(^)(NSError *error))completion {
    typeof(self) __weak weakSelf = self;
    [[JEApiClient sharedClient] retrieveRestaurantsList:^(NSArray *restaurantsArray) {
        if (restaurantsArray.count > 0) {
            weakSelf.restaurants = [JERestaurant listOfRestaurantsFromArray:restaurantsArray];
            if (completion) {
                completion(nil);
            }
        } else if (restaurantsArray) {
            if (completion) {
                completion([NSError errorWithDomain:NSLocalizedString(@"No restaurants for this post code", nil) code:100 userInfo:nil]);
            }
        }
    } forPostCode:postCode];
}

@end
