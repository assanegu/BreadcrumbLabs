//
//  CollectionHeader.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-27.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "CollectionHeader.h"

@implementation CollectionHeader

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
