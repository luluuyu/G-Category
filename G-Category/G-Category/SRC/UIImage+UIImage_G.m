//
//  UIImage+UIImage_G.m
//
//  Created by AlfieL on 14-5-5.
//  Copyright (c) 2014年 cubeTC. All rights reserved.
//

#import "UIImage+UIImage_G.h"
#import "objc/runtime.h"

@implementation UIImage (G)

+ (UIImage *)resizeImageWithImageName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5  topCapHeight:image.size.height * 0.5];
}

+ (UIImage *)resizeImageWithImageName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage*)imageWithColor:(UIImage*)image COLOR:(UIColor *)color
{
    UIImage* ret = image;
    
    if(ret)
    {
        CGRect rect = CGRectMake(0, 0, ret.size.width, ret.size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, ret.scale);
        CGContextRef c = UIGraphicsGetCurrentContext();
        [ret drawInRect:rect];
        CGContextSetFillColorWithColor(c, [color CGColor]);
        CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
        CGContextFillRect(c, rect);
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        ret = result;
    }
    
    return ret;
}

+ (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color
{
    UIImage* ret = [UIImage imageNamed:name];
    
    if(ret)
    {
        CGRect rect = CGRectMake(0, 0, ret.size.width, ret.size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, ret.scale);
        CGContextRef c = UIGraphicsGetCurrentContext();
        [ret drawInRect:rect];
        CGContextSetFillColorWithColor(c, [color CGColor]);
        CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
        CGContextFillRect(c, rect);
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        ret = result;
    }
    
    return ret;
}

- (UIImage *)changeImageColor:(UIColor *)color
{
    if (color)
    {
        return [UIImage imageWithColor:self COLOR:color];
    }
    
    return nil;
}

+ (UIImage *)resizeImageWithImageName:(NSString *)name left:(CGFloat)left top:(CGFloat)top changeColor:(UIColor *)color
{
    UIImage *resizeImage;
    if (name)
    {
        resizeImage = [UIImage resizeImageWithImageName:name left:left top:top];
        if (resizeImage)
        {
            resizeImage = [UIImage imageWithColor:resizeImage COLOR:color];
        }
    }
    return resizeImage;
}

- (UIImage *)resizeImageleft:(CGFloat)left top:(CGFloat)top
{
    return [self stretchableImageWithLeftCapWidth:self.size.width * left topCapHeight:self.size.height * top];
}

+ (NSData *)imageDataWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.8);
}

+ (UIImage *)resizeImageWithImage:(UIImage *)image scale:(float)scale
{
    CGSize newSize = CGSizeMake(image.size.width * scale, image.size.height * scale);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (UIImage *)resizeImageWithNewSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio < 1 && horizontalRadio<1)
    {
        radio = verticalRadio < horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
