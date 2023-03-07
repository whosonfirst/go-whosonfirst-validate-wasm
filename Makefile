GOROOT=$(shell go env GOROOT)
GOMOD=readonly

rebuild:
	@make wasm

wasm:
	GOOS=js GOARCH=wasm go build -mod $(GOMOD) -ldflags="-s -w" -o static/wasm/validate_feature.wasm cmd/validate_feature/main.go

example:
	go run -mod $(GOMOD) cmd/example/main.go
