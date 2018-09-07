//
//  ViewController.m
//  CLLAppMix
//
//  Created by 陈立龙 on 2018/9/4.
//  Copyright © 2018年 leocll. All rights reserved.
//

#import "ViewController.h"
#import "CLLAppMix.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CLLAppMix *mix = [[CLLAppMix alloc] init];
    mix.projPath = @"/Users/chenlilong/Desktop/项目/Dating";
    mix.projName_new = @"Dating_test";
    [mix mixWithComplete:^(BOOL complete, NSString *error) {
        
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
