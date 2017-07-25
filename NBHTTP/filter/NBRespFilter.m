//
//  NBRespFilter.m
//  HTTP
//
//  Created by  tianlei on 2017/7/20.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "NBRespFilter.h"

@implementation NBRespFilter

- (BOOL)checkResp:(id)resp {

    if (![resp isKindOfClass:[NSDictionary class]]) {
      
        return NO;
        
    }
    
    if (self.value) {
        
        return resp[self.key] &&  [resp[self.key] isEqual:self.value];
        
    }
    
    return resp[self.key];
    
}

@end
