//
//  ViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/15/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchBooksUsingJSON];
}

- (void) fetchBooksUsingJSON {
    NSLog(@"Fetching Books");
    
    NSString *urlString = @"https://itunes.apple.com/lookup?id=909253";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:(url) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Finished fetching books");
        
        NSString *dummyString = [[NSString alloc] initWithData:(data) encoding:(NSUTF8StringEncoding)];
        
        NSLog(@"Dummy string: %@", dummyString);
        
        NSError *err;
        
        NSArray *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        if (err) {
            NSLog(@"Failed to serialzie into JSON: %@", err);
            return;
        }
    }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
