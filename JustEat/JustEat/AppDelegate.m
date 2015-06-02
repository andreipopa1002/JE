//
//  AppDelegate.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "AppDelegate.h"
#import "JEFlowManager.h"

@interface AppDelegate ()

@property (strong, nonatomic) JEFlowManager *flowManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.flowManager = [JEFlowManager new];
    self.window.rootViewController = self.flowManager.rootViewController;
    return YES;
}

@end
