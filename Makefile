.PHONY: build dev composer craft up install

build: up
	ddev exec npm run build
dev: build
	ddev launch
	ddev exec npm run serve
composer: up
	ddev composer \
		$(filter-out $@,$(MAKECMDGOALS))
craft: up
	ddev exec php craft \
		$(filter-out $@,$(MAKECMDGOALS))
install: up build
	ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft install \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft plugin/install cp-field-inspect
	ddev exec php craft plugin/install knock-knock
	ddev exec php craft plugin/install typedlinkfield
	ddev exec php craft plugin/install redactor
	ddev exec php craft plugin/install seomatic
	ddev exec php craft plugin/install vite
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
        ddev auth ssh; \
        ddev start; \
        ddev composer install; \
        ddev exec npm install; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
