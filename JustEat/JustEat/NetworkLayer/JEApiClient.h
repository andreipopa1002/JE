//
//  JEApiClient.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "AFNetworking.h"

/**
 * This class is intended to encapsulate all the network comunicatinon
 */
@interface JEApiClient : AFHTTPSessionManager

/**
 *  SharedClient
 *
 *  @return Shared instance for the JEApiClient class
 */
+ (instancetype)sharedClient;

/**
 *  This method will retrieve a restaurants list for a specific post code. Post code should not be nil
 */
- (void)retrieveRestaurantsList:(void (^)(NSArray *restaurantsArray))callbackBlock forPostCode:(NSString *)postCode;

@end
