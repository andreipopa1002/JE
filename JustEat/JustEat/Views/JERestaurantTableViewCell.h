//
//  JERestaurantTableViewCell.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kJERestaurantTableViewCellNibName;
extern CGFloat const kJERestaurantTableViewCellHeight;

@interface JERestaurantTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisinesLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

- (void)isOpenNow:(BOOL)open;

@end
