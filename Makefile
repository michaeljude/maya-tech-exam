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

setup_all:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	cd data && \
	for module in */; do \
		cd $$module && flutter pub get && dart run build_runner build --delete-conflicting-outputs && cd ..; \
	done
	cd domain && flutter pub get && dart run build_runner build --delete-conflicting-outputs && cd ..
	cd design_system && flutter pub get && cd ..

