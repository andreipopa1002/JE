//
//  JERestaurant.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * This object will encapsulate all the data that can reference a restaurant
 */
@interface JERestaurant : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *logoURL;
@property (assign, nonatomic, readonly) float ratingStars;
@property (assign, nonatomic, readonly) float numberOfRatings;
@property (assign, nonatomic, readonly) BOOL isOpenNow;
@property (strong, nonatomic, readonly) NSArray *cuisines;

/**
 *  parse the dictionary and will return an Array with JERestaurant objects
 *
 *  @param restaurants Array of dictionaries received from the API
 *
 *  @return Array of JERestaurant objects
 */
+ (NSArray *)listOfRestaurantsFromArray:(NSArray *)restaurants;

/**
 * concatenates the cuisines in one string
 *
 *  @return NSString containing all the cuisines in the format "cuisine1 - cuisine2 - cuisine3"
 */
- (NSString *)cuisinesString;

/**
 *  formats the ratings string in user friendly format
 *
 *  @return NSString containing the rating information in the format 5.2 (121)
 */
- (NSString *)ratingString;

@end


