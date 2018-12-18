//
//  TableViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/17/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "TableViewController.h"



@interface TableViewController () {
    //NSArray *devices;
    
    //Change devices to be mutable array
    
    //NSMutableArray *devices;
    NSMutableArray *_bookArr;

    
    //NSMutableArray *bookArray;

    
}

@end

@implementation TableViewController

@synthesize introString; 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSMutableArray *bookArray;

    
    [self fetchBooksUsingJSON];
    //devices = @[@"ABC", @"iPad",@"iMac", @"iWatch", @"iTV"];
}

- (void) fetchBooksUsingJSON {
    NSLog(@"Fetching Books");

    
    _bookArr = [NSMutableArray new];

    NSString *urlString = @"https://itunes.apple.com/search?term=fitzgerald&entity=ebook";
    //NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:(url) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Finished fetching books");
        
//        NSString *dummyString = [[NSString alloc] initWithData:(data) encoding:(NSUTF8StringEncoding)];
//        
//        NSLog(@"Dummy string: %@", dummyString);
        
        NSError *err;
        
        //NSArray *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        NSDictionary *booksJSON = [NSJSONSerialization JSONObjectWithData:(data) options:NSJSONReadingAllowFragments error:(&err)];
        
        
        if (err) {
            NSLog(@"Failed to serialzie into JSON: %@", err);
            return;
        }
        
        
        // NSArray *arrayOfJSON = [allDataDictionary objectForKey:@"trackName"];
        
        //create dict and save data and display it on console
        
//        for (NSString *tempObject in booksJSON ) {
//            // NSLog(@"Object: %@", [booksJSON objectForKey:tempObject]);
//            //NSString *trackName = booksJSON[@"trackName"];
//            //NSLog(@"%@",[booksJSON objectForKey:@"result"]);
//            //NSLog(trackName);
//
//            //NSLog(@"Object: %@, Key: %@", [booksJSON valueForKey:tempObject], tempObject);
//        }
//
        //NSLog(@"DEC");
        
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
            
            
            //[bookArray addObject: bookDict[@"trackName"]];
            
            [_bookArr addObject:trackName];
            
            //NSLog(_myNum);
            
            NSLog(trackName);
            NSLog(artistName);
            NSLog(description);
            //NSLog(@"-----------------------------");
            
            
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = devices[indexPath.row];
    //cell.textLabel.text = devices[indexPath.row];
    cell.textLabel.text = [_bookArr objectAtIndex:indexPath.row];
    
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
