//
//  CLLAppMix.h
//  CLLAppMix
//
//  Created by 陈立龙 on 2018/9/4.
//  Copyright © 2018年 leocll. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLLAppMix : NSObject
/**工程路径*/
@property (nonatomic, strong) NSString *projPath;
/**新工程名字*/
@property (nonatomic, strong, nullable) NSString *projName_new;
/**老工程名字*/
@property (nonatomic, strong, readonly, nullable) NSString *projName_old;
/**源代码路径*/
@property (nonatomic, strong, readonly, nullable) NSString *sourceCodePath;
/**
 混淆

 @param block 完成的回调
 */
- (void)mixWithComplete:(void(^ _Nullable)(BOOL complete,NSString *error))block;
@end
NS_ASSUME_NONNULL_END

