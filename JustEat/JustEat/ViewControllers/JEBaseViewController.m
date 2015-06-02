//
//  JEBaseViewController.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEBaseViewController.h"

@interface JEBaseViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) UIView *overlayView;

@end

@implementation JEBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIView *)ovelayView {
    if (!_overlayView) {
        _overlayView = [[UIView alloc] init];
        _overlayView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5f];
        _overlayView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_overlayView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[overlay]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:@{@"overlay" : _overlayView}]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[overlay]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:@{@"overlay" : _overlayView}]];
        
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.spinner.translatesAutoresizingMaskIntoConstraints = NO;
        [_overlayView addSubview:self.spinner];
        [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:self.spinner attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_overlayView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [_overlayView addConstraint:[NSLayoutConstraint constraintWithItem:self.spinner attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_overlayView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        _overlayView.hidden = YES;
        _overlayView.alpha = 0;
    }
    return _overlayView;
}

- (void)showLoadingIndicator {
    self.ovelayView.hidden = NO;
    [self.view bringSubviewToFront:self.ovelayView];
    [UIView animateWithDuration:0.25f animations:^{
        self.ovelayView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [self.spinner startAnimating];
    }];
}

- (void)hideLoadingIndicator {
    [UIView animateWithDuration:0.25f animations:^{
        self.ovelayView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.spinner stopAnimating];
        self.ovelayView.hidden = YES;
    }];
}

@end
