import React, {useState} from 'react';
import {StyleSheet, SafeAreaView, Button} from 'react-native';
import RTNCenteredText from 'rtn-centered-text/src/RTNCenteredTextNativeComponent';

const App = () => {
  const [content, setContent] = useState('Hello World!');
  return (
    <SafeAreaView style={[styles.container, styles.horizontal]}>
      <RTNCenteredText
        text={content}
        color="0xFFFF0000"
        style={{width: '100%', height: 50}}
        onTextTouch={e => {
          if (e.type == '0') {
            setContent('Touch Down');
            return;
          }
          if (e.type == '1') {
            setContent('Touch Up');
            return;
          }
          if (e.type == '2') {
            setContent('Touch Move');
            return;
          }
        }}
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  horizontal: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    padding: 10,
  },
});

export default App;
