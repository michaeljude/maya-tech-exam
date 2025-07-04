.PHONY: update_data update_dependencies models models_domain models_design_system

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
	cd data/maya_services && dart run build_runner build --delete-conflicting-outputs

models_design_system:
	cd design_system && dart run build_runner build --delete-conflicting-outputs

