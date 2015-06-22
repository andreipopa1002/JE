//
//  JERestaurantsDataSourceDelegate.m
//  JustEat
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantsDataSourceDelegate.h"
#import "JERestaurantTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

NSString *const kRestaurantCellIdentifier = @"restaurant";

@interface JERestaurantsDataSourceDelegate()

@property (weak, nonatomic, readwrite) JERestaurantsDataSource *dataSurce;

@end

@implementation JERestaurantsDataSourceDelegate

#pragma mark - External Methods
- (instancetype)initWithDataSource:(JERestaurantsDataSource *)dataSource {
    self = [super init];
    if (self) {
        _dataSurce = dataSource;
    }
    return self;
}

#pragma  mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSurce.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JERestaurantTableViewCell *cell = (JERestaurantTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kRestaurantCellIdentifier forIndexPath:indexPath];
    [self setupCell:cell forRestaurant:self.dataSurce.restaurants[indexPath.row]];
    return cell;
}

#pragma mark - Internal Methods
- (void)setupCell:(JERestaurantTableViewCell *)cell forRestaurant:(JERestaurant *)restaurant {
    cell.nameLabel.text = restaurant.name;
    [cell.logoImage setImageWithURL:[NSURL URLWithString:restaurant.logoURL] placeholderImage:[UIImage new]];
    cell.cuisinesLabel.text = [restaurant cuisinesString];
    cell.ratingLabel.text = [restaurant ratingString];
    [cell isOpenNow:restaurant.isOpenNow];
}





@end
