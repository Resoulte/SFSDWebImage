//
//  ViewController.m
//  SFSDWebImage
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+SFSDWebImage.h"

@interface ViewController ()
/**
 *  拿到storyboard里面的UIImageView
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

@end
static NSString *urlStr = @"http://img5.imgtn.bdimg.com/it/u=3063552411,3030228420&fm=206&gp=0.jpg";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 异步加载图片
//    [self downloadImage];
    
    // 异步加载图片，监听下载进度是否成功与失败
    [self downloadImageWithProgress];
    
    
}

/**
 *  异步加载图片
 */
- (void)downloadImage {
    
    [self.iconImageV downloadImage:urlStr placeholder:@"placeholder"];
    
}

/**
 *  异步加载图片，监听下载进度是否成功与失败
 */
- (void)downloadImageWithProgress {

    [self.iconImageV downloadImage:urlStr placeholder:@"placeholder" success:^(UIImage *image) {
        NSLog(@"%@", image);
    } failed:^(NSError *error) {
        NSLog(@"%@", error);
    } progress:^(CGFloat progress) {
        NSLog(@"%@", @(progress));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
