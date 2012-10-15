//
//  AppDelegate.m
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-18.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import "AppDelegate.h"
#import "FoodItem.h"
#import "DataModel.h"
#import <CouchCocoa/CouchCocoa.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    CouchbaseMobile* cb = [[CouchbaseMobile alloc] init];
    cb.delegate = self;
    [cb start];
    NSAssert(!cb.error, @"Error launching Couchbase: %@", cb.error);
    
    return YES;
}

-(void)couchbaseMobile:(CouchbaseMobile*)couchbase didStart:(NSURL*)serverURL {    
    gCouchLogLevel = 1;
    gRESTLogLevel = kRESTLogRequestURLs;
    
    if (!_database)
    {
        // This is the first time the server has started:
        CouchServer *server = [[CouchServer alloc] initWithURL: serverURL];
        // Track active operations so we can wait for their completion in didEnterBackground, below
        server.tracksActiveOperations = YES;
        self.database = [server databaseNamed: @"dishdatabase"];
        
        RESTOperation* op = [_database create];
        if (![op wait] && op.httpStatus != 412)
        {
            // failed to contact the server or create the database
            // (a 412 status is OK; it just indicates the db already exists.)
            
            NSAssert(NO, @"CouchCocoa failed to connect: %@", op.error);
        }
/*
        FoodItem * test = [FoodItem initWithDatabase:_database
                                   dishID:6
                                 dishName:@"testing the chicken"
                          dishDescription:@"Comfort your tummy with this dreamy bake of chicken, cream of mushroom soup, cream of chicken soup, sour cream and tender egg noodles"
                                dishPrice:@"13.34"
                           dishIngredient:@"Chicken and rice"
                             dishCategory:@"Main dish"
                          dishSubCategory:@"Chicken"
                                 tagValue:0
                                  isSpicy:1
                               isLowInFat:1
                                isHealthy:1
                             containWheat:0];
*/  
        DataModel * myDataModel = [[DataModel alloc] init];
        [myDataModel setDatabasewithCouchDB:_database];

    }
  
    _database.tracksChanges = YES;


}

-(void)couchbaseMobile:(CouchbaseMobile*)couchbase failedToStart:(NSError*)error {
    NSAssert(NO, @"Couchbase failed to initialize: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
