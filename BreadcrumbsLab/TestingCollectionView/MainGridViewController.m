//
//  MainGridViewController.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-22.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "MainGridViewController.h"
#import "DetailViewController.h"
#import "ViewController.h"

@interface MainGridViewController ()

    @property (weak, nonatomic) IBOutlet UIView *gridViewController;
    @property (weak, nonatomic) IBOutlet UIView *lineView;

@end

@implementation MainGridViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*
     When a row is selected, the segue creates the detail view controller as the destination.
     Set the detail view controller's detail item to the item associated with the selected row.
     */
    if ([[segue identifier] isEqualToString:@"toDetailViewIdentifier"]) {
        
   //     NSIndexPath *selectedRowIndex = [[self.collectionView indexPathsForSelectedItems] lastObject];
   //     DetailViewController *detailViewController = [segue destinationViewController];
   //     [detailViewController setMyLabel:[NSString stringWithFormat:@" Testing the view"]];
    }
}


-(BOOL)shouldAutomaticallyForwardRotationMethods
{
    return YES;
}

@end
