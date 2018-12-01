//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <audio_recorder/AudioRecorderPlugin.h>
#import <firebase_core/FirebaseCorePlugin.h>
#import <firebase_storage/FirebaseStoragePlugin.h>
#import <path_provider/PathProviderPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioRecorderPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioRecorderPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTFirebaseStoragePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseStoragePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
