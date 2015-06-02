//
//  JERestaurantTableViewCell.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantTableViewCell.h"

NSString *const kJERestaurantTableViewCellNibName = @"JERestaurantTableViewCell";
CGFloat const kJERestaurantTableViewCellHeight = 80.f;

@interface JERestaurantTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *isOpenNowView;

@end

@implementation JERestaurantTableViewCell

- (void)awakeFromNib {
    self.isOpenNowView.layer.cornerRadius = roundf(CGRectGetHeight(self.isOpenNowView.frame)/2);
}

- (void)isOpenNow:(BOOL)open {
    self.isOpenNowView.backgroundColor = open ? [UIColor greenColor] : [UIColor redColor];
}

@end