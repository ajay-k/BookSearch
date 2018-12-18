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

@end
