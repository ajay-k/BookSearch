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
    
    NSString *urlString = @"https://itunes.apple.com/search?term=fitzgerald&entity=ebook&limit=1";
    //NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";

    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:(url) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
       NSLog(@"Finished fetching books");
        
       //NSString *dummyString = [[NSString alloc] initWithData:(data) encoding:(NSUTF8StringEncoding)];
        
       //NSLog(@"Dummy string: %@", dummyString);
        
        NSError *err;
        
        //NSArray *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        NSDictionary *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        
        if (err) {
            NSLog(@"Failed to serialzie into JSON: %@", err);
            return;
        }
        
        
       // NSArray *arrayOfJSON = [allDataDictionary objectForKey:@"trackName"];

        //create dict and save data and display it on console
        
        for (NSString *tempObject in booksJSON ) {
           // NSLog(@"Object: %@", [booksJSON objectForKey:tempObject]);
            //NSString *trackName = booksJSON[@"trackName"];
            //NSLog(@"%@",[booksJSON objectForKey:@"result"]);
            //NSLog(trackName);
            
            //NSLog(@"Object: %@, Key: %@", [booksJSON valueForKey:tempObject], tempObject);
        }
        
        //NSLog(@"DEC");

        for (NSDictionary *bookDict in booksJSON[@"results"]) {
            //Book detail should at least the display the title, author, summary and an image.
            
            //NSString *trackName = [bookDict objectForKey:@"resultCount"];
            //NSString *trackName = bookDict[@"trackName"];
            //NSLog(trackName);
            
//                NSString *firstName = bookDict[@"trackName"];
//                NSString *lastName = bookDict[@"artistName"];
            
            
            id trackName = bookDict[@"trackName"];
            id artistName = bookDict[@"artistName"];
            id description = bookDict[@"description"];


            NSLog(trackName);
            NSLog(artistName);
            NSLog(description);


            //NSLog(@"TrackName: %@", bookDict[@"trackName"]);
        }
    }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
