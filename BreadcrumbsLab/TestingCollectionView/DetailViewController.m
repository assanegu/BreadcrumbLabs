//
//  DetailViewController.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-22.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "DetailViewController.h"

static UILabel * _label;

@interface DetailViewController ()

    @property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation DetailViewController


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
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setItemValueForLabel:(NSString *)theLabelText
{
    _myLabel.text = theLabelText;
    NSLog(@"self.myLabel.text= %@ ", _myLabel.text);
    NSLog(@"the Label Textt= %@ ", theLabelText);
    
    _label.text = @"testing label";
    NSLog(@"_label= %@ ", _label);

}

@end
