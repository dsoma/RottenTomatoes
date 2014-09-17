//
//  RTMovieDetailViewController.h
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/17/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTModel.h"

@interface RTMovieDetailViewController : UIViewController

@property (weak, nonatomic) RTModel* model;

-(void) loadMovieDetails:(int)movieIndex;

@end
