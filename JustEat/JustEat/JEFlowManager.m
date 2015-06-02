//
//  JEFlowManager.m
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEFlowManager.h"

#import "JELocationViewController.h"
#import "JERestaurantsListViewController.h"
#import "JERestaurantDetailsViewController.h"

@interface JEFlowManager() <JELocationViewControllerDelegate, JERestaurantsListViewControllerDelegate>

@end

@implementation JEFlowManager

- (UIViewController *)rootViewController {
    if (!_rootViewController) {
        JELocationViewController *locationController = [JELocationViewController new];
        locationController.delegate = self;
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:locationController];
    }
    return _rootViewController;
}

# pragma mark - Delegate Methods
- (void)userDidEnteredPostCode:(NSString *)postCodeString {
    JERestaurantsListViewController *restaurantController = [[JERestaurantsListViewController alloc] initWithPostCode:postCodeString];
    restaurantController.delegate = self;
    [self.rootViewController pushViewController:restaurantController animated:YES];
}

- (void)userDidSelectRestaurant:(JERestaurant *)restaurant {
    JERestaurantDetailsViewController *restaurantDetails = [[JERestaurantDetailsViewController alloc] initWithRestaurant:restaurant];
    [self.rootViewController pushViewController:restaurantDetails animated:YES];
}

@end
