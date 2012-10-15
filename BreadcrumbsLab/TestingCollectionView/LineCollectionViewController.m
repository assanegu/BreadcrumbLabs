//
//  LineCollectionViewController.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-20.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "LineCollectionViewController.h"
#import "LineGridFlowLayout.h"
#import "CollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>



@interface LineCollectionViewController ()

    @property (strong, nonatomic) NSMutableArray * dataSource;

@end

@implementation LineCollectionViewController


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
    
    LineGridFlowLayout * lineFlowLayout = [[LineGridFlowLayout alloc]init];
    [self.collectionView setCollectionViewLayout:lineFlowLayout];
    self.collectionView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
	// Get the data into the data source.
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++)
    {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }
    self.dataSource = [[NSMutableArray alloc] initWithObjects:firstSection, nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataSource count];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *sectionArray = [self.dataSource objectAtIndex:section];
    return [sectionArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cellx";

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor orangeColor];
    cell.labelName.textColor = [UIColor whiteColor];
    cell.labelName.font = [UIFont systemFontOfSize:20];
    cell.labelName.text = [NSString stringWithFormat:@"%@", [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];

    cell.contentView.layer.borderWidth = 2.0f;
    cell.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"indexPath = %@ ", indexPath);
    
    if (indexPath!=nil)
    {
        // Delete the items from the data source.
        [[self.dataSource objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        
        // Delete the items from the collection view.
        [self.collectionView performBatchUpdates:^{
            [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
            
        } completion:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toDetailViewIdentifier"]) {
  //      NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
 //       NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
  //      [[segue destinationViewController] setDetailItem:object];
    }
}




@end
