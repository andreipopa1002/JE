//
//  JELocationViewController.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "JELocationViewController.h"

@interface JELocationViewController () <UITextFieldDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *postCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *currentLocationButtton;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation JELocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Location", nil);
    [self setupTextField];
    [self setupCurrentLocationButton];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

# pragma mark - CLLocationDelegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self.locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    JELocationViewController *__weak weakSelf = self;
    [geocoder reverseGeocodeLocation:locations.firstObject completionHandler:^(NSArray *placemarks, NSError *error) {
        if (!error){
            CLPlacemark *currentPlacemark = placemarks.firstObject;
            weakSelf.postCodeTextField.text = [[currentPlacemark.postalCode componentsSeparatedByString:@" "] firstObject];
            [weakSelf validateOKButton];
            [weakSelf hideLoadingIndicator];
        } else {
            [weakSelf handleLocationFailure];
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self hideLoadingIndicator];
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self handleLocationFailure];
    }
    [manager stopUpdatingLocation];
    [self.postCodeTextField becomeFirstResponder];
}

# pragma mark - UITextField delegate related methods
- (void)textFieldTextDidChange:(NSNotification *)notification {
    [self validateOKButton];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.okButton.enabled) {
        [self okButtonTapped:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                   message:NSLocalizedString(@"Please enter a post code value", nil)
                                  delegate:nil
                         cancelButtonTitle:NSLocalizedString(@"OK", nil)
                         otherButtonTitles:nil] show];
    }
    return self.okButton.enabled;
}

# pragma mark - UIButton Action
- (IBAction)okButtonTapped:(id)sender {
    if (self.delegate &&  [self.delegate respondsToSelector:@selector(userDidEnteredPostCode:)]) {
        [self.delegate userDidEnteredPostCode:self.postCodeTextField.text];
    }
}

- (IBAction)currentLocationButttonTapped:(id)sender {
    NSString *errorMessage = nil;
    if (!self.locationManager) {
        [self setupLocationManager];
    }
    
    if (![CLLocationManager locationServicesEnabled]) {
        errorMessage = NSLocalizedString(@"Please enable the location services in order to use the current location", nil);
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        errorMessage = NSLocalizedString(@"Please allow the app the use the location services in order to use the current location", nil);
    } else {
        [self showLoadingIndicator];
        [self.locationManager startUpdatingLocation];
    }
    
    if (errorMessage.length > 0) {
        [[[UIAlertView alloc] initWithTitle:@""
                                    message:errorMessage
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil] show];
    }
    
}

# pragma mark - Internal Methods
- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)setupCurrentLocationButton {
    UIImage *locationButtonImage = [[UIImage imageNamed:@"location_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.currentLocationButtton setImage:locationButtonImage forState:UIControlStateNormal];
}

- (void)setupTextField {
    self.postCodeTextField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.postCodeTextField];
}

- (void)validateOKButton {
    self.okButton.enabled = [self.postCodeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0 ? YES :NO;
}

- (void)handleLocationFailure {
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                message:NSLocalizedString(@"Location services unavailable", nil)
                               delegate:nil
                      cancelButtonTitle:NSLocalizedString(@"OK", nil)
                      otherButtonTitles:nil] show];
}

@end
