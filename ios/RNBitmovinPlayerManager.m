#import "RNBitmovinPlayerManager.h"
#import <React/RCTUIManager.h>

@implementation RNBitmovinPlayerManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE()

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

RCT_EXPORT_METHOD(play:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player play];
    } else {
        RCTLogError(@"Cannot play: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player pause];
    } else {
        RCTLogError(@"Cannot pause: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(seek:(nonnull NSNumber *)reactTag time:(float)time) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player seek:time];
    } else {
        RCTLogError(@"Cannot seek: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(mute:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player mute];
    } else {
        RCTLogError(@"Cannot mute: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(unmute:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player unmute];
    } else {
        RCTLogError(@"Cannot unmute: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(enterFullscreen:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player enterFullscreen];
    } else {
        RCTLogError(@"Cannot enterFullscreen: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

RCT_EXPORT_METHOD(exitFullscreen:(nonnull NSNumber *)reactTag) {
    RNBitmovinPlayer *player = [self.bridge.uiManager viewForReactTag:reactTag];
    
    if ([player isKindOfClass:[RNBitmovinPlayer class]]) {
        [player exitFullscreen];
    } else {
        RCTLogError(@"Cannot exitFullscreen: %@ (tag #%@) is not a RNBitmovinPlayer", player, reactTag);
    }
}

@end
