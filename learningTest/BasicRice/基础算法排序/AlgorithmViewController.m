//
//  AlgorithmViewController.m
//  learningTest
//
//  Created by Apple on 2019/1/25.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "AlgorithmViewController.h"

@interface AlgorithmViewController ()

@end

@implementation AlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self test];
}

#pragma mark ----------- 冒泡排序
-(void)BubbleSort{
//重复地走访过要排序的元素列，依次比较两个相邻的元素，如果他们的顺序（如从大到小、首字母从A到Z）错误就把他们交换过来。走访元素的工作是重复地进行直到没有相邻元素需要交换，也就是说该元素已经排序完成
    
    int nums[10] = {4, 5, 2, 10, 7, 1, 8, 3, 6, 9};
    int i, j, temp, isSorted;
    //优化算法：最多进行 n-1 轮比较
    for(i=0; i<10-1; i++){
        isSorted = 1; //假设剩下的元素已经排序好了
        for(j=0; j<10-1-i; j++){
            if(nums[j] > nums[j+1]){
                temp = nums[j];
                nums[j] = nums[j+1];
                nums[j+1] = temp;
                isSorted = 0; //一旦需要交换数组元素，就说明剩下的元素没有排序好
            }
        }
        if(isSorted) break; //如果没有发生交换，说明剩下的元素已经排序好了
    }
    for(i=0; i<10; i++){
        printf("%d ", nums[i]);
    }
    printf("\n");
    /**
     i==0
     j=0   4, 5, 2, 10, 7, 1, 8, 3, 6, 9
     j=1   4, 2, 5, 10, 7, 1, 8, 3, 6, 9
     j=2   4, 2, 5, 10, 7, 1, 8, 3, 6, 9
     j=3   4, 2, 5, 7, 10, 1, 8, 3, 6, 9
     j=4   4, 2, 5, 7, 1, 10, 8, 3, 6, 9
     j=5   4, 2, 5, 7, 1, 8, 10, 3, 6, 9
     j=6   4, 2, 5, 7, 1, 8, 3, 10, 6, 9
     j=7   4, 2, 5, 7, 1, 8, 3, 6, 10, 9
     j=8   4, 2, 5, 7, 1, 8, 3, 6, 9, 10    第一遍获取到最大值  10
     
     i==1
     j=0   2, 4, 5, 7, 1, 8, 3, 6, 9, 10
     j=1   2, 4, 5, 7, 1, 8, 3, 6, 9, 10
     j=2   2, 4, 5, 7, 1, 8, 3, 6, 9, 10
     j=3   2, 4, 5, 1, 7, 8, 3, 6, 9, 10
     j=4   2, 4, 5, 1, 7, 8, 3, 6, 9, 10
     j=5   2, 4, 5, 1, 7, 8, 3, 6, 9, 10
     j=6   2, 4, 5, 1, 7, 3, 8, 6, 9, 10
     j=7   2, 4, 5, 1, 7, 3, 6, 8, 9, 10   第二遍获取到次最大值   9
     ······
     */
    
    
}
#pragma mark -----------  选择排序
-(void)seleSort{
//    给定一个数组，这种思想首先假定数组的首元素为最大或者最小的。此时就要利用3个变量表示元素的下标。一个表示当前，一个表示找到的最大或者最小的下标，一个用于存放每次循环中最大值的下标。在掌握了程序的基本思想之后，再进行排序。找到最大的下标后赋给每次除非的那个最大的下标。找到之后判断所假设的当前值是否为此次循环的最大值，如果不是，就交换最大 与当前的值，从而将数组以一定的顺序排放，最后写一个循环将结果输出
    
    int a[10] = {4, 5, 2, 10, 7, 1, 8, 3, 6, 9};
    int i,j,w;
    for(i=0;i<10;i++)
    {
        for(j=i+1;j<10;j++)
            if(a[i]<a[j])//进行比较
                //比较后进行交换
            {
                w=a[i];//小值
                
                a[i]=a[j];
                a[j]=w;//对换 小值在后 降序
            }
    }
    printf("排序后:\n");
    for(i=0;i<10;i++)
        printf("%4d",a[i]);
    /**
     i==0
     j==0
     */
    
}
#pragma mark -----------  面试题
-(void)test{
//    1、不用中间变量,用两种方法交换A和B的值
    int a = 10;  int b = 12;

//    1.1使用中间变量
    int temp = b;// a-10 b-12 temp-12
    b = a;//a-10 b-10 temp-12
    a = temp;//a-12  b-10 temp-12

//    1.2使用加法
    a = a+b;//a-22 b-12
    b = a-b;//a-22 b-10
    a = a-b;//a-12 b-10
    
//    1.3 使用亦或
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
    
    
}

@end
