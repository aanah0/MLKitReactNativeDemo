/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {SafeAreaView, StatusBar, NativeModules, Button} from 'react-native';

const {MLKitReactNative} = NativeModules;

console.log('MLKitReactNative', MLKitReactNative);

function App(): JSX.Element {
  const log = () => {
    MLKitReactNative.downloadModelIfNeeded()
      .then(console.log)
      .catch(console.log);
  };

  const translate = () => {
    MLKitReactNative.translate('One two three')
      .then(console.log)
      .catch(console.log);
  };

  return (
    <SafeAreaView>
      <StatusBar barStyle={'light-content'} />
      <Button onPress={log} title="Log sonmerghins" />
      <Button onPress={translate} title="translate" />
    </SafeAreaView>
  );
}

export default App;
