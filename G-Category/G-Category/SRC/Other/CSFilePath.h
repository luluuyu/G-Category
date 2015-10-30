//
//  CSFilePath.h
//  ChineseSkillNew
//
//  Created by CS on 15/5/21.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSFilePath : NSObject


+ (CSFilePath *)sharedCSFilePath;

+ (NSString *)appHomeDirectoryPath;
+ (NSString *)appMP3DirectoryPath;
+ (NSString *)cachesPath;

+ (UIImage *)chatImageWithImageName:(NSString *)imageName;

+ (BOOL)checkFileDirectoryAndCreateItsDirectoryIfNotExist:(NSString*)filePath;

@end
