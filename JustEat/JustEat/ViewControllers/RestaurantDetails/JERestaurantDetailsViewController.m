//
//  RestaurantDetailsViewController.m
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantDetailsViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "JERestaurant.h"

@interface JERestaurantDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *closedLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingsLabel;

@property (strong, nonatomic, readonly) JERestaurant *restaurant;

@end

@implementation JERestaurantDetailsViewController

- (instancetype)initWithRestaurant:(JERestaurant *)restaurant {
    self = [super init];
    if (self) {
        _restaurant = restaurant;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Restaurant Details", nil);
    [self.logoImageView setImageWithURL:[NSURL URLWithString:self.restaurant.logoURL] placeholderImage:[UIImage new]];
    self.nameLabel.text = self.restaurant.name;
    self.cuisineLabel.text = self.restaurant.cuisinesString;
    self.ratingsLabel.text = self.restaurant.ratingString;
    self.closedLabel.textColor = self.restaurant.isOpenNow ? [UIColor greenColor] : [UIColor redColor];
    self.closedLabel.text = self.restaurant.isOpenNow ? NSLocalizedString(@"OPEN", nil) : NSLocalizedString(@"CLOSED", nil);
}

@end
