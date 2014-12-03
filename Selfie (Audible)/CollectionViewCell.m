//
//  CollectionViewCell.m
//  Selfie (Audible)
//
//  Created by Elmer Astudillo on 12/3/14.
//  Copyright (c) 2014 AstudilloDevelopment. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CollectionViewController.h"
#import "SelfieViewController.h"

@implementation CollectionViewCell

#pragma mark - Initialization

- (id) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //Initialization
        self.imageView = [[UIImageView alloc] init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(like)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

#pragma mark - Set Cell

-(void) setPhoto:(NSDictionary *)photo {
    _photo = photo;
    
    // Class method
    [SelfieViewController imageForPhoto:_photo size:@"thumbnail" completion:^(UIImage *image) {
        
        self.imageView.image = image;
    }];
}

#pragma mark - Photo Layout (Cell)

-(void) layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}


#pragma mark - Instagram API Call

-(void) like{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"];
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.instagram.com/v1/media/%@/likes?access_token=%@", self.photo[@"id"],accessToken ];
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showLikedCompletion];
        });
    }];
    
    [task resume];
}

#pragma mark - Instagram Alert

-(void) showLikedCompletion {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Liked!" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
}


@end
