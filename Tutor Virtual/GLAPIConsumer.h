//
//  GLAPIConsumer.h
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLAPIConsumer : NSObject

+ (GLAPIConsumer *) sharedInstance;

- (BOOL) authenticateWithMatricula:(NSString *)matricula andPassword:(NSString *)password;

- (NSDictionary *) getAcademicLoad;

@end
