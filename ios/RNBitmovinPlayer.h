#import <React/UIView+React.h>
#import <BitmovinPlayer/BitmovinPlayer.h>

@interface RNBitmovinPlayer : UIView <BMPPlayerListener, BMPUserInterfaceListener, BMPFullscreenHandler>

@property (nonatomic, strong) BMPBitmovinPlayer *player;
@property (nonatomic, strong) BMPBitmovinPlayerView *playerView;

@property (readonly, getter=isFullscreen, nonatomic) BOOL fullscreen;

@property (nonatomic, copy) NSDictionary *configuration;

@property (nonatomic, copy) RCTBubblingEventBlock onFullscreenEnter;
@property (nonatomic, copy) RCTBubblingEventBlock onFullscreenExit;
@property (nonatomic, copy) RCTBubblingEventBlock onControlsShow;
@property (nonatomic, copy) RCTBubblingEventBlock onControlsHide;

@property (nonatomic, copy) RCTBubblingEventBlock onReady;
@property (nonatomic, copy) RCTBubblingEventBlock onPlay;
@property (nonatomic, copy) RCTBubblingEventBlock onPaused;
@property (nonatomic, copy) RCTBubblingEventBlock onTimeChanged;
@property (nonatomic, copy) RCTBubblingEventBlock onStallStarted;
@property (nonatomic, copy) RCTBubblingEventBlock onStallEnded;
@property (nonatomic, copy) RCTBubblingEventBlock onPlaybackFinished;
@property (nonatomic, copy) RCTBubblingEventBlock onRenderFirstFrame;
@property (nonatomic, copy) RCTBubblingEventBlock onPlayerError;
@property (nonatomic, copy) RCTBubblingEventBlock onMuted;
@property (nonatomic, copy) RCTBubblingEventBlock onUnmuted;
@property (nonatomic, copy) RCTBubblingEventBlock onSeek;
@property (nonatomic, copy) RCTBubblingEventBlock onSeeked;

@end
