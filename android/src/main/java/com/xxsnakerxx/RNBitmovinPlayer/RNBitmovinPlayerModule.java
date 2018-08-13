
package com.xxsnakerxx.RNBitmovinPlayer;

import android.view.View;

import com.bitmovin.player.BitmovinPlayerView;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNBitmovinPlayerModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext _reactContext;

  public RNBitmovinPlayerModule(ReactApplicationContext reactContext) {
    super(reactContext);

    _reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNBitmovinPlayer";
  }

  @ReactMethod
  public void play(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().play();
    } else {
      throw new ClassCastException(String.format("Cannot play: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void pause(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().pause();
    } else {
      throw new ClassCastException(String.format("Cannot pause: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void seek(int tag, double time) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().seek(time);
    } else {
      throw new ClassCastException(String.format("Cannot seek: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void mute(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().mute();
    } else {
      throw new ClassCastException(String.format("Cannot mute: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void unmute(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().unmute();
    } else {
      throw new ClassCastException(String.format("Cannot unmute: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void enterFullscreen(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).enterFullscreen();
    } else {
      throw new ClassCastException(String.format("Cannot enterFullscreen: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void exitFullscreen(int tag) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).exitFullscreen();
    } else {
      throw new ClassCastException(String.format("Cannot exitFullscreen: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void getCurrentTime(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      double currentTime = ((BitmovinPlayerView) playerView).getPlayer().getCurrentTime();

      promise.resolve(currentTime);
    } else {
      throw new ClassCastException(String.format("Cannot getCurrentTime: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void getDuration(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      double duration = ((BitmovinPlayerView) playerView).getPlayer().getDuration();

      promise.resolve(duration);
    } else {
      throw new ClassCastException(String.format("Cannot getDuration: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void getVolume(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      int volume = ((BitmovinPlayerView) playerView).getPlayer().getVolume();

      promise.resolve(volume);
    } else {
      throw new ClassCastException(String.format("Cannot getVolume: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void setVolume(int tag, int volume) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      ((BitmovinPlayerView) playerView).getPlayer().setVolume(volume);
    } else {
      throw new ClassCastException(String.format("Cannot setVolume: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void isMuted(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      boolean isMuted = ((BitmovinPlayerView) playerView).getPlayer().isMuted();

      promise.resolve(isMuted);
    } else {
      throw new ClassCastException(String.format("Cannot isMuted: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void isPaused(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      boolean isPaused = ((BitmovinPlayerView) playerView).getPlayer().isPaused();

      promise.resolve(isPaused);
    } else {
      throw new ClassCastException(String.format("Cannot isPaused: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void isStalled(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      boolean isStalled = ((BitmovinPlayerView) playerView).getPlayer().isStalled();

      promise.resolve(isStalled);
    } else {
      throw new ClassCastException(String.format("Cannot isStalled: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }

  @ReactMethod
  public void isPlaying(int tag, Promise promise) {
    View playerView = getCurrentActivity().findViewById(tag);

    if (playerView instanceof BitmovinPlayerView) {
      boolean isPlaying = ((BitmovinPlayerView) playerView).getPlayer().isPlaying();

      promise.resolve(isPlaying);
    } else {
      throw new ClassCastException(String.format("Cannot isPlaying: view with tag #%d is not a RNBitmovinPlayer", tag));
    }
  }
}