//
//  WQKeyChain.m
//  OTOTeacher
//
//  Created by CS on 15/9/9.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//
#import "CSKeyChain.h"
#import <Security/Security.h>
@implementation CSKeyChain
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            
            service, (__bridge_transfer id)kSecAttrService,
            
            service, (__bridge_transfer id)kSecAttrAccount,
            
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            
            nil];
    
}
+ (void)save:(NSString *)service data:(id)data {
    
    //Get search dictionary
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    //Delete old item before add new item
    
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    
    //Add new object to search dictionary(Attention:the data format)
    
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    
    //Add item to keychain with the search dictionary
    
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
    
}
+ (id)load:(NSString *)service {
    
    id ret = nil;
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    //Configure the search setting
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        
        @try {
            
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
            
        } @catch (NSException *e) {
            
            NSLog(@"Unarchive of %@ failed: %@", service, e);
            
        } @finally {
            
        }
        
    }
    
    return ret;
    
}

+ (void)delete:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

@end

@implementation CSUserDataManagerWithKeyChain
// key_user_define
NSString *const KEY_IN_KEYCHAIN_PWD = @"com.OTOChineseskillTeacher.app.info.password";
NSString *const KEY_IN_KEYCHAIN_SYNCTIME = @"com.OTOChineseskillTeacher.app.info.synctime";

static NSString * const KEY_IN_KEYCHAIN = @"com.OTOChineseskillTeacher.app.info";
static NSString * const KEY_ITEM_IN_KEYCHAIN = @"com.OTOChineseskillTeacher.app";

+(void)saveData:(NSString *)string Forkey:(NSString *)key
{
    NSString *k = [NSString stringWithFormat:@"%@.%@",KEY_ITEM_IN_KEYCHAIN,key];
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:string forKey:k];
    [CSKeyChain save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
}

+(id)dataForKey:(NSString *)key
{
    NSString *k = [NSString stringWithFormat:@"%@.%@",KEY_ITEM_IN_KEYCHAIN,key];
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[CSKeyChain load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPair objectForKey:k];
}

//+(void)deleteDataForKey:(NSString *)key
//{
//    NSString *k = [NSString stringWithFormat:@"%@.%@",KEY_ITEM_IN_KEYCHAIN,key];
//    [CSKeyChain delete:k];
//}

@end
