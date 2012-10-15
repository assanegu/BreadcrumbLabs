//
//  LineGridFlowLayout.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-20.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "LineGridFlowLayout.h"

#define ITEM_SIZE 100
#define ACTIVE_DISTANCE 100
#define ZOOM_FATOR 0.5


@implementation LineGridFlowLayout


-(id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(180, ITEM_SIZE);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(20, 20, 20, 30);
        self.minimumLineSpacing = 50.0;
        self.minimumInteritemSpacing = 100;
    }
    return self;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size   = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes * attributes in array)
    {
        if (CGRectIntersectsRect(attributes.frame, rect))
        {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE)
            {
                CGFloat zoom = 1 + ZOOM_FATOR*(1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1);
                attributes.zIndex = round(zoom);
            }
        }
    }
    return array;
}


-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAjustment = MAXFLOAT;
    CGFloat horizontalCenter =  proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray * array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes * layoutAttributes in array) {
        CGFloat itenmHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itenmHorizontalCenter - horizontalCenter) < ABS(offsetAjustment)) {
            offsetAjustment = itenmHorizontalCenter - horizontalCenter;
        }
    }
    
    return  CGPointMake(proposedContentOffset.x + offsetAjustment, proposedContentOffset.y);
}


@end
