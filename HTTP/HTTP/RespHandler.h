//
//  RespHandler.h
//  HTTP
//
//  Created by  tianlei on 2017/9/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBNetwork.h"

@interface RespHandler : NSObject<NBRespDelegate>

- (void)handleHttpSuccessWithReq:(NBBaseRequest *)req task:(NSURLSessionDataTask *)task resp:(id)responseObject;

- (void)handleHttpFailureWithReq:(NBBaseRequest *)req task:(NSURLSessionDataTask *)task error:(NSError *)error;

@end
