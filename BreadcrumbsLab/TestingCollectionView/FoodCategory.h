//
//  FoodCategory.h
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-08.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

@interface FoodCategory : NSObject

@property(nonatomic, strong, readonly) NSMutableArray * foodItemList;

- (id)initWithArray:(NSArray *) dishArray;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
@end
