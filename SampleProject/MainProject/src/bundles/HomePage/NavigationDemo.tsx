/* eslint-disable react/no-unstable-nested-components */
/* eslint-disable react-native/no-inline-styles */
/**
 * @format
 */

 import * as React from 'react';
 import {
   View,
   Text,
   Button,
   StyleSheet,
 } from 'react-native';
 import {NavigationContainer} from '@react-navigation/native';
 import {createStackNavigator} from '@react-navigation/stack';
 import {enableScreens} from 'react-native-screens';
 
 enableScreens(false);
 
 let count = 1;
 function HomeScreen({navigation}) {
   return (
     <View style={styles.view}>
       <Text>Home Screen {count++} </Text>
       <Button
         title="Go to Details"
         onPress={() => navigation.push('Details')}
       />
       <Button title="back" onPress={() => navigation.goBack()} />
     </View>
   );
 }
 
 function DetailsScreen({navigation}) {
   return (
     <View style={styles.view}>
       <Text>Details Screen {count++}</Text>
       <Button title="Go to Home" onPress={() => navigation.push('Home')} />
       <Button title="back" onPress={() => navigation.goBack()} />
    
     </View>
   );
 }
 
 const Stack = createStackNavigator(); // createNativeStackNavigator();
 
 export default function AppHome() {
   return (
    <NavigationContainer>
    <Stack.Navigator initialRouteName="Home" detachInactiveScreens={false}>
      <Stack.Screen
        name="Home"
        component={HomeScreen}
        options={({navigation, route}) => ({
          headerTitle: 'Home',
          headerStyle: {
            backgroundColor: '#f4511e',
          },
          headerTintColor: '#fff',
          headerTitleStyle: {
            fontWeight: 'bold',
          },
        })}
      />
      <Stack.Screen
        name="Details"
        component={DetailsScreen}
        options={({navigation, route}) => ({
          headerTitle: 'Details',
          headerStyle: {
            backgroundColor: '#f4511e',
          },
          headerTintColor: '#fff',
          headerTitleStyle: {
            fontWeight: 'bold',
          },
        })}
      />
    </Stack.Navigator>
  </NavigationContainer>
   );
 }
 
 function MyApp() {
   return (
     <View>
       <Button
         title="MyApp"
         onPress={() => {
           console.log('clicked');
         }}
       />
       <View style={{backgroundColor: 'pink'}}>
         <Svg width="100" height="100">
           <Path d="M90 0 L0 180 L180 180 Z" fill="red" />
         </Svg>
       </View>
     </View>
   );
 }
 

 const styles = StyleSheet.create({
   view: {
     flex: 1,
     alignItems: 'center',
     justifyContent: 'center',
   }

 });
 