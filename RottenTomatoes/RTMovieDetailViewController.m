//
//  RTMovieDetailViewController.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/17/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTMovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface RTMovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end

@implementation RTMovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [self loadMovieDetails:self.model.currentMovieItemIndex];
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self loadMovieDetails:self.model.currentMovieItemIndex];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadMovieDetails:(int)movieIndex
{
    if (self.model != nil && self.posterView != nil) {
        
        // Asynchronously load the movie poster thumbnail
        NSString* thumbnailUrlString = [self.model getMovieThumbnailUrl:movieIndex];
        NSURL* thumbnailUrl = [[NSURL alloc] initWithString:thumbnailUrlString];
        
        NSString* posterUrlString = [self.model getMoviePosterUrl:movieIndex];
        NSURL* posterUrl = [[NSURL alloc] initWithString:posterUrlString];
        
        [self.posterView setImageWithURL:thumbnailUrl placeholderImage:nil];
        
        [self.posterView setImageWithURL:posterUrl placeholderImage:nil];
    }
}

@end
