GOROOT=$(shell go env GOROOT)
GOMOD=$(shell test -f "go.work" && echo "readonly" || echo "vendor")

rebuild:
	@make wasm

wasm:
	GOOS=js GOARCH=wasm go build -mod $(GOMOD) -ldflags="-s -w" -o static/wasm/validate_feature.wasm cmd/validate_feature/main.go

wasip:
	GOARCH=wasm GOOS=wasip1 go build -mod $(GOMOD) -ldflags="-s -w" -o static/wasip/validate_feature.wasm cmd/validate_feature_wasi/main.go

example:
	go run -mod $(GOMOD) cmd/example/main.go
