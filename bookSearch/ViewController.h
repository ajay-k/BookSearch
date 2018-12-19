//
//  ViewController.h
//  bookSearch
//
//  Created by Ajay Kumar on 12/15/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//@property(strong, nonatomic, readwrite) NSMutableArray *bookArr;


@property (nonatomic, strong) NSString *searchTerm;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;



@end

