//
//  TableViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/17/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "TableViewController.h"
#import "BookMetadata.h"
#import "BookDataViewController.h"

@interface TableViewController () {
    NSMutableArray *_bookArr;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchBooksUsingJSON:_searchParam];
}

- (void)fetchBooksUsingJSON:(NSString *)searchParam {
    _bookArr = [NSMutableArray new];
    
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=ebook", searchParam];
    urlString= [urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:(url) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        
        NSDictionary *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        if (err) {
            NSLog(@"Failed to serialzie into JSON: %@", err);
            return;
        }
        
        for (NSDictionary *bookDict in booksJSON[@"results"]) {
            //Book detail should at least the display the title, author, summary and an image.
            
            BookMetadata *bookMetadata = [[BookMetadata alloc]initWithMetadata:bookDict[@"trackName"]
                                                                     authorName:bookDict[@"artistName"]
                                                                       imageURL:bookDict[@"artworkUrl60"]
                                                                        summary:bookDict[@"description"]
                                                                         rating:[bookDict[@"averageUserRating"] doubleValue]];
            
             [_bookArr addObject:bookMetadata];
        }
        
        [self.tableView reloadData];
    }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bookArr.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"bookDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BookDataViewController *bdvc = segue.destinationViewController;
        
        BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
        bdvc.bookTitle = bookMetadata.bookTitle;
        bdvc.authorName = bookMetadata.authorName;
        bdvc.summary = bookMetadata.summary;
        bdvc.imgURL = bookMetadata.imageURL;
        bdvc.rating = bookMetadata.rating;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
    cell.textLabel.text = bookMetadata.bookTitle;
    
    return cell;
}

@end
