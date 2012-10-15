//
//  FoodItem.m
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-07.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "FoodItem.h"
#import <CouchCocoa/CouchCocoa.h>
#import <CouchCocoa/RESTBody.h>

@interface FoodItem() 

@property (nonatomic, strong, readwrite)   NSString* dishName;
@property (nonatomic, strong, readwrite)   NSString* dishDescription;
@property (nonatomic, strong, readwrite)   UIImage*  dishImage;
@property (nonatomic, strong, readwrite)   NSString* dishPrice;
@property (nonatomic, strong, readwrite)   NSString* dishIngredient;
@property (nonatomic, strong, readwrite)   NSString* dishCategory;
@property (nonatomic, strong, readwrite)   NSString* dishSubCategory;

@end


@implementation FoodItem

@dynamic dishName, dishDescription, dishImage, dishPrice, dishIngredient, dishCategory, dishSubCategory;
@dynamic dishID, tagValue, isSpicy, isLowInFat, isHealthy, containWheat;


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
                   containWheat:(int )containWheat
{    
    FoodItem * myFoodItem = [[FoodItem alloc] initWithNewDocumentInDatabase:database];
    myFoodItem.dishID                = ID;
    myFoodItem.dishName              = name;
    myFoodItem.dishDescription       = description;
    myFoodItem.dishPrice             = price;
    myFoodItem.dishIngredient        = dishIngredient;
    myFoodItem.dishCategory          = dishCategory;
    myFoodItem.dishSubCategory       = subCategory;
    myFoodItem.tagValue              = theTagValue;
    myFoodItem.isSpicy               = isSpicy;
    myFoodItem.isLowInFat            = isLowInFat;
    myFoodItem.isHealthy             = isHealthy;
    myFoodItem.containWheat          = containWheat;
        
    myFoodItem.autosaves = YES;

    RESTOperation* op  = [myFoodItem save];
    if (![op wait]) {
        // TODO: report error
        NSLog(@"Creating the foodItem document failed! %@", op.error);
        return nil;
    }
    
    return myFoodItem;
    
   }


-(void) deleteFoodItemWithDishID:(int) theDishID foodItemObject:(FoodItem *)foodItem
{
    if (foodItem.dishID == 1) {
        RESTOperation *op = [foodItem deleteDocument];
        [op wait];
    }

}

@end
