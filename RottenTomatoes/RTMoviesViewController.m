//
//  RTMoviesViewController.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/16/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTMoviesViewController.h"
#import "RTMovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "RTMovieDetailViewController.h"

static NSString *cellIdentifier = @"RTMovieTableViewCellId";

@interface RTMoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RTModel* model;

@end

@implementation RTMoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Box Office";
        self.model = [[RTModel alloc] init];
        self.model.observer = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight  = 145;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RTMovieTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    [self.model loadMovieList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.model != nil) {
        return [self.model getMovieCount];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RTMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (self.model == nil) {
        return cell;
    }
    
    int rowIndex = indexPath.row;
    
    // Asynchronously load the movie poster thumbnail
    NSString* posterUrl = [self.model getMovieThumbnailUrl:rowIndex];
    NSURL* thumbnailUrl = [[NSURL alloc] initWithString:posterUrl];
    [cell.moviePosterView setImageWithURL:thumbnailUrl placeholderImage:[UIImage imageNamed:@"default.jpg"]];
    
    // Set the title and desc
    cell.movieTitleLabel.text = [self.model getTitle:rowIndex];
    cell.movieDescLabel.text  = [self.model getDesc:rowIndex];
    
    return cell;
}

// From MovieDataObserver

-(void)movieListLoaded
{
    [self.tableView reloadData];
}

-(void)movieListLoadFailed:(NSError*)error
{
    // TODO: Display error
}

// From UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RTMovieDetailViewController* movieDetailViewController = [[RTMovieDetailViewController alloc] init];
    
    self.model.currentMovieItemIndex = indexPath.row;
    movieDetailViewController.model  = self.model;
    
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
    
    //[movieDetailViewController loadMovieDetails:indexPath.row];
}


@end
