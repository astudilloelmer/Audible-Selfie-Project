//
//  CollectionViewController.h
//  Selfie (Audible)
//
//  Created by Elmer Astudillo on 12/3/14.
//  Copyright (c) 2014 AstudilloDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// A valid access token from Instagram.
@property (nonatomic, strong) NSString *accessToken;

// Get pictures earlier than this max_id
@property (nonatomic, strong) NSString *max_tag_id;

//Object for photos in collection view
@property (nonatomic, strong) NSArray *photos;

@end
