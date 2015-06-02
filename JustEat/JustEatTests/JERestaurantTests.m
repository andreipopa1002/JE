//
//  JERestaurantTests.m
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JERestaurant.h"
#import "JECuisine.h"

static NSString *const kTestFileName = @"sw4_api_call";

@interface JERestaurantTests : XCTestCase

@property (strong, nonatomic) NSArray *restaurants;

@end

@implementation JERestaurantTests

- (void)setUp {
    [super setUp];
    NSArray *jsonContent = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[JERestaurantTests class]] pathForResource:kTestFileName ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
    self.restaurants = [JERestaurant listOfRestaurantsFromArray:jsonContent];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRestaurantsValidity {
    XCTAssert(self.restaurants.count >0, @"Pass");
}

- (void)testRestaurantsAccuracy {
    XCTAssert(self.restaurants.count == 244 , @"Pass");
}

- (void)testRestaurantConsistency {
    for (id restaurant in self.restaurants) {
        XCTAssert([restaurant isKindOfClass:[JERestaurant class]]);
    }
}

- (void)testCuisinesString {
    JERestaurant *restaurant = self.restaurants.firstObject;
    XCTAssert([restaurant.cuisinesString isEqualToString:@"Chicken - Pizza"], @"Pass");
}

- (void)testRatingString {
    JERestaurant *restaurant = self.restaurants.firstObject;
    XCTAssert([restaurant.ratingString isEqualToString:@"Rating: 4.81 (284)"],@"Pass");
}

@end
