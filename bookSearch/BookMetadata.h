//
//  BookMetadata.h
//  bookSearch
//
//  Created by Ajay Kumar on 12/17/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookMetadata : NSObject

@property NSString *bookTitle;
@property NSString *authorName;
@property NSString *imageURL;
@property NSString *summary;
@property double rating;


- (id)initWithMetadata:(NSString *)bookTitle
               authorName:(NSString *)anAuthorName
               imageURL:(NSString *)anImageUrl
               summary:(NSString *)Asummary
               rating:(double)Arating;

@end
