//
//  MLKitReactNative.m
//  MLKitDemo
//
//  Created by Николай Попов on 21.02.2023.
//

#import <Foundation/Foundation.h>

#import "MLKitReactNative.h"

@import MLKitTranslate;
@import MLKitCommon.MLKModelDownloadConditions;

@implementation MLKitReactNative

RCT_EXPORT_METHOD(downloadModelIfNeeded:
                  (RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
                  ) {
  
     MLKTranslatorOptions *options =
         [[MLKTranslatorOptions alloc] initWithSourceLanguage:MLKTranslateLanguageEnglish
                                               targetLanguage:MLKTranslateLanguageUkrainian];
     _translator =
         [MLKTranslator translatorWithOptions:options];
  
  MLKModelDownloadConditions *conditions =
      [[MLKModelDownloadConditions alloc] initWithAllowsCellularAccess:NO
                                           allowsBackgroundDownloading:YES];
  [_translator downloadModelIfNeededWithConditions:conditions
                                                    completion:^(NSError *_Nullable error) {
    if (error != nil) {
      reject(@"All bad", @"Some descrioption", nil);
      return;
    }
    resolve(@"All good");
  }];
}

RCT_EXPORT_METHOD(translate:(NSString*)stringToTranslate
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
                  ) {
  [_translator translateText:stringToTranslate
                              completion:^(NSString *_Nullable translatedText,
                                           NSError *_Nullable error) {
    if (error != nil || translatedText == nil) {
      reject(@"All bad", @"Some descrioption", nil);
      return;
    }
    resolve(translatedText);
  }];
}

RCT_EXPORT_MODULE(MLKitReactNative);

@end
