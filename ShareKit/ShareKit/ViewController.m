//
//  ViewController.m
//  ShareKit
//
//  Created by gideon on 1/28/16.
//  Copyright © 2016 gideon. All rights reserved.
//

#import "ViewController.h"
#import "TencentOpenAPI/QQApiInterface.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareAction:(id)sender {
    [self share];
}

- (void)share
{
    NSString *title = @"天公作美伦敦奥运圣火点燃成功 火炬传递开启";
    NSString *tempText = @"腾讯体育讯 当地时间5月10日中午，阳光和全世界的目光聚焦于希腊最高女祭司手中的火炬上，5秒钟内世界屏住呼吸。火焰骤然升腾的瞬间，古老的号角声随之从赫拉神庙传出——第30届伦敦夏季奥运会圣火在古奥林匹亚遗址点燃。取火仪式前，国际奥委会主席罗格、希腊奥委会主席卡普拉洛斯和伦敦奥组委主席塞巴斯蒂安-科互赠礼物，男祭司继北京奥运会后，再度出现在采火仪式中。";
    
    NSURL *previewURL = [NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"];
    NSURL* url = [NSURL URLWithString:@"http://sports.qq.com/a/20120510/000650.htm"];
    
    QQApiNewsObject* imgObj = [QQApiNewsObject objectWithURL:url title:title description:tempText previewImageURL:previewURL];
    [imgObj setTitle:title];
    [imgObj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    
    SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:imgObj];
    
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
}

@end
