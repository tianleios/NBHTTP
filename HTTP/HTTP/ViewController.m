//
//  ViewController.m
//  HTTP
//
//  Created by  tianlei on 2017/7/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "ViewController.h"
#import "NBNetwork.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTf;

@end


@implementation ViewController {

    //关键字无用
//    @private  NSString *privateStr;
//    @protected  NSString *protectedStr;
//    @public  NSString *publicStr;
//    @package NSString *packageStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //所有字段取出
    
    
    
    self.urlTf.text = @"http://localhost:8080/session";
    
    //expiresDate 为空时，为session-only Cookie
    NSHTTPCookie *testCookie = [NSHTTPCookie cookieWithProperties:@{
                                                                    NSHTTPCookieDomain : @"localhost",
                                                                    NSHTTPCookiePath : @"/",
                                                                    NSHTTPCookieName : @"test-cookie",
                                                                    NSHTTPCookieValue: @"test-value",
//                                                                    NSHTTPCookieExpires : [NSDate dateWithTimeIntervalSinceNow:24*60*60]
                                                                    }];
    
//    http://www.jianshu.com/p/8a4dc775c051   慕课网缓存思路
//    NSCachedURLResponse      http://blog.originate.com/blog/2014/02/20/afimagecache-vs-nsurlcache/
//    NSURLCache
//    NSCachedURLResponse
}

- ( __kindof UIView *)v {

    return nil;
    
}

- (IBAction)batchReqAction:(id)sender {
    
    //
    NBRequest *req1 = [[NBRequest alloc] init];
    req1.HTTPMethod = NBRequestMethodGET;
    req1.parameters = @{};
    req1.URLString = @"http://localhost:8080/users";
    
    //
    NBRequest *req2 = [[NBRequest alloc] init];
    req2.HTTPMethod = NBRequestMethodGET;
    req2.parameters = @{};
    req2.URLString = @"http://localhost:8080/users";
    
    //
    NBBatchReqest *batchReq = [[NBBatchReqest alloc] init];
    [batchReq  addReqFromArray:@[req1,req2]];
    [batchReq startWithSuccess:^(NBBatchReqest *batchRequest) {
        
        NSArray *reqArr = batchRequest.reqArray;
        NBRequest *req1 = reqArr[0];
        req1.responseObject;
        
        //
        NBRequest *req2 = reqArr[0];
        req2.responseObject;
        
    } failure:^(NBBatchReqest *batchRequest) {
        
        
        
    }];
    
    
}


- (IBAction)NBNetwork:(id)sender {
    
    

    
    NSString *url = @"";
    id parameters = @{
                      @"code" : @"1209",
                      @"json" : @"{\"name\" : \"tianlei\",\"age\" : 88}"
                      };
    
    NSString *requestInfo = [NSString stringWithFormat:@"Method:%d Url:%@ Argument:%@",0,url,parameters];
    
//    requestInfo MD5 处理后, 形成缓存文件名称

    //
    NBRequest *req = [NBRequest new];
    
    req.HTTPMethod = NBRequestMethodGET;
    req.URLString = @"http://localhost:8080/users";
    
    id resp = nil;
    if ([req checkCache]) {
        
       resp = [req getCache];
        NSLog(@"%@",resp);
        
    }
    
    //
    [req startWithSuccess:^(__kindof NBBaseRequest *request) {
        
       id responseObject =  request.responseObject;
        NSLog(@"%@",responseObject);
        
    } failure:^(__kindof NBBaseRequest *request) {
        
        NSError *error = request.error;
        
    }];
    
}

//
- (IBAction)send:(id)sender {
    
    if (!self.urlTf.text) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:self.urlTf.text];
    
    //req
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    req.timeoutInterval = 60*60;
    
    
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    if (cookieStorage.cookies.count > 0) {
        
        [cookieStorage.cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSLog(@"%@",obj);
            
            if ([obj.name isEqualToString:@"time-Cookie"]) {
                
                NSMutableDictionary *newPropries = obj.properties.mutableCopy;
                newPropries[NSHTTPCookieExpires] = [NSDate dateWithTimeIntervalSinceNow:60*60*60*24];
                newPropries[NSHTTPCookieDiscard] = nil;
//                newPropries[NSHTTPCookieMaximumAge] = [NSString stringWithFormat:@"%d",24*60*60];
//                newPropries[NSHTTPCookieValue] = @"新的value";
                NSHTTPCookie *newCookie = [NSHTTPCookie cookieWithProperties:newPropries];
                
                NSLog(@"%@",newCookie);
                [cookieStorage setCookie:newCookie];
                
              
            }
            
            if ([obj.name isEqualToString:@"JSESSIONID"]) {
            
                NSMutableDictionary *newPropries = obj.properties.mutableCopy;
                newPropries[NSHTTPCookieExpires] = [NSDate dateWithTimeIntervalSinceNow:60*60*60*24];
                newPropries[NSHTTPCookieDiscard] = nil;
                //                newPropries[NSHTTPCookieMaximumAge] = [NSString stringWithFormat:@"%d",24*60*60];
                //                newPropries[NSHTTPCookieValue] = @"新的value";
                NSHTTPCookie *newCookie = [NSHTTPCookie cookieWithProperties:newPropries];
                [cookieStorage setCookie:newCookie];
                
            }
  
        }];
        
    } else {
        
//        NSDictionary *properties = @{
//                                     
//                                     NSHTTPCookieName : @"JSESSIONID",
//                                     NSHTTPCookieValue : @"tinalei-cookie",
//                                     NSHTTPCookieDomain : @"localhost",
//                                     NSHTTPCookiePath : @"/",
//                                     NSHTTPCookieSecure : @"FALSE",
//                                     NSHTTPCookieDiscard : @"TRUE",          // session-noly
//                                     NSHTTPCookieExpires : @"",             // expiresDate
//                                     NSHTTPCookiePort : @""
//                                     
//                                     //
//                                     };
//        
//        NSHTTPCookie * sessionCookie = [NSHTTPCookie cookieWithProperties:properties];
//        [cookieStorage setCookie:sessionCookie];
        
        //
    }
   
    
   
    
    
    // share session 全局共享一下这些东西
    // 1.NSHTTPCookieStorage 3.NSURLCache  2.NSURLCredentialStorage
    
    //App应用重启，cookie被清空，浏览器会一直保存。区别的地方在这
    NSURLSession *session  = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            
            return;
        }
        
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        
        //
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        [cookieStorage.cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            JSESSIONID = B491ED3EA20F10FDC6AD1E9264F11A2A
            NSLog(@"%@",obj);
//            NSLog(@"##\n%@ = %@ \ndomain = %@ \npath = %@",obj.name,obj.value,obj.domain,obj.path);
            
        }];
        
       
       
       NSObject *resObj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       
       NSLog(@"%@",resObj);
       
        
        
    }];
    
    [dataTask resume];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
