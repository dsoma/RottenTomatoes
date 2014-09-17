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

static NSString *cellIdentifier = @"RTMovieTableViewCellId";
static NSString* apiURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us";

@interface RTMoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* movieList;

@end

@implementation RTMoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Box Office";
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
    
    NSURL* nsApiURL = [[NSURL alloc] initWithString:apiURL];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:nsApiURL];
    NSOperationQueue* opQueue = [NSOperationQueue mainQueue];
    
    [NSURLConnection sendAsynchronousRequest:request queue:opQueue  completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError) {
        NSDictionary* object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movieList = object[@"movies"];
        
        [self.tableView reloadData];
        
        NSLog(@"Movies: %@", self.movieList);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RTMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (self.movieList == nil) {
        return cell;
    }
    
    int rowIndex = indexPath.row;
    
    if (rowIndex < 0 || rowIndex >= self.movieList.count) {
        return cell;
    }
    
    NSDictionary* movie = self.movieList[rowIndex];
    NSDictionary* poster = [movie valueForKey:@"posters"];
    
    cell.movieTitleLabel.text = movie[@"title"];
    cell.movieDescLabel.text  = movie[@"synopsis"];
    
    NSString* posterUrl = [poster valueForKey:@"thumbnail"];
    NSURL* thumbnailUrl = [[NSURL alloc] initWithString:posterUrl];
    [cell.moviePosterView setImageWithURL:thumbnailUrl placeholderImage:[UIImage imageNamed:@"default.jpg"]];
    
    return cell;
}

@end
