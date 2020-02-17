//
//  ViewController.m
//  Demo
//
//  Created by 谢鑫 on 2020/2/16.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//盐，越长，越复杂越好，不能随便写，web,andord，服务器端这个盐都必须是一样的。
static NSString *salt=@"KJSDLF(U)(U@#)($P(DFS";
//发请求！
//哈希
//服务器如何验证收到的加密的密码
//1.服务器保存的密码， 使用同样的加密算法，对用户密码（123456）进行加密然后匹配（e10adc3949ba59abbe56e057f20f883e）
//2.第二种，服务器直接保存hash值，进行匹配。使用第二种。服务器不允许保存用户的密码。万一服务器数据库被黑。以前APP有找回密码，现在只有重置密码了。
//AES,RSA,都是加密过后进行解密的。不符合加密密码。
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // NSString *pwd=@"123456";
   
   // NSString *pwd=[@"123456" stringByAppendingString:salt]; //加盐
    //pwd=pwd.md5String;
    /*
     HMAC用一个密钥进行加密，并且做两次散列(MD5)
     实际开发中，密钥key是来自服务器的。每一个账号对应一个key值，在注册的时候随机生成的，开发者也不知道这个值。所以账号不能重复。
     服务器保存HMAC加密后保存的密码。
     服务器需要保存1.账号，2.key  3.HMAC
     key可以保存到本地沙盒，本地客户端保存key的时候按账号保存。更换手机后，本地没有key,向服务器要，（需要之前的手机授权，就是设备锁功能），给了之后再登陆。
     没有黑客对key感兴趣，拿key去碰撞出密码，成本太高，而且key是可以更换的
     key值可以更换，长期未登陆，需要重新登陆一下，当用户下一次登陆的时候，用旧的匹配登陆上，更换KEy,记录新的HMAC。删除APP后也是重新更换key
     
     */
    
    NSString *pwd=[@"123456" hmacMD5StringWithKey:@"hank"];//HMAC
    NSLog(@"现在的密码是：%@",pwd);
}

@end
