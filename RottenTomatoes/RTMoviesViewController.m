//
//  RTMoviesViewController.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/16/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTMoviesViewController.h"
#import "RTMovieTableViewCell.h"

static NSString *cellIdentifier = @"RTMovieTableViewCellId";

@interface RTMoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RTMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.movieTitleLabel.text = @"How to train your dragon - part 2";
    cell.movieDescLabel.text = @"This is an awesome movie. A must watch and a block-buster!";
    
    cell.moviePosterView.image = [UIImage imageNamed:@"default.jpg"];
    
    return cell;
}

@end
