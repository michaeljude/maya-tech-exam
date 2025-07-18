.PHONY: update_data setup_dependencies models models_domain models_design_system

update_data:
	cd data && \
	for module in */; do \
		cd $$module && flutter pub get && cd ..; \
	done

setup_dependencies:
	flutter pub get
	cd domain && flutter pub get
	cd ../design_system && flutter pub get

models:
	dart run build_runner build --delete-conflicting-outputs

models_domain:
	cd domain && dart run build_runner build --delete-conflicting-outputs

models_js:
	cd data/json_serializable && dart run build_runner build --delete-conflicting-outputs

models_maya:
	cd data/maya && dart run build_runner build --delete-conflicting-outputs

run_tests:
	flutter test test/features/home/home_view_model_test.dart
	flutter test test/features/send_money/send_money_view_model_test.dart
	flutter test test/features/transactions/transactions_view_model_test.dart
	cd domain/test/services && flutter test wallet_service_test.dart && flutter test authentication_service_test.dart
	cd data/maya/test && flutter test maya_repository_test.dart

setup_all:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	cd data && \
	for module in */; do \
		cd $$module && flutter pub get && dart run build_runner build --delete-conflicting-outputs && cd ..; \
	done
	cd domain && flutter pub get && dart run build_runner build --delete-conflicting-outputs && cd ..
	cd design_system && flutter pub get && cd ..

