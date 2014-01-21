//
//  MoviesViewController.m
//  Tomatoes
//
//  Created by Hua Wu on 1/20/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieDetailViewController.h"

@interface MoviesViewController ()

@property (nonatomic, strong) NSMutableArray *movieItems;

- (void)reload;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self reload];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    [refresh addTarget:self action:@selector(reload) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refresh;
    [self reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movieItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    Movie *movie = self.movieItems[indexPath.row];
    
    cell.movieTitleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    cell.castLabel.text = movie.cast;
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:movie.poster]]];

    [cell.posterArea setImage:image];
    return cell;
}

- (void)stopRefresh {
    [self.refreshControl endRefreshing];
}


- (void) reload {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *movies = [object objectForKey:@"movies"];
        self.movieItems = [[NSMutableArray alloc] init];
        for (NSDictionary *object in movies) {
            Movie *mv = [[Movie alloc] initWithDictionary:object];
            [self.movieItems addObject:mv];
        }
        
        NSLog(@"%@", object);
        [self.tableView reloadData];
        [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.5];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMovieDetail"]) {
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        Movie *movie = self.movieItems[indexPath.row];
        
        MovieDetailViewController *mdvcontroller = (MovieDetailViewController *)segue.destinationViewController;
        mdvcontroller.movieDetail = movie;
    }
}

@end
