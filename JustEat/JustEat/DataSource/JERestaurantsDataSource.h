//
//  JERestaurantsDataSource.h
//  JustEat
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JERestaurant.h"

@interface JERestaurantsDataSource : NSObject

@property (strong, nonatomic, readonly) NSArray *restaurants;

- (void)loadRestaurantsListForPostCode:(NSString *)postCode withCompletion:(void(^)(NSError *error))completion;

@end
