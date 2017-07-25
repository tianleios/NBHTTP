//
//  NBRespFilter.h
//  HTTP
//
//  Created by  tianlei on 2017/7/20.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBRespFilter : NSObject

//返回数值跟信息过滤
/*
 根据业务过滤指定的结果，常见处理业务异常
 responseobject
 {
   data: 
   errorCode:
   errorMsg:
 }
 */

/**
 指定key,和value
 eg: key=errorCode  value= 400, 会对此次相应进行单独处理，如果value为空,只要存在这个可就进行处理
 */
//@property (nonatomic, copy, nonnull) NSDictionary <NSString *,id > *filterDictionry;

@property (nonatomic, copy, nonnull) NSString * key;
@property (nonatomic, copy, nullable) id value;

@property (nonatomic, copy) NSString *filterMsgKey;
@property (nonatomic, copy) NSString *filterMsg;

@property (nonatomic, copy)  void(^ filterAction)(NBRespFilter *,id responseObj);


/**
   满足该条件，返回yes
 */
- (BOOL)checkResp:(id )resp;

@end
