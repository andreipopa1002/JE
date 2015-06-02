//
//  JEApiClient.m
//  JustEat
//
//  Created by Andrei Popa on 26/04/2015.
//  Copyright (c) 2015 Andrei Popa. All rights reserved.
//

#import "JEApiClient.h"
#import "AFNetworkActivityIndicatorManager.h"

static NSString *const kAPIBaseURLString = @"http://api-interview.just-eat.com/";

typedef NS_ENUM(NSInteger, APIHTTPMethod) {
    APIHTTPMethodGet,
    APIHTTPMethodPost,
};

@implementation JEApiClient

+ (instancetype)sharedClient {
    static JEApiClient *_sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[JEApiClient alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
        [_sharedClient configureSerializer:_sharedClient.requestSerializer];
    });
    
    return _sharedClient;
}

- (void)configureSerializer:(AFHTTPRequestSerializer *)serializer {
    [serializer setValue:@"uk" forHTTPHeaderField:@"Accept-Tenant"];
    [serializer setValue:@"Basic VGVjaFRlc3RBUEk6dXNlcjI=" forHTTPHeaderField:@"Authorization"];
    [serializer setValue:@"en-GB" forHTTPHeaderField:@"Accept-Language"];
    [serializer setValue:@"api-interview.just-eat.com" forHTTPHeaderField:@"Host"];
}

# pragma mark - API methods
- (void)retrieveRestaurantsList:(void (^)(NSArray *restaurantsArray))callbackBlock forPostCode:(NSString *)postCode {
    [self getRequestWithPath:@"restaurants/" parameters:@{@"q" : postCode} callbackBlock:^(id responseObject) {
        if (responseObject) {
            if (callbackBlock) {
                callbackBlock(responseObject[@"Restaurants"]);
            }
        } else if (callbackBlock) {
            callbackBlock(nil);
        }
    }];
}

# pragma mark - Requests
- (void)getRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters callbackBlock:(void (^)(id responseObject))callbackBlock {
    [self requestWithPath:path method:APIHTTPMethodGet parameters:parameters callbackBlock:callbackBlock];
}

- (void)requestWithPath:(NSString *)path method:(APIHTTPMethod)method parameters:(NSDictionary *)parameters
          callbackBlock:(void (^)(id responseObject))callbackBlock {
    void (^successPath)(NSDictionary *) = ^(NSDictionary *responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (responseObject){
                callbackBlock(responseObject);
            } else {
                callbackBlock(nil);
            }
        });
    };
    
    void (^errorPath)(NSError *) = ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self handleError:error];
            callbackBlock(nil);
        });
    };
    
    if (method == APIHTTPMethodGet) {
        [self GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            successPath(responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            errorPath(error);
        }];
    }
}

# pragma mark - Error handling
- (void)handleError:(NSError *)error {
    NSString *errorString = [NSString stringWithFormat:@"%ld - %@",(long)error.code,error.domain];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                        message:errorString
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

@end
