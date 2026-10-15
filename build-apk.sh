#!/usr/bin/env bash
# ОкоМрежа — билд на APK. Изисква JDK 17 и Android SDK (ANDROID_HOME/ANDROID_SDK_ROOT).
set -e
cd "$(dirname "$0")"

if [ -z "$ANDROID_HOME" ] && [ -z "$ANDROID_SDK_ROOT" ]; then
  echo "⚠  Няма зададен Android SDK (ANDROID_HOME или ANDROID_SDK_ROOT)."
  echo "   Най-лесно: отвори папката в Android Studio и Build → Build APK(s)."
  echo "   Или инсталирай cmdline-tools и задай ANDROID_HOME."
  exit 1
fi

echo "▶ Билдвам debug APK…"
./gradlew assembleDebug

APK="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK" ]; then
  echo
  echo "✅ Готово: $APK"
  echo "   Прехвърли го на телефона и го инсталирай."
else
  echo "✖ Нещо се обърка — APK не е намерен."
  exit 1
fi
