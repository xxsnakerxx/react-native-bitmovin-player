#import "RNBitmovinPlayerManager.h"
#import <React/RCTBridge.h>

@implementation RNBitmovinPlayerManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [RNBitmovinPlayer new];
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

@end
