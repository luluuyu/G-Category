//
//  CSFileTool.m
//  ChineseSkillNew
//
//  Created by CS on 15/5/11.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import "CSFileTool.h"
#import "UIImage+UIImage_G.h"
#import "CSFilePath.h"
#import "NSString+G.h"
#import "CKSingleton.h"

@implementation CSFileTool
SYNTHESIZE_SINGLETON_FOR_CLASS(CSFileTool)

+ (id)objectForKeyInUserDefaults:(NSString *)key
{
    if (key)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        return [defaults objectForKey:key];
    }
    return nil;
}

+ (BOOL)boolForKey:(NSString *)key
{
    BOOL rect = false;
    if (key.length)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        rect = [defaults boolForKey:key];
    }
    return rect;
}

+ (void)saveToUserDefaultsWithKey:(NSString *)key andBOOL:(BOOL)Bool
{
    if (key.length)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:Bool forKey:key];
        [defaults synchronize];
    }
}


+ (void)saveToUserDefaultsWithKey:(NSString *)key andObject:(id)obj
{
    if (key.length && obj)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:obj forKey:key];
        [defaults synchronize];
    }
}

+ (void)deleteUserDefaultsForKey:(NSString *)key
{
    if (key && key.length)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults removeObjectForKey:key];
    }
}

+ (void)checkToCreateDirectoryAtPath:(NSString *)path
{
    BOOL isDir = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir])
    {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark
#pragma mark - LessonForm保存图片至沙盒
+ (void)checkFolderAtDefaultPathAvailable:(NSString *)folderName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDir     = [CSFilePath appMP3DirectoryPath];
    NSString *Image            = [documentsDir stringByAppendingString:folderName];
    
    BOOL isDir = YES;
    
    if (![fileManager fileExistsAtPath:Image isDirectory:&isDir])
    {
        [fileManager createDirectoryAtPath:Image withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

+ (void)renameFile:(NSString *)path originName:(NSString *)name newName:(NSString *)newName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *newPath = [path stringByReplacingOccurrencesOfString:name withString:newName];
    if ([fm fileExistsAtPath:path])
    {
        [fm linkItemAtPath:path toPath:newPath error:nil];
    }
}

+ (void)copyFile:(NSString *)path originName:(NSString *)name newName:(NSString *)newName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *newPath = [path stringByReplacingOccurrencesOfString:name withString:newName];
    if ([fm fileExistsAtPath:path])
    {
        [fm copyItemAtPath:path toPath:newPath error:nil];
    }
}

+ (void)saveFileToPath:(NSString *)path File:(id)file;
{
    [file writeToFile:path options:NSDataWritingAtomic error:nil];
}

+ (void)deleteFileAtPath:(NSString *)path
{
    if (path.length)
    {
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm removeItemAtPath:path error:nil];
    }
}

+ (BOOL)isFileExist:(NSString*)filepath
{
    BOOL ret = false;
    
    if(filepath && filepath.length>0)
    {
        ret = [[NSFileManager defaultManager] fileExistsAtPath:filepath];
    }
    
    return ret;
}

@end
