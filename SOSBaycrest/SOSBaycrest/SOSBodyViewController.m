//
//  SOSBodyViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSBodyViewController.h"
#import "SOSDetailViewController.h"

@interface SOSBodyViewController () <SOSDetailViewControllerDelegate>
@property (nonatomic,strong) NSArray* labels;
@property (nonatomic,strong) NSArray* colors;
@property (nonatomic,strong) NSMutableArray* completedSystems;
@end
@implementation BodyCell

@end

@implementation SOSBodyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

UIColor* rgb(float r,float g,float b) {
    return rgba(r, g, b, 0.8);
}

UIColor* rgba(float r,float g, float b, float a) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

bool highContrastLowDistractionMode = true;

- (void)viewDidLoad
{
//    highContrastLowDistractionMode = false;
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = rgba(0, 200, 230,1.0);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baycrestlogo"]];
    self.labels = [NSArray arrayWithObjects:@"Neurological System",@"Sensory System", @"Respiratory System", @"Cardiovascular System", @"Integumentary System", @"Gastrointestinal System", @"Genitourinary System", @"Musculoskeletal System", @"Function", nil];
    

    if (highContrastLowDistractionMode) {
        self.colors = [NSArray arrayWithObjects: rgb(92,191,176), rgb(246,0,111),rgb(30,44,147),rgb(200,47,53),rgb(255,116,37),rgb(81,148,171),rgb(114,228,203),rgb(106,174,102),rgb(222,111,56),nil];
        
    }
    else {
        self.colors = [NSArray arrayWithObjects: rgb(92,191,176), rgb(246,0,111),rgb(30,44,147),rgb(200,47,53),rgb(255,116,37),rgb(81,148,171),rgb(114,228,203),rgb(106,174,102),rgb(222,111,56),nil];
        
    }
    
    NSInteger numSystems = self.labels.count;
    self.completedSystems = [NSMutableArray arrayWithCapacity:numSystems];
    for (int i = 0; i < numSystems; i++) {
        [self.completedSystems addObject: [NSNumber numberWithBool:FALSE]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BodyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSInteger row = indexPath.row;
    
    cell.label.text = [self.labels objectAtIndex: row];
    cell.label.textColor = [UIColor whiteColor];
    
    if (highContrastLowDistractionMode) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.label.textColor =[UIColor blackColor];

        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }
    else {
        cell.backgroundColor = [self.colors objectAtIndex:row];
    }
    

    
    NSString* imageName = [self.completedSystems[row] boolValue] ? @"checkmark" : @"navarrow";
    UIImage* image = [UIImage imageNamed:imageName];
    
    UIImageView* imageView =[[UIImageView alloc ] initWithImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    UIView* containter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image.size.width,image.size.height + 8)];
    imageView.frame = CGRectMake(0, 14, imageView.frame.size.width, imageView.frame.size.height);
    [containter addSubview:imageView];
    cell.accessoryView = containter;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 71;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SOSDetailViewController* detailVC =  (SOSDetailViewController*)segue.destinationViewController;
    NSIndexPath* selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
    NSInteger selectedRowIndex = [selectedRowIndexPath row];
    [self.tableView deselectRowAtIndexPath:selectedRowIndexPath animated:YES];
    detailVC.systemTitle = [self.labels objectAtIndex:selectedRowIndex];
    detailVC.headerColor = [self.colors objectAtIndex:selectedRowIndex];
    detailVC.systemIndex = selectedRowIndex;
    detailVC.delegate = self;
}

#pragma mark - Detail View Controller Delegate

-(void) detailViewControllerDidComplete:(SOSDetailViewController *)viewController {
    NSInteger index = viewController.systemIndex;
    [self.completedSystems replaceObjectAtIndex: index withObject:[NSNumber numberWithBool:YES]];
    NSArray* indexPaths = [NSArray arrayWithObjects: [NSIndexPath indexPathForRow:index inSection:0],nil]; //TODO: if you ever add sections this will have to change
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

@end

