import React from 'react';
import PropTypes from 'prop-types';

import {
  findNodeHandle,
  UIManager,
  NativeModules,
  ViewPropTypes,
  requireNativeComponent,
  Platform,
} from 'react-native';

const RNBitmovinPlayerModule = NativeModules.RNBitmovinPlayer;

const EMPTY_FN = () => {};

const DEFAULT_CONFIGURATION = {
  style: {
    uiEnabled: true,
    fullscreenIcon: true,
  },
};

class BitmovinPlayer extends React.Component {
  static propTypes = {
    style: ViewPropTypes.style,
    configuration: PropTypes.shape({
      source: PropTypes.shape({
        title: PropTypes.string,
        url: PropTypes.string.isRequired,
      }),
      poster: PropTypes.shape({
        url: PropTypes.string,
        persistent: PropTypes.bool,
      }),
      style: PropTypes.shape({
        uiEnabled: PropTypes.bool,
        systemUI: PropTypes.bool,
        uiCss: PropTypes.string,
        supplementalUiCss: PropTypes.string,
        uiJs: PropTypes.string,
        fullscreenIcon: PropTypes.bool,
      }),
    }).isRequired,

    onReady: PropTypes.func,
    onPlay: PropTypes.func,
    onPaused: PropTypes.func,
    onTimeChanged: PropTypes.func,
    onStallStarted: PropTypes.func,
    onStallEnded: PropTypes.func,
    onPlaybackFinished: PropTypes.func,
    onRenderFirstFrame: PropTypes.func,
    onPlayerError: PropTypes.func,
    onMuted: PropTypes.func,
    onUnmuted: PropTypes.func,
    onSeek: PropTypes.func,
    onSeeked: PropTypes.func,
    onFullscreenEnter: PropTypes.func,
    onFullscreenExit: PropTypes.func,
    onControlsShow: PropTypes.func,
    onControlsHide: PropTypes.func,
  }

  static defaultProps = {
    style: null,

    onReady: EMPTY_FN,
    onPlay: EMPTY_FN,
    onPaused: EMPTY_FN,
    onTimeChanged: EMPTY_FN,
    onStallStarted: EMPTY_FN,
    onStallEnded: EMPTY_FN,
    onPlaybackFinished: EMPTY_FN,
    onRenderFirstFrame: EMPTY_FN,
    onPlayerError: EMPTY_FN,
    onMuted: EMPTY_FN,
    onUnmuted: EMPTY_FN,
    onSeek: EMPTY_FN,
    onSeeked: EMPTY_FN,
    onFullscreenEnter: EMPTY_FN,
    onFullscreenExit: EMPTY_FN,
    onControlsShow: EMPTY_FN,
    onControlsHide: EMPTY_FN,
  }

  state = {
    maxHeight: null,
  }

  _onReady = () => {
    const {
      onReady,
    } = this.props;

    // this need because video view stretched on initial render (RN 0.55.4)
    // TODO: check in future releases of RN
    if (Platform.OS === 'android') {
      UIManager.measure(
        findNodeHandle(this._player),
        (x, y, w, h) => {
          // trigger resize
          this.setState({
            maxHeight: h - 1,
          }, () => {
            requestAnimationFrame(() => {
              this.setState({
                maxHeight: h,
              });
            });
          });
        },
      );
    }

    onReady();
  }

  play = () => {
    RNBitmovinPlayerModule.play(findNodeHandle(this._player));
  }

  pause = () => {
    RNBitmovinPlayerModule.pause(findNodeHandle(this._player));
  }

  seek = (time = 0) => {
    const seekTime = parseFloat(time);

    if (seekTime) {
      RNBitmovinPlayerModule.seek(findNodeHandle(this._player), seekTime);
    }
  }

  mute = () => {
    RNBitmovinPlayerModule.mute(findNodeHandle(this._player));
  }

  unmute = () => {
    RNBitmovinPlayerModule.unmute(findNodeHandle(this._player));
  }

  enterFullscreen = () => {
    RNBitmovinPlayerModule.enterFullscreen(findNodeHandle(this._player));
  }

  exitFullscreen = () => {
    RNBitmovinPlayerModule.exitFullscreen(findNodeHandle(this._player));
  }

  getCurrentTime = () => RNBitmovinPlayerModule.getCurrentTime(findNodeHandle(this._player))

  getDuration = () => RNBitmovinPlayerModule.getDuration(findNodeHandle(this._player))

  getVolume = () => RNBitmovinPlayerModule.getVolume(findNodeHandle(this._player))

  setVolume = (volume = 100) => {
    RNBitmovinPlayerModule.setVolume(findNodeHandle(this._player), volume);
  }

  isMuted = () => RNBitmovinPlayerModule.isMuted(findNodeHandle(this._player))

  isPaused = () => RNBitmovinPlayerModule.isPaused(findNodeHandle(this._player))

  isStalled = () => RNBitmovinPlayerModule.isStalled(findNodeHandle(this._player))

  isPlaying = () => RNBitmovinPlayerModule.isPlaying(findNodeHandle(this._player))

  _setRef = (ref) => { this._player = ref; }

  render() {
    const {
      style,
      configuration,
    } = this.props;

    const {
      maxHeight,
    } = this.state;

    return (
      <RNBitmovinPlayer
        {...this.props}
        ref={this._setRef}
        onReady={this._onReady}
        configuration={{
          ...DEFAULT_CONFIGURATION,
          ...configuration,
        }}
        style={[
          maxHeight
            ? {
              maxHeight,
            }
            : null,
          {
            backgroundColor: 'black',
          },
          style,
        ]}
      />
    );
  }
}

const RNBitmovinPlayer = requireNativeComponent(
  'RNBitmovinPlayer',
  BitmovinPlayer,
  {
    nativeOnly: {
      onSurfaceCreate: true,
      testID: true,
      accessibilityLabel: true,
      accessibilityLiveRegion: true,
      accessibilityComponentType: true,
      importantForAccessibility: true,
      renderToHardwareTextureAndroid: true,
      onLayout: true,
      nativeID: true,
    },
  },
);

export default BitmovinPlayer;
