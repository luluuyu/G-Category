//
//  WQKeyChain.h
//  OTOTeacher
//
//  Created by CS on 15/9/9.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface CSKeyChain :NSObject



@end

@interface CSUserDataManagerWithKeyChain : NSObject
extern NSString *const KEY_IN_KEYCHAIN_PWD;
extern NSString *const KEY_IN_KEYCHAIN_SYNCTIME;
/**
 *    @brief    存储密码
 *
 *    @param     password     密码内容
 */
+(void)saveData:(NSString *)string Forkey:(NSString *)key;

/**
 *    @brief    读取密码
 *
 *    @return    密码内容
 */
+(id)dataForKey:(NSString *)key;

/**
 *    @brief    删除密码数据
 */
//+(void)deleteDataForKey:(NSString *)key;

@end
