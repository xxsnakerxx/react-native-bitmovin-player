#import "RNBitmovinPlayerManager.h"
#import <React/RCTUIManager.h>

@implementation RNBitmovinPlayerManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(RNBitmovinPlayer);

- (UIView *)view
{
    return [RNBitmovinPlayer new];
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(configuration, NSDictionary);

RCT_EXPORT_VIEW_PROPERTY(onFullscreenEnter, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onFullscreenExit, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onControlsShow, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onControlsHide, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onReady, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlay, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPaused, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onTimeChanged, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onStallStarted, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onStallEnded, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlaybackFinished, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onRenderFirstFrame, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlayerError, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onMuted, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onUnmuted, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onSeek, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onSeeked, RCTBubblingEventBlock);

RCT_EXPORT_METHOD(play:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        [player play];
    } else {
        RCTLogError(@"Cannot play: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        [player pause];
    } else {
        RCTLogError(@"Cannot pause: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(seek:(nonnull NSNumber *)reactTag time:(float)time) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        [player seek:time];
    } else {
        RCTLogError(@"Cannot seek: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(mute:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        [player mute];
    } else {
        RCTLogError(@"Cannot mute: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(unmute:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        [player unmute];
    } else {
        RCTLogError(@"Cannot unmute: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(enterFullscreen:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayerView *playerView = [(RNBitmovinPlayer*)view playerView];
        
        [playerView enterFullscreen];
    } else {
        RCTLogError(@"Cannot enterFullscreen: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(exitFullscreen:(nonnull NSNumber *)reactTag) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayerView *playerView = [(RNBitmovinPlayer*)view playerView];
        
        [playerView exitFullscreen];
    } else {
        RCTLogError(@"Cannot exitFullscreen: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(getCurrentTime:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.currentTime));
    } else {
        RCTLogError(@"Cannot getCurrentTime: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(getDuration:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.duration));
    } else {
        RCTLogError(@"Cannot getDuration: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(getVolume:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.volume));
    } else {
        RCTLogError(@"Cannot getVolume: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(setVolume:(nonnull NSNumber *)reactTag
                  volume:(int)volume) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        player.volume = volume;
    } else {
        RCTLogError(@"Cannot setVolume: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(isPaused:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.isPaused));
    } else {
        RCTLogError(@"Cannot isPaused: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(isMuted:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.isMuted));
    } else {
        RCTLogError(@"Cannot isMuted: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(isStalled:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
         // BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(NO));
    } else {
        RCTLogError(@"Cannot isStalled: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

RCT_EXPORT_METHOD(isPlaying:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([view isKindOfClass:[RNBitmovinPlayer class]]) {
        BMPBitmovinPlayer *player = [(RNBitmovinPlayer*)view player];
        
        resolve(@(player.isPlaying));
    } else {
        RCTLogError(@"Cannot isPlaying: view with tag #%@ is not a RNBitmovinPlayer", reactTag);
    }
}

@end
