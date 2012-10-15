//
//  AppDelegate.h
//  TestingCollectionView
//
//  Created by Assane Gueye on 2012-09-18.
//  Copyright (c) 2012 Assane Gueye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Couchbase/CouchbaseMobile.h>
@class CouchDatabase;


@interface AppDelegate : UIResponder <UIApplicationDelegate, CouchbaseDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CouchDatabase *database;


@end
