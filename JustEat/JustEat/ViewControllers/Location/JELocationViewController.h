//
//  JELocationViewController.h
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEBaseViewController.h"

@class JELocationViewController;

@protocol JELocationViewControllerDelegate <NSObject>
/**
 * Delegate method to be called when the controller's job is finnished
 */
- (void)userDidEnteredPostCode:(NSString *)postCodeString;
@end

@interface JELocationViewController : JEBaseViewController

@property (weak, nonatomic) id<JELocationViewControllerDelegate> delegate;

@end
