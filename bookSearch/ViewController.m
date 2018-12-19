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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"tableViewSegue"])
    {
        // Get reference to the destination view controller
        TableViewController *tvc = segue.destinationViewController;
        
        // Pass any objects to the view controller here, like...
         tvc.searchParam = searchTextField.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
