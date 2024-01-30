#!/usr/bin/env bash

printf "aad app pub get\n"
flutter clean && flutter clean cache && flutter pub get
dart run build_runner build --delete-conflicting-outputs
printf '\n\n'

printf "core pub get\n"
cd core || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "core_ui pub get\n"
cd core_ui || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'


printf "dashboard pub get\n"
cd features/dashboard || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "admin pub get\n"
cd features/admin || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'
