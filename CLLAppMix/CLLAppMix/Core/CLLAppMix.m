//
//  CLLAppMix.m
//  CLLAppMix
//
//  Created by 陈立龙 on 2018/9/4.
//  Copyright © 2018年 leocll. All rights reserved.
//

#import "CLLAppMix.h"
#import "CLLAppMixFunc.h"

#ifndef CLLExecBlock
#define CLLExecBlock(block, ...) {if(block){block(__VA_ARGS__);}}
#endif

@interface CLLAppMix ()
/**老工程名字*/
@property (nonatomic, strong) NSString *projName_old;
/**源代码路径*/
@property (nonatomic, strong) NSString *sourceCodePath;
@end

@implementation CLLAppMix

#pragma mark - setter && getter
- (void)setProjPath:(NSString *)projPath {
    _projPath = projPath;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray <NSString *>*files = [fm contentsOfDirectoryAtPath:self.projPath error:nil];
    for (NSString *file in files) {
        if ([file hasSuffix:@"xcodeproj"]) {
            _projName_old = [file stringByDeletingPathExtension];
            _sourceCodePath = [projPath stringByAppendingPathComponent:_projName_old];
            setSourceCodePath(_sourceCodePath);
            break;
        }
    }
}

#pragma mark - 混淆
- (void)mixWithComplete:(void (^)(BOOL, NSString *))block {
    // 工程路径
    if (!self.projPath.length) {
        CLLExecBlock(block,NO,@"工程路径为空");
        return;
    }
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDire = NO;
    if (!([fm fileExistsAtPath:self.projPath isDirectory:&isDire] && isDire)) {
        CLLExecBlock(block,NO,@"工程路径不存在或不是一个文件夹");
        return;
    }
    // 工程名字
    if (self.projName_new.length && self.projName_old.length) {
        modifyProjectName(self.projPath, self.projName_old, self.projName_new);
    }
}

@end
