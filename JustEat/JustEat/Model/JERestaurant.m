//
//  JERestaurant.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurant.h"
#import "JECuisine.h"

@interface JERestaurant()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *logoURL;
@property (assign, nonatomic, readwrite) float ratingStars;
@property (assign, nonatomic, readwrite) float numberOfRatings;
@property (assign, nonatomic, readwrite) BOOL isOpenNow;
@property (strong, nonatomic, readwrite) NSArray *cuisines;

@end

@implementation JERestaurant

+ (NSArray *)listOfRestaurantsFromArray:(NSArray *)restaurants {
    NSMutableArray *restaurantList = [NSMutableArray new];
    for (NSDictionary *restaurantDictionary in restaurants) {
        [restaurantList addObject:[[JERestaurant alloc] initWithDictionary:restaurantDictionary]];
    }
    return [NSArray arrayWithArray:restaurantList];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"Name"];
        _logoURL = [dictionary[@"Logo"] firstObject][@"StandardResolutionURL"];
        _ratingStars = [dictionary[@"RatingStars"] floatValue];
        _numberOfRatings = [dictionary[@"NumberOfRatings"] floatValue];
        _isOpenNow = [dictionary[@"IsOpenNow"] boolValue];
        _cuisines = [JECuisine listOfCuisinesFromArray:dictionary[@"CuisineTypes"]];
    }
    return self;
}

- (NSString *)cuisinesString {
    NSMutableString *cuisinesString = [NSMutableString new];
    for (JECuisine *cuisine in self.cuisines) {
        [cuisinesString appendString:cuisine.cuisineName];
        [cuisinesString appendString:@" - "];
    }
    [cuisinesString deleteCharactersInRange:NSMakeRange(cuisinesString.length - 3, 3)];
    return [NSString stringWithString:cuisinesString];
}

- (NSString *)ratingString {
    return [NSString stringWithFormat:@"%@: %0.2f (%.f)",NSLocalizedString(@"Rating", nil),self.ratingStars,self.numberOfRatings];
}

@end
