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
@property (weak, nonatomic) NSDictionary* currentMovieItem;

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
        
        if (self.observer != nil) {
            [self.observer movieListLoaded];
        }
    }];
}

-(int)getMovieCount
{
    if (self.movieList != nil) {
        return self.movieList.count;
    }
    
    return 0;
}

-(NSDictionary*) getMovie:(int)movieIndexInList
{
    if (self.movieList != nil && movieIndexInList >= 0 && movieIndexInList < self.movieList.count) {
        return self.movieList[movieIndexInList];
    }
    
    return nil;
}

-(NSDictionary*) getMoviePoster:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        return [movie valueForKey:@"posters"];
    }
    
    return nil;
}

-(NSString*) getMovieThumbnailUrl:(int)movieIndexInList
{
    NSDictionary* poster = [self getMoviePoster:movieIndexInList];
    if (poster != nil)
    {
        return [poster valueForKey:@"thumbnail"];
    }
    
    return nil;
}

-(NSString*) getTitle:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        return [movie valueForKey:@"title"];
    }
    
    return nil;
}

-(NSString*) getReleaseYear:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        return [movie valueForKey:@"year"];
    }
    
    return nil;
}

-(NSString*) getCriticsScore:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        NSDictionary* ratings = [movie valueForKey:@"ratings"];
        return [ratings valueForKey:@"critics_score"];
    }
    
    return nil;
}

-(NSString*) getAudienceScore:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        NSDictionary* ratings = [movie valueForKey:@"ratings"];
        return [ratings valueForKey:@"audience_score"];
    }
    
    return nil;
}


-(NSString*) getDesc:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        return [movie valueForKey:@"synopsis"];
    }
    
    return nil;
}

-(NSString*) getMoviePosterUrl:(int)movieIndexInList
{
    NSString* immutableThumbnailUrl = [self getMovieThumbnailUrl:movieIndexInList];
    NSMutableString* thumbnailUrl = [immutableThumbnailUrl mutableCopy];
    [thumbnailUrl replaceOccurrencesOfString:@"_tmb"
                                  withString:@"_ori"
                                  options:NSBackwardsSearch
                                       range:NSMakeRange(0, [immutableThumbnailUrl length])];
    
    return thumbnailUrl;
}

-(NSString*) getMpaaRating:(int)movieIndexInList
{
    NSDictionary* movie = [self getMovie:movieIndexInList];
    if (movie != nil)
    {
        return [movie valueForKey:@"mpaa_rating"];
    }
    
    return nil;
}

@end
