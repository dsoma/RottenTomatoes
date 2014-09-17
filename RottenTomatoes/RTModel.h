//
//  RTModel.h
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/17/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MovieDataObserver

-(void)movieListLoaded;
-(void)movieListLoadFailed:(NSError*)error;

@end

@interface RTModel : NSObject

@property (weak, nonatomic) id <MovieDataObserver> observer;

-(void) loadMovieList;
-(int)  getMovieCount;

-(NSDictionary*) getMovie:(int)movieIndexInList;
-(NSDictionary*) getMoviePoster:(int)movieIndexInList;
-(NSString*) getMovieThumbnailUrl:(int)movieIndexInList;
-(NSString*) getTitle:(int)movieIndexInList;
-(NSString*) getDesc:(int)movieIndexInList;

@end
