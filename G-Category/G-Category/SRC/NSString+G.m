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

#import "NSString+G.h"

@implementation NSString (G) 

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

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

- (CGSize)sizeOfString:(NSString *)string
{
    CGSize contSize;
    if (IS_iOS7orLater) {
        CGSize textMaxSize = CGSizeMake(GLabelMaxWidth, MAXFLOAT);
        contSize = [string sizeWithFont:GLabelTextSize maxSize:textMaxSize];
    }else{
        CGSize textMaxSize = CGSizeMake(GLabelMaxWidth, MAXFLOAT);
        contSize = [string sizeWithFont:GLabelTextSize constrainedToSize:textMaxSize lineBreakMode:0];
    }
    return contSize;
}

- (CGFloat)heightOfLabelWithLabelWidth:(CGFloat)width labelFontSize:(CGFloat)size labelString:(NSString *)string maxHeight:(CGFloat)maxheight;
{
    CGSize contSize;
    CGSize textMaxSize = CGSizeMake(width, maxheight);
    contSize = [string sizeWithFont:[UIFont systemFontOfSize:size] maxSize:textMaxSize];
    
    if (contSize.height > maxheight)
    {
        return maxheight;
    }
    
    return contSize.height;
}

- (CGFloat)widthOfLabelWithLabelHeight:(CGFloat)height labelFontSize:(CGFloat)size labelString:(NSString *)string maxWidth:(CGFloat)maxWidth
{
    CGSize contSize;
    CGSize textMaxSize = CGSizeMake(maxWidth, height);
    contSize = [string sizeWithFont:[UIFont systemFontOfSize:size] maxSize:textMaxSize];
    
    if (contSize.height > maxWidth)
    {
        return maxWidth;
    }
    
    return contSize.width;
}

- (CGFloat)heightOfLabelWithLabel:(UILabel *)label LabelWidth:(CGFloat)width maxHeight:(CGFloat)maxheight
{
    CGSize contSize;
    CGSize textMaxSize = CGSizeMake(width, maxheight);
    contSize = [label.text sizeWithFont:[label font] maxSize:textMaxSize];
    
    if (contSize.height > maxheight)
    {
        return maxheight;
    }
    
    return contSize.height;
}

+ (CGFloat)heightOfLabelWithLabel:(UILabel *)label Text:(NSString *)text maxHeight:(CGFloat)maxheight
{
    CGSize contSize;
    CGSize textMaxSize = CGSizeMake(label.frame.size.width, maxheight);
    contSize = [text sizeWithFont:[label font] maxSize:textMaxSize];
    
    if (contSize.height > maxheight)
    {
        return maxheight;
    }
    
    return contSize.height;
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

@end
