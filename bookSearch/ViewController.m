//
//  ViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/15/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
//#import "TableViewController.m"

@interface ViewController ()

@end

@implementation ViewController

@synthesize searchTerm;
@synthesize searchTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//- (void) fetchBooksUsingJSON {
//
//        NSString *searchTermText = self.searchTextField.text;
//        NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=ebook", searchTermText];
//        NSLog(@"Text search data:");
//
//
//        NSURL *url = [NSURL URLWithString:urlString];
//
//        [[NSURLSession.sharedSession dataTaskWithURL:(url) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//
//        NSError *err;
//
//
//
//        NSDictionary *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
//
//
//        if (err) {
//            NSLog(@"Failed to serialzie into JSON: %@", err);
//            return;
//        }
//
//
//
//
//
//        for (NSDictionary *bookDict in booksJSON[@"results"]) {
//
//            id trackName = bookDict[@"trackName"];
//            id artistName = bookDict[@"artistName"];
//            id description = bookDict[@"description"];
//
//            NSLog(trackName);
//            NSLog(artistName);
//            NSLog(description);
//
//        }
//    }] resume];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"tableViewSegue"])
    {
        // Get reference to the destination view controller
        TableViewController *tvc = segue.destinationViewController;
        
        // Pass any objects to the view controller here, like...
         tvc.searchParam = self.searchTextField.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
