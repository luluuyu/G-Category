//
//  NSString+G.m
//  ChineseSkillNew
//
//  Created by cslop on 14/12/30.
//  Copyright (c) 2014年 ChineseSkill. All rights reserved.
//
#define GLabelTextSize          [UIFont systemFontOfSize:16]
#define GLabelFontSize           16
#define GLabelMaxWidth           300        // label 最大的宽度
#define IS_iOS8OrLater ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define IS_iOS7orLater ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define IS_iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] < 8.0)

#import "NSString+G.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (G)

+ (NSString *)URLEncodedString:(NSString *)string
{
    return [string URLEncodedString];
}
+ (NSString *)URLDecodedString:(NSString *)string
{
    return [string URLDecodedString];
}

- (CGSize)sizeOfStringWithStringFontSize:(CGFloat)fontSize boundingRectWithWidth:(CGFloat)width height:(CGFloat)height
{
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [self.description boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil].size;
    return size;
}

+ (CGSize)sizeOfStringWithString:(NSString *)string FontSize:(CGFloat)fontSize boundingRectWithWidth:(CGFloat)width height:(CGFloat)height
{
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil].size;
    return size;
}

- (BOOL)containsWithString:(NSString *)aString
{
    if (IS_iOS7)
    {
        BOOL ret = false;
        if ([self rangeOfString:aString].length > 0)
        {
            ret = true;
        }
        return ret;
    }
    else
    {
        return [self containsString:aString];
    }
}

+ (NSString *)NG_StringValue:(int)value
{
    return [NSString stringWithFormat:@"%d",value];
}

+ (NSString *)jsonStringWithString:(NSString *)string
{
    return [NSString stringWithFormat:@"\"%@\"",
            [string stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+ (NSString *)jsonStringWithArray:(NSArray *)array
{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary
{
    NSString *rect = nil;
    
    if (dictionary && dictionary.count)
    {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
        if (jsonData && jsonData.length)
        {
            rect = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }
    
    return rect;
}

+ (NSString *)jsonStringWithObject:(id)object
{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}

- (NSDictionary *)dictionaryType
{
    NSDictionary *dict;
    if (self.length)
    {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        if (data.length)
        {
            dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            return dict;
        }
    }
    return dict;
}

+ (NSString *)deviceUIDString
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *deviceUID = [[NSString alloc] initWithString:[[device identifierForVendor] UUIDString]];
    if ([deviceUID length] == 0)
    {
        CFUUIDRef uuid = CFUUIDCreate(NULL);
        if (uuid)
        {
            deviceUID = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
            CFRelease(uuid);
        }
    }
    
    return deviceUID;
}

- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            CFSTR("!*'();:@&=+$,/?%#[] "),
                                            kCFStringEncodingUTF8));
    return result;
}

- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                            (CFStringRef)self,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8));
    return result;
}

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshorten-64-to-32"
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
#pragma clang diagnostic pop
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end

@implementation NSString (MySortAdditions)
- (NSComparisonResult)CompareMyStringASC:(NSString*)aString
{
    return [self compare:aString];
}
- (NSComparisonResult)CompareMyStringDESC:(NSString*)aString
{
    return [aString compare:self];
}
- (NSComparisonResult)CompareMyStringToIntASC:(NSString*)aString
{
    NSComparisonResult ret =  NSOrderedSame;
    if(self!=nil && self.length>0 && aString!=nil && aString.length>0)
    {
        int nFirst = [self intValue];
        int second = [aString intValue];
        
        if(nFirst==second) ret =   NSOrderedSame;
        if(nFirst<second) ret =  NSOrderedAscending;
        if(nFirst>second) ret =  NSOrderedDescending;
    }
    return ret;
}
- (NSComparisonResult)CompareMyStringToIntDESC:(NSString*)aString
{
    NSComparisonResult ret =  NSOrderedSame;
    if(self!=nil && self.length>0 && aString!=nil && aString.length>0)
    {
        int nFirst = [self intValue];
        int second = [aString intValue];
        
        if(nFirst==second) ret =   NSOrderedSame;
        if(nFirst>second) ret =  NSOrderedAscending;
        if(nFirst<second) ret =  NSOrderedDescending;
    }
    return ret;
}
@end
