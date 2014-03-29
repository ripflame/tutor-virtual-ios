//
//  GLAPIConsumer.m
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import "GLAPIConsumer.h"
#import "AFHTTPRequestOperationManager.h"

@implementation GLAPIConsumer

- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

+ (GLAPIConsumer *)sharedInstance {
    static dispatch_once_t pred;
    static GLAPIConsumer *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[GLAPIConsumer alloc] init];
    });
    return shared;
}

- (BOOL)authenticateWithMatricula:(NSString *)matricula andPassword:(NSString *)password {
    __block BOOL didFinish = YES;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"matricula": matricula, @"pwd": password};
    
    [manager POST:@"http://107.170.211.108/tutorvirtual/v1/api.php?rquest=login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = responseObject;
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:response[@"hash"] forKey:@"hash"];
        [prefs synchronize];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginSuccess" object:response];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
        didFinish = NO;
    }];
    
    return didFinish;
}

- (NSDictionary *)getAcademicLoad {
    __block NSDictionary *response = nil;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"token": [prefs objectForKey:@"hash"]? [prefs objectForKey:@"hash"] : @"meh"};
    
    [manager POST:@"http://107.170.211.108/tutorvirtual/v1/api.php?rquest=getCarga" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        response = responseObject;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AcademicLoadSuccess" object:response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    return response;
}

@end
