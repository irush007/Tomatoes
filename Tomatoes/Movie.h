//
//  Movie.h
//  Tomatoes
//
//  Created by Hua Wu on 1/20/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *poster;
@property (nonatomic, strong) NSString *pic;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
