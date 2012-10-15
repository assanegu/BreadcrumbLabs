//
//  FoodCategory.m
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-08.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "FoodCategory.h"

@interface FoodCategory()

@property(nonatomic, strong, readwrite) NSMutableArray * foodItemList;

@end

@implementation FoodCategory


-(id)initWithArray:(NSArray *) dishArray
{
    if (self == [super init]) {
        self.foodItemList = [dishArray mutableCopy];
    }
    return self;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.foodItemList[idx];
}

@end
