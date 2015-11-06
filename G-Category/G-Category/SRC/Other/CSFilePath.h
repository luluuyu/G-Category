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
+ (NSString *)appLibraryPrivateDocuments;
+ (NSString *)cachesPath;

+ (BOOL)checkFileDirectoryAndCreateItsDirectoryIfNotExist:(NSString*)filePath;

@end
