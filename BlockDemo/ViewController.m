//
//  ViewController.m
//  BlockDemo
//
//  Created by zjf on 16/8/3.
//  Copyright © 2016年 ctfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /***************** 1 __block关键字的使用******************/
    
    //int x = 100; //Error: 在block的{}内不可以对外面的变量进行更改。需要对该外部变量前边加上__block关键字
    __block int x = 100;
    void (^sumXAndYBlock)(int) = ^(int y) {
        x = x + y;
        printf("new x value is :%d", x);
    };
    //调用block
    sumXAndYBlock(50);

    //这样情况是可以的:因为我们只对截获的数组变量进行了操作或者使用，而没有进行赋值修改。
    NSMutableArray *array = [[NSMutableArray alloc]init];
    void (^blo)() = ^{
        [array addObject:@"Obj"];
    };
    //另外要注意：Block中不可以对C语言数组进行操作

/***************** 2 block的定义******************/
    
    //定义1：无参无返回值的block
    void(^printBlock1)() = ^() {
        printf("no number");
    };
    //使用
    printBlock1();
    
    //定义2：有参无返回值的block
    void (^printBlock2)(int) = ^(int num) {
        printf("int number is %d", num);
    };
    //使用
    printBlock2(50);
    
    //定义3：有参有返回值的block
    int (^printBlock3)(int) = ^(int num) {
        return num;
    };
    //使用
    printf("block3=%d", printBlock3(100));
    
    // ?
    ^ NSString * (NSString *a, NSString *b) {
        return a;
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
