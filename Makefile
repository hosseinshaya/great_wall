clean-get: clean get

get:
	flutter pub get 

clean:
	flutter clean

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

langs:
	flutter pub run easy_localization:generate --output-dir "lib/common/localization" -f keys -o locale_keys.g.dart