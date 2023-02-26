//
//  MLKitReactNative.h
//  MLKitDemo
//
//  Created by Николай Попов on 21.02.2023.
//

#ifndef MLKitReactNative_h
#define MLKitReactNative_h

#import <React/RCTBridgeModule.h>

#import "MLKitTranslate/MLKitTranslate.h"

@interface MLKitReactNative : NSObject <RCTBridgeModule>
{
  MLKTranslator *_translator;
}
@end

#endif /* MLKitReactNative_h */
