//
//  FoodItem.h
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-07.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CouchCocoa/CouchModel.h>

@interface FoodItem : CouchModel

@property (readwrite) int dishID;

@property (nonatomic, strong, readonly)   NSString* dishName;
@property (nonatomic, strong, readonly)   NSString* dishDescription;
@property (nonatomic, strong, readonly)   UIImage*  dishImage;
@property (nonatomic, strong, readonly)   NSString* dishPrice;
@property (nonatomic, strong, readonly)   NSString* dishIngredient;
@property (nonatomic, strong, readonly)   NSString* dishCategory;
@property (nonatomic, strong, readonly)   NSString* dishSubCategory;

@property (readwrite) int tagValue;
@property (readwrite) int isSpicy;
@property (readwrite) int isLowInFat;
@property (readwrite) int isHealthy;
@property (readwrite) int containWheat;


+ (FoodItem *) initWithDatabase:(CouchDatabase*)database
                         dishID:(int) ID
                       dishName:(NSString *)name
                dishDescription:(NSString *)description
                      dishPrice:(NSString *)price
                 dishIngredient:(NSString *)dishIngredient
                   dishCategory:(NSString *)dishCategory
                dishSubCategory:(NSString *)subCategory
                       tagValue:(int )theTagValue
                        isSpicy:(int )isSpicy
                     isLowInFat:(int )isLowInFat
                      isHealthy:(int )isHealthy
                   containWheat:(int )containWheat;

- (void) deleteFoodItemWithDishID:(int) theDishID foodItemObject:(FoodItem *)foodItem;


@end
