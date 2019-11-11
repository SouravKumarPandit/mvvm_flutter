#import "MvvmFlutterPlugin.h"
#if __has_include(<mvvm_flutter/mvvm_flutter-Swift.h>)
#import <mvvm_flutter/mvvm_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mvvm_flutter-Swift.h"
#endif

@implementation MvvmFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMvvmFlutterPlugin registerWithRegistrar:registrar];
}
@end
