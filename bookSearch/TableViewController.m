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

@synthesize searchParam;

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self fetchBooksUsingJSON:searchParam];
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

        
        id trackName = bookDict[@"trackName"];
        id artistName = bookDict[@"artistName"];
        id description = bookDict[@"artworkUrl60"];
        

        BookMetadata *bookMetadata = [[BookMetadata alloc]initWithMetadata:bookDict[@"trackName"]
                                   authorName:bookDict[@"artistName"]
                                    imageURL:bookDict[@"artworkUrl60"]
                                      summary:bookDict[@"description"]];
        
         [_bookArr addObject:bookMetadata];
        
    }
        
        [self.tableView reloadData];

    }] resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bookArr.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"bookDetailSegue"])
    {
        // Get reference to the destination view controller
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BookDataViewController *bdvc = segue.destinationViewController;

        // Pass any objects to the view controller here, like...
        
        //[bdvc object:bookMetaData];
        BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
        bdvc.bookTitle = bookMetadata.bookTitle;
        bdvc.authorName = bookMetadata.authorName;
        bdvc.summary = bookMetadata.summary;
        bdvc.imgURL = bookMetadata.imageURL;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
    //bookMetadata.trackID;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    BookMetadata *bookMetadata = ((BookMetadata *)[_bookArr objectAtIndex:indexPath.row]);
    cell.textLabel.text = bookMetadata.bookTitle;
    
    //create fields for UI and link
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
