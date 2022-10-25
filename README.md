# react-native-live-activities

IOS Live Activities for react native

## Installation

```sh
npm install react-native-live-activities
```

```sh
npx pod-install
```

## Usage

```js
import { createActivity, endAllActivity } from 'react-native-live-activities';

// ...

export default function App() {
  return (
    <View style={styles.container}>
      <Button title="start activity" onPress={() => createActivity()} />
      <Button title="end" onPress={() => endAllActivity()} />
    </View>
  );
}
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
