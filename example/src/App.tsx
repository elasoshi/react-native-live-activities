import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { createActivity, endAllActivity } from 'react-native-live-activities';

export default function App() {
  return (
    <View style={styles.container}>
      <Button title="start activity" onPress={() => createActivity()} />
      <Button title="end" onPress={() => endAllActivity()} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
