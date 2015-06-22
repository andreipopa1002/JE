//
//  JERestaurantsDataSourceDelegate.h
//  JustEat
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JERestaurantsDataSource.h"
@import UIKit;
/**
 *  This class will act as the data source delegate for a tableView that will display the restaurants
 */
extern NSString *const kRestaurantCellIdentifier;

@interface JERestaurantsDataSourceDelegate : NSObject <UITableViewDataSource>
/**
 *  Initializes the delegate with a specific dataSource class
 *
 *  @param dataSource JERestaurantsDataSource object that does the fetch
 *
 *  @return fresh new initialized JERestaurantsDataSource object
 */
- (instancetype)initWithDataSource:(JERestaurantsDataSource *)dataSource;

@end
