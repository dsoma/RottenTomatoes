//
//  RTModel.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/17/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTModel.h"

static NSString* apiURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us";

@interface RTModel()

@property (strong, nonatomic) NSArray* movieList;

@end

@implementation RTModel

-(void) loadMovieList
{
    NSURL* nsApiURL = [[NSURL alloc] initWithString:apiURL];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:nsApiURL];
    NSOperationQueue* opQueue = [NSOperationQueue mainQueue];
    
    [NSURLConnection sendAsynchronousRequest:request queue:opQueue
        completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError) {
        
        NSDictionary* object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movieList = object[@"movies"];
        
        NSLog(@"Movies: %@", self.movieList);
            
        // TODO: Add callback
    }];
}

-(int)getMovieCount
{
    if (self.movieList != nil) {
        return self.movieList.count;
    }
    
    return 0;
}

@end
