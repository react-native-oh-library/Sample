# RNOH Example App  

This is a sample application for RNOH, showcasing custom third-party libraries.  

## rtn-centered-text
`/RTNCenteredText`
A Fabric-based example of a custom React Native library, providing both ArkTS and C-API native implementations.  

## rtn-calculator
`/RTNCalculator`
A TurboModule-based example of a custom React Native library.

## Running tester app using the Metro Bundler

1. Go to the `/exampleApp`
2. Run `npm i`
3. Run `npm run dev`
4. Open `/example/harmony` in DevEco Studio
5. Start the HarmonyOS emulator or connect to real device
6. Run `hdc rport tcp:8081 tcp:8081`
If `hdc` is not in your `PATH`, it can be found under `{SDK LOCATION}/HarmonyOS-NEXT-DP1/base/toolchains`
7. Start metro by running `npm run start`
8. Build and run entry module
