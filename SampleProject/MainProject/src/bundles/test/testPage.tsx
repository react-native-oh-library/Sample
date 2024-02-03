import React from 'react';
import {ScrollView, StyleSheet, View} from 'react-native';
import {
  AnimatedRenderExample,
  AnimationsExample,
  CheckerboardExample,
  ChessboardExample,
  TextScrollExample,
  CursorExample,
  ImageGalleryExample,
  FlatListVsScrollViewExample,
  LargeImageScrollExample,
  TogglingComponentExample,
  StickyHeadersExample,
  TabsAndScrollViewExample,
  NestedScrollingExample,
} from '../../../examples';
import {NavigationContainer, Page} from '../../../components';
import {PortalHost, PortalProvider} from '@gorhom/portal';
import * as tests from '../../../tests';
import {Tester} from '@rnoh/testerino';

function AppTest() {
  return (
    <NavigationContainer>
      <PortalProvider>
        <View id="__harmony::ready" />
        {Object.keys(tests).map(testSuiteName => {
          const TestSuite = tests[testSuiteName as keyof typeof tests];
          return (
            <Page
              key={testSuiteName}
              name={`TESTS: ${testSuiteName.replace('Test', '')}`}>
              <Tester>
                <ScrollView style={{marginBottom: 100}}>
                  <TestSuite key={testSuiteName} />
                </ScrollView>
              </Tester>
            </Page>
          );
        })}
        <Page name="EXAMPLE: ANIMATIONS">
          <AnimationsExample />
        </Page>
        <Page name="EXAMPLE: CHECKERBOARD">
          <CheckerboardExample />
        </Page>
        <Page name="EXAMPLE: CHESSBOARD">
          <ChessboardExample />
        </Page>
        <Page name="EXAMPLE: CURSOR">
          <CursorExample />
        </Page>
        <Page name="EXAMPLE: IMAGE GALLERY">
          <ImageGalleryExample />
        </Page>
        <Page name="EXAMPLE: LARGE IMAGE SCROLL">
          <LargeImageScrollExample />
        </Page>
        <Page name="EXAMPLE: TEXTSCROLL">
          <TextScrollExample />
        </Page>
        <Page name="EXAMPLE: FLATLIST VS SCROLLVIEW">
          <FlatListVsScrollViewExample />
        </Page>
        <Page name="EXAMPLE: TOGGLING COMPONENT">
          <TogglingComponentExample />
        </Page>
        <Page name="EXAMPLE: STICKY HEADERS (example doesn't work on Android)">
          <StickyHeadersExample />
        </Page>
        <Page name="EXAMPLE: TABS AND SCROLL VIEW">
          <TabsAndScrollViewExample />
        </Page>
        <Page name="EXAMPLE: ANIMATED AND SET STATE">
          <AnimatedRenderExample />
        </Page>
        <Page name="EXAMPLE: NESTED SCROLLING EXAMPLE">
          <NestedScrollingExample />
        </Page>
        <View
          style={[
            StyleSheet.absoluteFill,
            {zIndex: 100, pointerEvents: 'box-none'},
          ]}>
          <PortalHost name="ModalHost" />
        </View> 
      </PortalProvider>
    </NavigationContainer>
  );
}

export default AppTest;
