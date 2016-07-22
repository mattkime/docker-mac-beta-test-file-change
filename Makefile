build:
	docker build -t dev .

run: build
	docker run --rm dev
