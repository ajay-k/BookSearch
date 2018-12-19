//
//  BookMetadata.m
//  bookSearch
//
//  Created by Ajay Kumar on 12/17/18.
//  Copyright © 2018 Ajay Kumar. All rights reserved.
//

#import "BookMetadata.h"

@implementation BookMetadata : NSObject

- (id)initWithMetadata:(NSString *)bookTitle
               authorName:(NSString *)anAuthorName
               imageURL:(NSString *)anImageUrl
                summary:(NSString *)ASummary
                rating:(double)Arating {
    
    if ( self = [super init] ) {
        _bookTitle = bookTitle;
        _authorName = anAuthorName;
        _imageURL = anImageUrl;
        _summary = ASummary;
        _rating = Arating;
    }
        
    return self;
}

@end
