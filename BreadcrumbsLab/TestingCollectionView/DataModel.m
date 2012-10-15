//
//  DataModel.m
//  BreadcrumbsLab
//
//  Created by Assane Gueye on 2012-10-08.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "DataModel.h"
#import "FoodItem.h"
#import "FoodCategory.h"
#import <CouchCocoa/CouchCocoa.h>
#import <Couchbase/CouchbaseMobile.h>

// Remote database to sync with:
#define RemoteServerSyncURL @"http://breadcrumd.iriscouch.com/dish_database"

@interface DataModel()

    @property(nonatomic, strong, readwrite) NSMutableArray * dishCategoryList;
    @property(nonatomic, strong, readwrite) NSMutableDictionary * foodItemlist;
    @property(nonatomic, strong, readwrite) NSMutableArray * fooditemArray;
    @property (nonatomic, strong) CouchDatabase * database;

    -(void)startSync;
@end


@implementation DataModel
{
    CouchPersistentReplication* _pull;
    CouchPersistentReplication* _push;

}


/** set the database
    After we call this method, we need to reload the collection view data [self.collectionView reloadData] 
*/
-(void)setDatabasewithCouchDB: (CouchDatabase *)aDatabase
{
    _database = aDatabase;
    
    [self startSync];

    NSLog(@"---------------------------------------------------------------------------------");

    CouchQuery* query = [self.database getAllDocuments] ;
    for (CouchQueryRow* row in [query rows])
    {
        FoodItem* foodItem = [FoodItem modelForDocument:row.document];
        // show me the dish name
        NSLog(@"foodItem ID: %d", foodItem.dishID);
        NSLog(@"foodItem name: %@", foodItem.dishName);
       
        // Deleting the item
  /*      RESTOperation *op = [foodItem deleteDocument];
       [op wait];
   */
        // Set the list of food item in an array
        [self.fooditemArray addObject: foodItem];
        
    }
    NSLog(@"---------------------------------------------------------------------------------");
    
}

-(id)objectForKeyedSubscript:(id)key
{
    return self.foodItemlist[key];
}

-(id)objectInFooditemArrayAtIndex:(NSUInteger)index
{
    return self.fooditemArray[index];
}

- (void)startSync
{
    NSURL* remoteSyncURL = [NSURL URLWithString: RemoteServerSyncURL];
    
    
    NSLog(@"Pushing from touchdb to server");
 //   NSArray* repls = [_database replicateWithURL: remoteSyncURL exclusively: YES];
    
  //  CouchReplication* push = [self.database pushToDatabaseAtURL: remoteSyncURL];
  //  CouchReplication* pull = [self.database pullFromDatabaseAtURL: remoteSyncURL];
/*
    _pull = [repls objectAtIndex:0];
    _push = [repls objectAtIndex:1];
    
    [_pull addObserver: self forKeyPath: @"completed" options: 0 context: NULL];
    [_push addObserver: self forKeyPath: @"completed" options: 0 context: NULL];
*/
}




@end
