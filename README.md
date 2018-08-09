
# react-native-bitmovin-player

![logo](https://theme.zdassets.com/theme_assets/2003534/6f68a0e835ddfda9be0302986dc3b37e44f7d3c5.png)

## Getting started

`$ npm install react-native-bitmovin-player --save`

### Mostly automatic installation

`$ react-native link react-native-bitmovin-player`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-bitmovin-player` and add `RNBitmovinPlayer.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBitmovinPlayer.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

#### Android (Not Ready Yet)

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.xxsnakerxx.RNBitmovinPlayerPackage;` to the imports at the top of the file
  - Add `new RNBitmovinPlayerPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
   ```java
   include ':react-native-bitmovin-player'
   project(':react-native-bitmovin-player').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-bitmovin-player/android')
   ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```java
   implementation project(':react-native-bitmovin-player')
   ```

### Add BitmovinPlayer iOS SDK

Add line to your Podfile

`pod 'BitmovinPlayer', git: 'https://github.com/bitmovin/bitmovin-player-ios-sdk-cocoapod.git', tag: '2.11.0'`.

After that, install the pod using `pod install`.

### Setup Project

#### iOS

- Add your Bitmovin player license key to the `Info.plist` file as __BitmovinPlayerLicenseKey__.

  Your player license key can be found when logging in into https://dashboard.bitmovin.com and navigating to `Player -> Licenses`.

- Add the Bundle identifier of the iOS application which is using the SDK as an allowed domain to the Bitmovin licensing backend. This can also be done under Player -> Licenses when logging in into https://dashboard.bitmovin.com with your account.

  When you do not do this, you'll get a license error when starting the application which contains the player.

#### Android (Not Ready Yet)

## Usage
```javascript
import RNBitmovinPlayer from 'react-native-bitmovin-player';

// please follow to index.js for available props
<BitmovinPlayer
  configuration={{
    source: {
      title: 'It works',
      url: 'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8',
    },
  }}
/>
```
