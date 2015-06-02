//
//  RestaurantDetailsViewController.h
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEBaseViewController.h"

@class JERestaurant;

/**
 *  This view controller is responsible for presenting to the user the details for a particular JERestaurant object
 */
@interface JERestaurantDetailsViewController : JEBaseViewController


- (instancetype)initWithRestaurant:(JERestaurant *)restaurant;
@end
