#!/usr/bin/env bash

printf "aad app pub get\n"
flutter clean && flutter clean cache && flutter pub get
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

printf "data pub get\n"
cd data || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "data generate\n"
cd data || exit
dart run build_runner build --delete-conflicting-outputs
cd ..
printf '\n\n'

printf "domain pub get\n"
cd domain || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "dashboard pub get\n"
cd features/dashboard || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'
