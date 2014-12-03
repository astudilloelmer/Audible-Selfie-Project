//
//  AppDelegate.h
//  Selfie (Audible)
//
//  Created by Elmer Astudillo on 12/2/14.
//  Copyright (c) 2014 AstudilloDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NetCheck.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, NetCheckDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

