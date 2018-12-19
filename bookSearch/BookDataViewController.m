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
@synthesize bookTitle;
@synthesize bookTitleLabel;
@synthesize authorName;
@synthesize authorNameLabel;
@synthesize summary;
@synthesize summaryTextView;
@synthesize imgURL;
@synthesize imgView;
@synthesize rating;
@synthesize ratingLabel;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    bookTitleLabel.text = bookTitle;
    authorNameLabel.text = authorName;
    
    NSString *ratingStr = [NSString stringWithFormat:@"%.02lf", rating];
    ratingStr = [NSString stringWithFormat:@"%@ %@", @"Rating:", ratingStr];
    ratingLabel.text = ratingStr;
    
    NSError *error = nil;
    NSAttributedString *attString = [[NSAttributedString alloc] initWithData:[summary dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)} documentAttributes:nil error:&error];
    if (error) {
        NSLog(@"Error: %@ %s %i", error.localizedDescription, __func__, __LINE__);
    } else {
        // Clear text view
        summaryTextView.text = @"";
        // Append the attributed string
        [summaryTextView.textStorage appendAttributedString:attString];
    }
    
    
    imgView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]]];
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
