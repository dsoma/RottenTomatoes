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
@property (weak, nonatomic) IBOutlet UIView *movieDetailsView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleYear;
@property (weak, nonatomic) IBOutlet UILabel *ratingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *mpaaRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation RTMovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
}

-(void) loadMovieDetails:(int)movieIndex
{
    if (self.model != nil && self.posterView != nil) {
        // First set the title of the view with the selected movie name
        NSString* movieTitle = [self.model getTitle:movieIndex];
        self.title = movieTitle;
        
        // Asynchronously load the movie poster thumbnail
        NSString* thumbnailUrlString = [self.model getMovieThumbnailUrl:movieIndex];
        NSURL* thumbnailUrl = [[NSURL alloc] initWithString:thumbnailUrlString];
        
        NSString* posterUrlString = [self.model getMoviePosterUrl:movieIndex];
        NSURL* posterUrl = [[NSURL alloc] initWithString:posterUrlString];
        
        [self.posterView setImageWithURL:thumbnailUrl placeholderImage:nil];
        
        // TODO: Need to get the cached image from the model.
        // And then use that image as the placeholder image.
        [self.posterView setImageWithURL:posterUrl placeholderImage:self.posterView.image];
        
        // Set the movie title and release year in the details view
        NSString* releaseYear = [[NSString alloc] initWithFormat:@" (%@)", [self.model getReleaseYear:movieIndex]];
        self.movieTitleYear.text = [movieTitle stringByAppendingString:releaseYear];
        
        // Set the movie scores
        NSString* criticsScore  = [self.model getCriticsScore:movieIndex];
        NSString* audienceScore = [self.model getAudienceScore:movieIndex];
        self.ratingsLabel.text  = [[NSString alloc] initWithFormat:@"Critics Score: %@, Audience Score: %@", criticsScore, audienceScore];
        
        self.mpaaRatingLabel.text = [self.model getMpaaRating:movieIndex];
        
        self.descLabel.text = [self.model getDesc:movieIndex];
    }
}

@end
