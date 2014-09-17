//
//  RTMovieTableViewCell.h
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/16/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTMovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *movieDescLabel;

@property (weak, nonatomic) IBOutlet UIImageView *moviePosterView;

@end
