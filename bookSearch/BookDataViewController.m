//
//  BookDataViewController.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/18/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "BookDataViewController.h"

@interface BookDataViewController ()

@end

@implementation BookDataViewController
@synthesize bookTitleLabel;
@synthesize bookTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    bookTitleLabel.text = bookTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
