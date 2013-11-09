//
//  SOSAppDelegate.h
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-09.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+(SOSAppDelegate*) sharedInstance;
-(NSDictionary*) checklistDict ;

@end
