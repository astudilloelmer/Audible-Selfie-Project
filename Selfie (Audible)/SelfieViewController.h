//
//  SelfieViewController.h
//  Selfie (Audible)
//
//  Created by Elmer Astudillo on 12/3/14.
//  Copyright (c) 2014 AstudilloDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfieViewController : UIViewController

+ (void) imageForPhoto:(NSDictionary *)
photo size:(NSString *)size
            completion:(void(^)(UIImage *image))completion;

@end
