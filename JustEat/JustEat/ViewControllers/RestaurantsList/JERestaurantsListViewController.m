//
//  JERestaurantsListViewController.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JERestaurantsListViewController.h"
#import "JERestaurantsDataSource.h"
#import "JERestaurantsDataSourceDelegate.h"
#import "JERestaurantTableViewCell.h"

@interface JERestaurantsListViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic, readonly) NSString *postCode;
@property (strong, nonatomic, readwrite) JERestaurantsDataSource *dataSource;
@property (strong, nonatomic, readwrite) JERestaurantsDataSourceDelegate *dataSourceDelegate;
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
    [self.dataSource loadRestaurantsListForPostCode:self.postCode
                                     withCompletion:^(NSError *error) {
                                         [weakSelf hideLoadingIndicator];
                                         if (error) {
                                             [[[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:error.domain
                                                                       delegate:nil
                                                              cancelButtonTitle:@"ok"
                                                               otherButtonTitles:nil] show];
                                         }
                                         [weakSelf.tableView reloadData];
                                     }];
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:kJERestaurantTableViewCellNibName bundle:nil] forCellReuseIdentifier:kRestaurantCellIdentifier];
    self.dataSource = [JERestaurantsDataSource new];
    self.dataSourceDelegate = [[JERestaurantsDataSourceDelegate alloc] initWithDataSource:self.dataSource];
    self.tableView.dataSource = self.dataSourceDelegate;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kJERestaurantTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(userDidSelectRestaurant:)]) {
        [self.delegate userDidSelectRestaurant:self.dataSource.restaurants[indexPath.row]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
