//
//  SOSBodyViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSBodyViewController.h"

@interface SOSBodyViewController ()
@property (nonatomic,strong) NSArray* labels;
@property (nonatomic,strong) NSArray* colors;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = rgba(0, 200, 230,1.0);
//    self.navigationController.navigationBar.backgroundColor = rgba(0, 200, 230,1.0);
    self.navigationController.navigationBar.translucent = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baycrestlogo"]];
    self.labels = [NSArray arrayWithObjects:@"Neurological System",@"Sensory System", @"Respiratory System", @"Cardiovascular System", @"Intergumentary System", @"Gastrointestinal System", @"Genitourinary System", @"Musculoskeletal System", @"Function", nil];
    
    self.colors = [NSArray arrayWithObjects: rgb(92,191,176), rgb(246,0,111),rgb(30,44,147),rgb(200,47,53),rgb(255,116,37),rgb(81,148,171),rgb(122,0,255),rgb(105,201,21),rgb(222,180,56),nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BodyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.label.text = [self.labels objectAtIndex: indexPath.row];
    cell.label.textColor = [UIColor whiteColor];
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];
    cell.accessoryView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"navarrow"]];
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
    
}



@end

