//
//  DBManager.m
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/11.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "DBManager.h"

NSString *const kDatabaseName = @"ApplicationTemp.db";

@interface DBManager(PrivateMethods)
-(void)runMigrations;
-(NSUInteger)databaseVersion;
-(void)setDatabaseVersion:(NSUInteger)newVersionNumber;
-(void)createApplicationPropertiesTable;

@end

@implementation DBManager

-(id)initWithMigrations {
    self = [self initWithMigrations:NO];
    if (!self) { return nil; }
    
    return self;
}

-(id)initWithMigrations:(BOOL)loggingEnabled {
    self = [super initWithFileName:kDatabaseName];
    if (!self) { return nil; }
    
    [self setLogging:loggingEnabled];
    [self runMigrations];
    [MojoModel setDatabase:self];
    
    return self;
}

-(void)runMigrations {
    [self beginTransaction];
    
    // Turn on Foreign Key support
    [self executeSql:@"PRAGMA foreign_keys = ON"];
    
    NSArray *tableNames = [self tableNames];
    
    if (![tableNames containsObject:@"ApplicationProperties"]) {
        [self createApplicationPropertiesTable];
    }
    
//    if (![tableNames containsObject:@"ZCYAccount"]) {
//        [self createZCYAccountTable];
//    }
    
//    if ([self databaseVersion] < 2) {
//        // Migrations for database version 1 will run here
//        [self setDatabaseVersion:2];
//    }
    
    
    [self commit];
}

#pragma mark - Migration Steps

- (void) createApplicationPropertiesTable {
    [self executeSql:@"create table ApplicationProperties (primaryKey integer primary key autoincrement, name text, value integer)"];
    [self executeSql:@"insert into ApplicationProperties (name, value) values('databaseVersion', 1)"];
}

//- (void)createZCYAccountTable{
//    [self executeSql:@"create table ZCYAccount (primaryKey integer primary key autoincrement, userId txt, phoneNum text,pwd text, nickName text, realName txt,email text,sex text,birth text,wedding txt,urgenMan txt,urgenPhone txt,educationLevel txt,school txt,imageUrl txt,isLogin integer,score txt,scoreGrade txt,statCheck txt,picfront txt,picside txt,certification txt,qq txt,weixin txt,classType txt,gradeclass txt)"];
//    
//}

#pragma mark - Convenience Methods

-(void)updateApplicationProperty:(NSString *)propertyName value:(id)value {
    [self executeSqlWithParameters:@"UPDATE ApplicationProperties SET value = ? WHERE name = ?", value, propertyName, nil];
}

-(id)getApplicationProperty:(NSString *)propertyName {
    NSArray *rows = [self executeSqlWithParameters:@"SELECT value FROM ApplicationProperties WHERE name = ?", propertyName, nil];
    
    if ([rows count] == 0) {
        return nil;
    }
    
    id object = [[rows lastObject] objectForKey:@"value"];
    if ([object isKindOfClass:[NSString class]]) {
        object = [NSNumber numberWithInteger:[(NSString *)object integerValue]];
    }
    return object;
}

-(void)setDatabaseVersion:(NSUInteger)newVersionNumber {
    return [self updateApplicationProperty:@"databaseVersion" value:[NSNumber numberWithUnsignedInteger:newVersionNumber]];
}

-(NSUInteger)databaseVersion {
    return [[self getApplicationProperty:@"databaseVersion"] unsignedIntegerValue];
}


@end
