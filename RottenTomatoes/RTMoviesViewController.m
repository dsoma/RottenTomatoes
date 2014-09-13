//
//  RTMoviesViewController.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/11/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTMoviesViewController.h"

@interface RTMoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RTMoviesViewController

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
    [super viewDidLoad];
    
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section:](NSInteger) section {
    return 10;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.
}
*/

@end
