//
//  JERestaurantsDataSource.h
//  JustEat
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JERestaurant.h"
/**
 *  This class will represent the restaurants list
 *  All the operations on this list should be made by this class
 */
@interface JERestaurantsDataSource : NSObject

@property (strong, nonatomic, readonly) NSArray *restaurants;
/**
 *  Method that will trigger the fetch of restaurants from the API
 *
 *  @param postCode   post code to be used in the fetch
 *  @param completion block to be executed when the fetch is done
 */
- (void)loadRestaurantsListForPostCode:(NSString *)postCode withCompletion:(void(^)(NSError *error))completion;

@end
