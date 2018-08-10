#import "RNBitmovinPlayer.h"
#import <React/RCTLog.h>
#import <React/RCTView.h>

@implementation RNBitmovinPlayer {
    BMPBitmovinPlayer *_player;
    BMPBitmovinPlayerView *_playerView;
    
    BOOL _fullscreen;
}

- (void)dealloc {
    [_player destroy];
}

- (instancetype)init {
    if ((self = [super init])) {
        _fullscreen = NO;
    }
    return self;
}

- (void)setConfiguration:(NSDictionary *)config {
    BMPPlayerConfiguration *configuration = [BMPPlayerConfiguration new];
    
    if (!config[@"source"] || !config[@"source"][@"url"]) return;
    
    [configuration setSourceItemWithString:config[@"source"][@"url"] error:NULL];
    
    if (config[@"source"][@"title"]) {
        configuration.sourceItem.itemTitle = config[@"source"][@"title"];
    }
    
    if (config[@"poster"] && config[@"poster"][@"url"]) {
        configuration.sourceItem.posterSource = [NSURL URLWithString:config[@"poster"][@"url"]];
        configuration.sourceItem.persistentPoster = [config[@"poster"][@"persistent"] boolValue];
    }
    
    if (![config[@"style"][@"uiEnabled"] boolValue]) {
        configuration.styleConfiguration.uiEnabled = NO;
    }
    
    if ([config[@"style"][@"systemUI"] boolValue]) {
        configuration.styleConfiguration.userInterfaceType = BMPUserInterfaceTypeSystem;
    }
    
    if (config[@"style"][@"uiCss"]) {
        configuration.styleConfiguration.playerUiCss = [NSURL URLWithString:config[@"style"][@"uiCss"]];
    }
    
    if (config[@"style"][@"supplementalUiCss"]) {
        configuration.styleConfiguration.supplementalPlayerUiCss = [NSURL URLWithString:config[@"style"][@"supplementalUiCss"]];
    }
    
    if (config[@"style"][@"uiJs"]) {
        configuration.styleConfiguration.playerUiJs = [NSURL URLWithString:config[@"style"][@"uiJs"]];
    }
    
    _player = [[BMPBitmovinPlayer alloc] initWithConfiguration:configuration];
    
    [_player addPlayerListener:self];
    
    _playerView = [[BMPBitmovinPlayerView alloc] initWithPlayer:_player frame:self.frame];
    _playerView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    _playerView.frame = self.bounds;
    
    [_playerView addUserInterfaceListener:self];

    if ([config[@"supportFullscreen"] boolValue]) {
        _playerView.fullscreenHandler = self;
    }
    
    [self addSubview:_playerView];
    [self bringSubviewToFront:_playerView];
}

#pragma mark BMPFullscreenHandler protocol
- (BOOL)isFullscreen {
    return _fullscreen;
}

- (void)onFullscreenRequested {
    _fullscreen = YES;
}

- (void)onFullscreenExitRequested {
    _fullscreen = NO;
}

#pragma mark BMPPlayerAPI
- (void)play {
    [_player play];
}

- (void)pause {
    [_player pause];
}

- (void)seek:(double)time {
    [_player seek:time];
}

- (void)mute {
    [_player mute];
}

- (void)unmute {
    [_player unmute];
}

#pragma mark BMPUserInterfaceAPI
- (void)enterFullscreen {
    [_playerView enterFullscreen];
}

- (void)exitFullscreen {
    [_playerView exitFullscreen];
}

#pragma mark BMPUserInterfaceListener
- (void)onFullscreenEnter:(BMPFullscreenEnterEvent *)event {
    _onFullscreenEnter(@{});
}

- (void)onFullscreenExit:(BMPFullscreenExitEvent *)event {
    _onFullscreenExit(@{});
}
- (void)onControlsShow:(BMPControlsShowEvent *)event {
    _onControlsShow(@{});
}

- (void)onControlsHide:(BMPControlsHideEvent *)event {
    _onControlsHide(@{});
}

#pragma mark BMPPlayerListener
- (void)onReady:(BMPReadyEvent *)event {
    _onReady(@{});
}

- (void)onPlay:(BMPPlayEvent *)event {
    _onPlay(@{
              @"time": @(event.time),
              });
}

- (void)onPaused:(BMPPausedEvent *)event {
    _onPaused(@{
              @"time": @(event.time),
              });
}

- (void)onTimeChanged:(BMPTimeChangedEvent *)event {
    _onTimeChanged(@{
                @"time": @(event.currentTime),
                });
}

- (void)onStallStarted:(BMPStallStartedEvent *)event {
    _onStallStarted(@{});
}

- (void)onStallEnded:(BMPStallEndedEvent *)event {
    _onStallEnded(@{});
}

- (void)onPlaybackFinished:(BMPPlaybackFinishedEvent *)event {
    _onPlaybackFinished(@{});
}

- (void)onRenderFirstFrame:(BMPRenderFirstFrameEvent *)event {
    _onRenderFirstFrame(@{});
}

- (void)onError:(BMPErrorEvent *)event {
    _onPlayerError(@{
               @"error": @{
                       @"code": @(event.code),
                       @"message": event.message,
                       }
               });
}

- (void)onMuted:(BMPMutedEvent *)event {
    _onMuted(@{});
}

- (void)onUnmuted:(BMPUnmutedEvent *)event {
    _onUnmuted(@{});
}

@end
