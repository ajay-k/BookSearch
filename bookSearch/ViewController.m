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

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"hello"]){
//        
//        NSString *intro  = @"Hello my friend.";
//        TableViewController *tvc = [segue destinationViewController];
//        tvc.introString = intro;
//    }else if([segue.identifier isEqualToString:@"hola"]){
//        
//        NSString *intro  = @"Hello my friend.";
//        TableViewController *tvc = [segue destinationViewController];
//        tvc.introString = intro;
//    }
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self fetchBooksUsingJSON];
    //[self fetchBooksUsingJSON];
    
}

- (void) fetchBooksUsingJSON {
        NSLog(@"Fetching Books");
    
        //NSString *urlString = @"https://itunes.apple.com/search?term=fitzgerald&entity=ebook";
        //NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";

    
        NSString *searchTermText = self.searchTextField.text;
        NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=ebook", searchTermText];
        NSLog(@"Text search data:");
    
        //NSLog(final);
    
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
        
       

        for (NSDictionary *bookDict in booksJSON[@"results"]) {
            //Book detail should at least the display the title, author, summary and an image.
            
            //NSString *trackName = [bookDict objectForKey:@"resultCount"];
            //NSString *trackName = bookDict[@"trackName"];
            //NSLog(trackName);
            
            //NSString *firstName = bookDict[@"trackName"];
            //NSString *lastName = bookDict[@"artistName"];
            
            
            id trackName = bookDict[@"trackName"];
            id artistName = bookDict[@"artistName"];
            id description = bookDict[@"description"];

            //[_bookArr addObject:trackName];
            
        
            NSLog(trackName);
            NSLog(artistName);
            NSLog(description);


        }
    }] resume];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"tableViewSegue"])
    {
        // Get reference to the destination view controller
        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TableViewController *tvc = segue.destinationViewController;
        
        // Pass any objects to the view controller here, like...
        
        //[bdvc object:bookMetaData];
        
         tvc.searchParam = self.searchTextField.text;
        
//        BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
//        bdvc.bookTitle = bookMetadata.bookTitle;
//        bdvc.authorName = bookMetadata.authorName;
//        bdvc.summary = bookMetadata.summary;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
