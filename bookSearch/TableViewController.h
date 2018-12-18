//
//  TableViewController.h
//  bookSearch
//
//  Created by Ajay Kumar on 12/17/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak,nonatomic) NSString *introString;
@property(strong, nonatomic, readwrite) NSMutableArray *bookArr;



@end
