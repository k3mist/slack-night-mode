all: clean build

build: default raw variants rawvariants

clean:
	rm -rf css
	mkdir -p css/variants css/raw/variants

default:
	node-sass -t compact scss/main.scss css/black.css

variants:
	for sass in scss/themes/build-variants/*--main.scss; do \
		theme=`basename $$sass --main.scss`; \
	node-sass -t compact $$sass css/variants/$$theme.css; done

raw:
	node-sass -t compact scss/styles.scss css/raw/black.css

rawvariants:
	for sass in scss/themes/build-variants/*--styles.scss; do \
		theme=`basename $$sass --styles.scss`; \
	node-sass -t compact $$sass css/raw/variants/$$theme.css; done
