import React, {useState} from 'react';
import {StyleSheet, SafeAreaView, Button, StatusBar, Text} from 'react-native';
import RTNCenteredText from 'rtn-centered-text/src/RTNCenteredTextNativeComponent';
import RTNCalculator from 'rtn-calculator/src/NativeCalculator';

const App = () => {
  const [content, setContent] = useState('Hello World!');
  const [result, setResult] = useState<number | null>(null);
  return (
    <SafeAreaView style={[styles.container, styles.vertical]}>
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
      <StatusBar barStyle={'dark-content'} />
      <Text style={{marginLeft: 20, marginTop: 20}}>3+7={result ?? '??'}</Text>
      <Button
        title="Compute"
        onPress={async () => {
          const value = await RTNCalculator.add(3, 7);
          setResult(value);
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
  vertical: {
    flexDirection: 'column',
    justifyContent: 'space-around',
    padding: 10,
  },
});

export default App;
