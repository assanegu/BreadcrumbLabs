//
//  DataModel.h
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-08.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CouchDatabase;

@interface DataModel : NSObject

@property(nonatomic, strong, readonly) NSMutableArray * dishCategoryList;
@property(nonatomic, strong, readonly) NSMutableArray * fooditemArray;
@property(nonatomic, strong, readonly) NSMutableDictionary * foodItemlist;


-(id)objectForKeyedSubscript:(id)key;
-(id)objectInFooditemArrayAtIndex:(NSUInteger)index;

-(void)setDatabasewithCouchDB: (CouchDatabase *)aDatabase;

@end
