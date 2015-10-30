//
//  CSFileTool.h
//  ChineseSkillNew
//
//  Created by CS on 15/5/11.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface CSFileTool : NSObject

@property (nonatomic,strong) NSDictionary *all_CS_LessonDict;

+ (instancetype)sharedCSFileTool;
- (NSString *)lessonNameForLessonId:(NSString *)lessonId;

+ (id)objectForKeyInUserDefaults:(NSString *)key;
+ (void)saveToUserDefaultsWithKey:(NSString *)key andObject:(id)obj;

+ (void)saveToUserDefaultsWithKey:(NSString *)key andBOOL:(BOOL)Bool;
+ (BOOL)boolForKey:(NSString *)key;

+ (void)renameFile:(NSString *)path originName:(NSString *)name newName:(NSString *)newName;
+ (void)deleteUserDefaultsForKey:(NSString *)key;
+ (void)deleteFileAtPath:(NSString *)path;
+ (BOOL)isFileExist:(NSString*)filepath;

+ (void)checkToCreateDirectoryAtPath:(NSString *)path;

@end
