//
//  DBManager.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/11.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "MojoDatabase.h"
#import "MojoModel.h"

@interface DBManager : MojoDatabase
-(id)initWithMigrations;
-(id)initWithMigrations:(BOOL)loggingEnabled;

@end
