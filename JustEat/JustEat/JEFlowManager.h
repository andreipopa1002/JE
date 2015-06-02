//
//  JEFlowManager.h
//  JustEat
//
//  Created by Andrei Popa on 27/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

/**
 *  This class will be responsible for controlling the flow of the app, it will be responsible for presenting ViewControllers on screen
 */
@interface JEFlowManager : NSObject

@property (strong, nonatomic) UINavigationController *rootViewController;

@end
