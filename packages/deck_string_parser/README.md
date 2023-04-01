<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package houses the business logic for parsing deck strings provided by users into relevant objects.

## Features
For logic diagrams, refer to [this issue post](https://github.com/BAA-Studios/CastFORM/issues/1).

The provided string should be split into a map of string to string array pairs.
The resulting map should then be further processed into objects, with unnecessary details stripped out.
Lastly, some level of validation should be offered to allow downstream packages to notify the user if the provided deck is illegal to play. 

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

This package is intended to be used and included as a core component of [CastFORM](https://github.com/BAA-Studios/CastFORM).
