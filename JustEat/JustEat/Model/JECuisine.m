//
//  JECuisine.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JECuisine.h"

@implementation JECuisine

+ (NSArray *)listOfCuisinesFromArray:(NSArray *)cuisines {
    NSMutableArray *listOfCuisines = [NSMutableArray new];
    for (NSDictionary *dictionary in cuisines) {
        [listOfCuisines addObject:[[JECuisine alloc]initWithDictionary:dictionary]];
    }
    return [NSArray arrayWithArray:listOfCuisines];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _cuisineName = dictionary[@"Name"];
    }
    return self;
}

@end
