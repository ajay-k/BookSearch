//
//  ViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/15/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"tableViewSegue"]) {
        TableViewController *tvc = segue.destinationViewController;
        tvc.searchParam = _searchTextBox.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
