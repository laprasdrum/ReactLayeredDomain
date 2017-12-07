import React, { Component } from 'react';
import {
  Platform,
  View,
  NativeModules
} from 'react-native';

export default class App extends Component<{}> {
  componentDidMount() {
    let adapter = NativeModules.RLDRootAdapter;
    let languages = [
      { type: "Swift",  stars: 41872 },
      { type: "Kotlin", stars: 19392 },
    ]
    adapter.emitChange(languages);
  }

  render() {
		return <View />;
  }
}
