//
//  RTMoviesViewController.h
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/16/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTModel.h"

@interface RTMoviesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MovieDataObserver>

@end
