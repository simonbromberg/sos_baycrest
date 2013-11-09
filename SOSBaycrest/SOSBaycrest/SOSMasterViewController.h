//
//  SOSMasterViewController.h
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-09.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SOSDetailViewController;

#import <CoreData/CoreData.h>

@interface SOSMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) SOSDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
