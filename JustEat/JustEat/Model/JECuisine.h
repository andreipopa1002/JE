//
//  JECuisine.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JECuisine : NSObject

@property (strong, nonatomic, readonly) NSString *cuisineName;

/**
 *  will return an array of JECuisine object populated with the information from the cuisines dictionaries
 *
 *  @param cuisines Array of cuisines dictionaries received from the API
 *
 *  @return NSArray with JECuisines objects
 */
+ (NSArray *)listOfCuisinesFromArray:(NSArray *)cuisines;

@end