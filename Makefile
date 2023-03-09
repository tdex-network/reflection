
.PHONY: fmt lint proto test

## fmt: Go Format
fmt:
	@echo "Checking code format..."
	@if [ -n "$(gofmt -l .)" ]; then echo "Go code is not formatted"; exit 1; fi

## proto-lint: lint protos
lint:
	@echo "Linting protos..."
	@buf lint

## proto: compile proto stubs
proto: lint
	@echo "Compling stubs..."
	@buf generate

## test: runs unit tests
test: fmt
	@echo "Running unit tests..."
	@go test -v -count=1 -race ./...