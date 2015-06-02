//
//  JERestaurantsListViewController.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEBaseViewController.h"

@class JERestaurant;
@class JERestaurantsListViewController;

@protocol JERestaurantsListViewControllerDelegate <NSObject>

- (void)userDidSelectRestaurant:(JERestaurant *)restaurant;

@end

@interface JERestaurantsListViewController : JEBaseViewController

@property (weak, nonatomic) id<JERestaurantsListViewControllerDelegate> delegate;

/**
 *  Custom initializer for a view controller that loads and displays a list of restaurants from the API
 *
 *  @param postCode to be sent to the API for filtering the restaurants
 *
 *  @return an instance of the JEBaseViewController
 */
- (instancetype)initWithPostCode:(NSString *)postCode;

@end