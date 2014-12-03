//
//  ViewController.m
//  Selfie (Audible)
//
//  Created by Elmer Astudillo on 12/2/14.
//  Copyright (c) 2014 AstudilloDevelopment. All rights reserved.
//

#import "ImageViewController.h"
#import "SelfieViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [self.view addSubview:self.imageView];
    
    // Class Method
    [SelfieViewController imageForPhoto:self.photo size:@"standard_resolution" completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    // Tap to close
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.view addGestureRecognizer:tap];
}

-(void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    
    // View Controller's view size
    CGSize size = self.view.bounds.size;
    
    // Image view's size
    CGSize imageSize = CGSizeMake(size.width, size.width);
    
    // Image view's frame
    self.imageView.frame = CGRectMake(0.0, (size.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Dismiss view
-(void) close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
