//
//  JECuisineTests.m
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JECuisine.h"

static NSString *const kTestFileName = @"2_cuisines_api_call";

@interface JECuisineTests : XCTestCase

@property (strong, nonatomic) NSArray *cuisines;

@end

@implementation JECuisineTests

- (void)setUp {
    [super setUp];
     NSArray *jsonContent = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[JECuisineTests class]] pathForResource:kTestFileName ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
    self.cuisines = [JECuisine listOfCuisinesFromArray:jsonContent];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCuisinesValidity {
    XCTAssert(self.cuisines.count == 2, @"Pass");
}

- (void)testArrayElements {
    for (id cuisineObject in self.cuisines) {
        XCTAssert([cuisineObject isKindOfClass:[JECuisine class]], @"Pass");
    }
}
@end
