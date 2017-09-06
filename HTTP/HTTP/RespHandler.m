//
//  RespHandler.m
//  HTTP
//
//  Created by  tianlei on 2017/9/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "RespHandler.h"

@implementation RespHandler


- (void)handleHttpSuccessWithReq:(NBBaseRequest *)req task:(NSURLSessionDataTask *)task resp:(id)responseObject  {

    //对请求进行过滤
    //然后完成回调
    NSLog(@"成功——响应过滤 ：%@",req);
    req.success(req);

}

- (void)handleHttpFailureWithReq:(NBBaseRequest *)req task:(NSURLSessionDataTask *)task error:(NSError *)error  {

    //对请求进行过滤
    //然后完成回调
    NSLog(@"失败——响应过滤 ：%@",req);
    req.failure(req);

}
@end
