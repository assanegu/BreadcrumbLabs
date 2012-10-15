//
//  ViewController.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-18.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "DetailViewController.h"
#import "CollectionHeader.h"


@interface ViewController ()

@property (nonatomic) NSInteger numberOfItemsInSection;
@property (nonatomic, strong) NSArray *dataArray;

@end


@implementation ViewController


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
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [flowLayout setItemSize:CGSizeMake(256, 130)];
    [flowLayout setMinimumInteritemSpacing:0];
    [flowLayout setMinimumLineSpacing:0];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 35)];
    
    self.navigationController.view.backgroundColor = [UIColor blackColor];
    [self.collectionView setCollectionViewLayout:flowLayout];
    _numberOfItemsInSection = 1;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    self.collectionView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    
    // Create the collection data
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    NSMutableArray *thirdSection = [[NSMutableArray alloc] init];
    NSMutableArray *secondSection = [[NSMutableArray alloc] init];
    for (int i=0; i<12; i++)
    {
        firstSection[i] = [NSString stringWithFormat:@"A %d", i];
        secondSection[i] = [NSString stringWithFormat:@"C %d", i];

        if (i%2 == 0)
        {
            [thirdSection addObject:[NSString stringWithFormat:@"B %d", i]];
        }
    }
    self.dataArray = [[NSMutableArray alloc] initWithObjects:firstSection, thirdSection, secondSection, nil];
    self.dataArray = @[ firstSection, thirdSection, secondSection];
    
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
 //   cell.labelName.text = [NSString stringWithFormat:@"%d", (indexPath.section*3 + indexPath.row)];
    NSArray * dataInSection = self.dataArray[indexPath.section];
    cell.labelName.text = dataInSection[indexPath.row];
    cell.labelName.textColor = [UIColor whiteColor];
    
    cell.contentView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];    

    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeader * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdentifier" forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        header.titleLabel.text = @"Food Sub Category 1";
    }else if (indexPath.section == 1)
    {
        header.titleLabel.text = @"Food Sub Category 2";
    }else if (indexPath.section == 2)
    {
        header.titleLabel.text = @"Food Sub Category 3";
    }

    
    return header;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailView"])
    {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        DetailViewController * detailViewController = [segue destinationViewController];
        [detailViewController setItemValueForLabel:[NSString stringWithFormat:@"%d", (indexPath.section*3 + indexPath.row)]];
    }
}


@end
