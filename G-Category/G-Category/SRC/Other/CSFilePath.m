
//
//  CSFilePath.m
//  ChineseSkillNew
//
//  Created by CS on 15/5/21.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import "CSFilePath.h"
#import "CKSingleton.h"

@interface CSFilePath ()

@property (nonatomic, copy) NSString *cachesPath;
@property (nonatomic, copy) NSString *appLibraryPrivateDocuments;
@property (nonatomic, copy) NSString *appHomeDirectoryPath;

@end

@implementation CSFilePath
SYNTHESIZE_SINGLETON_FOR_CLASS(CSFilePath)

+ (NSString *)appHomeDirectoryPath
{
    return [[CSFilePath sharedCSFilePath] appHomeDirectoryPath];
}

+ (NSString *)appLibraryPrivateDocuments
{
    return [[CSFilePath sharedCSFilePath] appLibraryPrivateDocuments];
}

+ (NSString *)cachesPath
{
    return [[CSFilePath sharedCSFilePath] cachesPath];
}

+ (BOOL)checkFileDirectoryAndCreateItsDirectoryIfNotExist:(NSString*)filePath
{
    BOOL ret = FALSE;
    if(filePath)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        ret = [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return ret;
}

#pragma mark
#pragma mark getters
- (NSString *)appLibraryPrivateDocuments
{
    if (_appLibraryPrivateDocuments == nil)
    {
        _appLibraryPrivateDocuments = [NSString stringWithFormat:@"%@/Library/Private Documents/",NSHomeDirectory()];
        [CSFilePath checkFileDirectoryAndCreateItsDirectoryIfNotExist:_appLibraryPrivateDocuments];
    }
    return _appLibraryPrivateDocuments;
}

- (NSString *)appHomeDirectoryPath
{
    if (_appHomeDirectoryPath == nil)
    {
        _appHomeDirectoryPath = [NSString stringWithFormat:@"%@/",NSHomeDirectory()];
        [CSFilePath checkFileDirectoryAndCreateItsDirectoryIfNotExist:_appHomeDirectoryPath];
    }
    return _appHomeDirectoryPath;
}

- (NSString *)cachesPath
{
    if (_cachesPath == nil)
    {
        _cachesPath = [NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()];
        [CSFilePath checkFileDirectoryAndCreateItsDirectoryIfNotExist:_cachesPath];
    }
    return _cachesPath;
}

@end
