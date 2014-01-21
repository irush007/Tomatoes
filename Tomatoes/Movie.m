//
//  Movie.m
//  Tomatoes
//
//  Created by Hua Wu on 1/20/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import "Movie.h"

@implementation Movie


- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        NSArray *ab_casts = dictionary[@"abridged_cast"];
        NSMutableString *members = [[NSMutableString alloc] init];
        for (NSDictionary *object in ab_casts) {
            //members = [members stringByAppendingString:object[@"name"]];
            //members = [members stringByAppendingString:@","];
            [members appendString:object[@"name"]];
            //NSLog(@"name is: %@", object[@"name"]);
        }
        
        self.cast = members;
        self.poster = dictionary[@"posters"][@"thumbnail"];
        self.pic = dictionary[@"posters"][@"original"];
        //UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        //[self.poster setImage:image];
    }
    return self;
}

@end
