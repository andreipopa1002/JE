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

extern NSString *const kRestaurantCellIdentifier;

@interface JERestaurantsDataSourceDelegate : NSObject <UITableViewDataSource>

- (instancetype)initWithDataSource:(JERestaurantsDataSource *)dataSource;

@end
