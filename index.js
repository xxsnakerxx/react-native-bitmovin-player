import React from 'react';
import PropTypes from 'prop-types';

import {
  findNodeHandle,
  NativeModules,
  ViewPropTypes,
  requireNativeComponent,
} from 'react-native';

const { RNBitmovinPlayerManager } = NativeModules;

const EMPTY_FN = () => {};

const DEFAULT_CONFIGURATION = {
  style: {
    uiEnabled: true,
  },
  supportFullscreen: true,
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
      }),
      supportFullscreen: PropTypes.bool,
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
    onFullscreenEnter: EMPTY_FN,
    onFullscreenExit: EMPTY_FN,
    onControlsShow: EMPTY_FN,
    onControlsHide: EMPTY_FN,
  }

  play = () => {
    RNBitmovinPlayerManager.play(findNodeHandle(this._player));
  }

  pause = () => {
    RNBitmovinPlayerManager.pause(findNodeHandle(this._player));
  }

  seek = (time) => {
    const seekTime = parseFloat(time);

    if (seekTime) {
      RNBitmovinPlayerManager.seek(findNodeHandle(this._player), seekTime);
    }
  }

  mute = () => {
    RNBitmovinPlayerManager.mute(findNodeHandle(this._player));
  }

  unmute = () => {
    RNBitmovinPlayerManager.unmute(findNodeHandle(this._player));
  }

  enterFullscreen = () => {
    RNBitmovinPlayerManager.enterFullscreen(findNodeHandle(this._player));
  }

  exitFullscreen = () => {
    RNBitmovinPlayerManager.exitFullscreen(findNodeHandle(this._player));
  }

  _setRef = (ref) => { this._player = ref; }

  render() {
    const {
      style,
      configuration,
    } = this.props;

    return (
      <RNBitmovinPlayer
        ref={this._setRef}
        {...this.props}
        configuration={{
          ...DEFAULT_CONFIGURATION,
          ...configuration,
        }}
        style={[
          {
            backgroundColor: 'black',
          },
          style,
        ]}
      />
    );
  }
}

const RNBitmovinPlayer = requireNativeComponent('RNBitmovinPlayer', BitmovinPlayer);

export default BitmovinPlayer;
