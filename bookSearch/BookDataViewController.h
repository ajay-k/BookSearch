//
//  BookDataViewController.h
//  bookSearch
//
//  Created by Ajay Kumar on 12/18/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookDataViewController : UIViewController

@property (nonatomic, strong) NSString *bookTitle;
@property (strong, nonatomic) IBOutlet UILabel *bookTitleLabel;

@property (nonatomic, strong) NSString *authorName;
@property (strong, nonatomic) IBOutlet UILabel *authorNameLabel;

@property (nonatomic, strong) NSString *summary;
@property (strong, nonatomic) IBOutlet UITextView *summaryTextView;

@property (nonatomic, strong) NSString *imgURL;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic) double rating;

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@end
