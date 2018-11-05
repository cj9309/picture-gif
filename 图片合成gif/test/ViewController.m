//
//  ViewController.m
//  test
//
//  Created by apple on 2017/4/13.
//  Copyright © 2017年 Cola. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSMutableArray * images= [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"0"],[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"],[UIImage imageNamed:@"6"],[UIImage imageNamed:@"7"],[UIImage imageNamed:@"8"],[UIImage imageNamed:@"9"],[UIImage imageNamed:@"10"],[UIImage imageNamed:@"11"],[UIImage imageNamed:@"12"],[UIImage imageNamed:@"13"],[UIImage imageNamed:@"14"],[UIImage imageNamed:@"15"],[UIImage imageNamed:@"16"],[UIImage imageNamed:@"17"],[UIImage imageNamed:@"18"],[UIImage imageNamed:@"19"],[UIImage imageNamed:@"20"],[UIImage imageNamed:@"21"],[UIImage imageNamed:@"22"],[UIImage imageNamed:@"23"],[UIImage imageNamed:@"24"],[UIImage imageNamed:@"25"],[UIImage imageNamed:@"26"],[UIImage imageNamed:@"27"],[UIImage imageNamed:@"28"],[UIImage imageNamed:@"29"],[UIImage imageNamed:@"30"],[UIImage imageNamed:@"31"],[UIImage imageNamed:@"32"],[UIImage imageNamed:@"33"],[UIImage imageNamed:@"34"],[UIImage imageNamed:@"35"],[UIImage imageNamed:@"36"],[UIImage imageNamed:@"37"],[UIImage imageNamed:@"38"],[UIImage imageNamed:@"39"],[UIImage imageNamed:@"40"],[UIImage imageNamed:@"41"],[UIImage imageNamed:@"42"],[UIImage imageNamed:@"43"],[UIImage imageNamed:@"44"],[UIImage imageNamed:@"45"],[UIImage imageNamed:@"46"],[UIImage imageNamed:@"47"],[UIImage imageNamed:@"48"],[UIImage imageNamed:@"49"], nil];
    //创建gif文件
    NSArray *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucmentStr =[document objectAtIndex:0];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *textDic = [doucmentStr stringByAppendingString:@"/gif"];
    [filemanager createDirectoryAtPath:textDic withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *path = [textDic stringByAppendingString:@"test1.gif"];
    NSLog(@"-----%@",path);
    //配置gif属性
    CGImageDestinationRef destion;
    CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, kCFURLPOSIXPathStyle, false);
    destion = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, NULL);
    NSDictionary *frameDic = [NSDictionary dictionaryWithObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.3],(NSString*)kCGImagePropertyGIFDelayTime, nil] forKey:(NSString*)kCGImagePropertyGIFDelayTime];
    
    NSMutableDictionary *gifParmdict = [NSMutableDictionary dictionaryWithCapacity:2];
    [gifParmdict setObject:[NSNumber numberWithBool:YES] forKey:(NSString*)kCGImagePropertyGIFHasGlobalColorMap];
    [gifParmdict setObject:(NSString*)kCGImagePropertyColorModelRGB forKey:(NSString*)kCGImagePropertyColorModel];
    [gifParmdict setObject:[NSNumber numberWithInt:8] forKey:(NSString*)kCGImagePropertyDepth];
    [gifParmdict setObject:[NSNumber numberWithInt:0] forKey:(NSString*)kCGImagePropertyGIFLoopCount];
    NSDictionary *gifProperty = [NSDictionary dictionaryWithObject:gifParmdict forKey:(NSString*)kCGImagePropertyGIFDictionary];
    
    for (UIImage *dimage in images) {
        CGImageDestinationAddImage(destion, dimage.CGImage, (__bridge CFDictionaryRef)frameDic);
    }
    
    CGImageDestinationSetProperties(destion,(__bridge CFDictionaryRef)gifProperty);
    CGImageDestinationFinalize(destion);
    CFRelease(destion);

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
