//
//  SortVC.m
//  learningTest
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SortVC.h"

@interface SortVC ()

@end

@implementation SortVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self selectSort];
    [self bubbleSort];
}
#pragma mark ----------- 选择排序
-(void)selectSort{
    /**
     每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。
     */
    int nums[10]={100,34,288,1,199,199,288,0,10,3};
    int lenth = sizeof(nums) / sizeof(nums[0]);
//    int len1 = sizeof(nums);//40
//    int len2 = sizeof(nums[0]);//4
    
//   第一次 获取i=0 第一个最大值 第二次 i=1...
    for (int i = 0; i < lenth-1; i++) {
        for (int j = i+1; j < lenth; j++) {
            if (nums[i]<nums[j]) {
                int temp = nums[i];//降序 此时temp是小值 与后一个对调顺序
                nums[i] = nums[j];
                nums[j] = temp;
            }
        }
        
        printf("第%i比较后 \n",i+1);
        for (int m = 0; m<lenth; m++) {
            printf("%i    ",nums[m]);
        }
        
        printf("\n\n");
    }
    
    printf("排序结果为：\n");
    for (int i = 0; i<lenth; i++) {
        printf("%i   ",nums[i]);
    }
    printf("\n\n");
}
#pragma mark ----------- 冒泡排序
-(void)bubbleSort{
    /**
     它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来
     */
    int nums[4]={100,34,288,1};
    int lenth = sizeof(nums) / sizeof(nums[0]);
//    int len1 = sizeof(nums);//16
//    int len2 = sizeof(nums[0]);//4
    for (int i=0; i < lenth-1; i++) {
        for (int j = 0; j < lenth - 1 - i; j++) {
            // printf("%i----%i\n",j,j+1);
            if (nums[j] > nums[j+1]) {
                int temp = nums[j];
                nums[j] = nums[j+1];
                nums[j+1] = temp;
            }
        }
        printf("第%i次排序后：",i+1);
//        第1次排序后：34  100  1  288   i=0-->升序 获取到了1个最大值放在最后
//        第2次排序后：34  1  100  288   i=0-->升序 获取到了2个最大值放在最后
//        第3次排序后：1  34  100  288   i=0-->升序 获取到了3个最大值放在最后
        for (int i = 0; i<lenth; i++) {
            printf("%i  ",nums[i]);
        }
        printf("\n");
    }
    
    printf("最终的排序结果\n\n");
    for (int i = 0; i<lenth; i++) {
        printf("%i  ",nums[i]);
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
