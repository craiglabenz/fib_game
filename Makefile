app/build:
	dart run build_runner build --delete-conflicting-outputs

app/run:
	flutter run -d macos

app/test:
	flutter test