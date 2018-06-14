
# React Native Dynamic App Icon

Since iOS 10.3 Apple supports alternate App Icons to be set programatically. This package integrates this functionality as React Native module. Android is not (yet?) supported.

## Table of Contents

- [Install](#install)
- [Add alternate icons](#add-alternate-icons)
- [Usage](#usage)
- [API](#api)
- [License](#license)

## Install

`$ npm install react-native-dynamic-app-icon`

### Mostly automatic installation

`$ react-native link react-native-dynamic-app-icon`

### Manual installation

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-dynamic-app-icon` and add `RNDynamicAppIcon.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDynamicAppIcon.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project

## Add alternate icons

Alternate icons have to be placed directly in your Xcode project rather than inside an asset catalogue. The `@2x` and `@3x` naming convention is supported as usual.

### Adjust `info.plist`

Copy the following to your `info.plist` and adjust it as needed. The omit the file extension (and `@2x`) part, Xcode will pick them accordingly. You can add more alternate icons by adding more items to the `alternate` dict.

```
<key>CFBundleIcons</key>
<dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>alternate</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>ALTERNATE_FILENAME</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
    <key>CFBundlePrimaryIcon</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>FILENAME</string>
      </array>
    </dict>
  </dict>
</dict>
```

## Usage

```javascript
import AppIcon from 'react-native-dynamic-app-icon';

AppIcon.setAppIcon('filename');
```

## Api

### setAppIcon(filename: string)

To change the app icon call this method with one of the filenames specified in your `plist.info`. To reset to the default app icon pass `null`.

### supportsDynamicAppIcon()

Returns a promise which resolves to a boolean.

## License

[MIT](https://github.com/idearockers/react-native-dynamic-app-icon/blob/master/LICENSE) © [idearockers](https://www.idearockers.com/)
