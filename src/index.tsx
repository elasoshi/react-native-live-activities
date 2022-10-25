import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-live-activities' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const LiveActivities = NativeModules.LiveActivities
  ? NativeModules.LiveActivities
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function createActivity(): Promise<number> {
  return LiveActivities.createActivity();
}

export function endAllActivity(): Promise<number> {
  return LiveActivities.endAllActivity();
}
