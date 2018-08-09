import React from 'react';
import PropTypes from 'prop-types';

import {
  ViewPropTypes,
  requireNativeComponent,
} from 'react-native';

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

  render() {
    const {
      style,
      configuration,
    } = this.props;

    return (
      <RNBitmovinPlayer
        {...this.props}
        configuration={{
          ...DEFAULT_CONFIGURATION,
          ...configuration,
        }}
        style={[
          {
            backgroundColor: 'black'
          },
          style,
        ]}
      />
    );
  }
}

const RNBitmovinPlayer = requireNativeComponent('RNBitmovinPlayer', BitmovinPlayer);

export default BitmovinPlayer;
