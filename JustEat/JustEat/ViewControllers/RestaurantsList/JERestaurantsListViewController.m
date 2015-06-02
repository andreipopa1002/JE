//
//  JERestaurantsListViewController.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantsListViewController.h"
#import "JEApiClient.h"
#import "JERestaurant.h"
#import "JERestaurantTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

static NSString *const kRestaurantCellIdentifier = @"restaurant";

@interface JERestaurantsListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic, readonly) NSString *postCode;
@property (strong, nonatomic) NSArray *restaurants;
@end

@implementation JERestaurantsListViewController

- (instancetype)initWithPostCode:(NSString *)postCode {
    self = [super init];
    if (self) {
        _postCode = postCode;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Restaurants", nil);
    [self showLoadingIndicator];
    [self setupTableView];
    JERestaurantsListViewController *__weak weakSelf = self;
    [[JEApiClient sharedClient] retrieveRestaurantsList:^(NSArray *restaurantsArray) {
        [weakSelf hideLoadingIndicator];
        if (restaurantsArray.count > 0) {
            weakSelf.restaurants = [JERestaurant listOfRestaurantsFromArray:restaurantsArray];
            [weakSelf.tableView reloadData];
        } else if (restaurantsArray) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No restaurants for this post code!", nil)
                                                            message:NSLocalizedString(@"Please make sure you provided the corect post code", nil)
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                  otherButtonTitles:nil];
            [alert show];
        }
    } forPostCode:self.postCode];
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kJERestaurantTableViewCellNibName bundle:nil] forCellReuseIdentifier:kRestaurantCellIdentifier];
}

#pragma  mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JERestaurantTableViewCell *cell = (JERestaurantTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kRestaurantCellIdentifier forIndexPath:indexPath];
    JERestaurant *restaurant = self.restaurants[indexPath.row];
    cell.nameLabel.text = restaurant.name;
    [cell.logoImage setImageWithURL:[NSURL URLWithString:restaurant.logoURL] placeholderImage:[UIImage new]];
    cell.cuisinesLabel.text = [restaurant cuisinesString];
    cell.ratingLabel.text = [restaurant ratingString];
    [cell isOpenNow:restaurant.isOpenNow];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kJERestaurantTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(userDidSelectRestaurant:)]) {
        [self.delegate userDidSelectRestaurant:self.restaurants[indexPath.row]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
