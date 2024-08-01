GOROOT=$(shell go env GOROOT)

GOMOD=$(shell test -f "go.work" && echo "readonly" || echo "vendor")
LDFLAGS=-s -w

rebuild:
	@make wasm

wasm:
	GOOS=js GOARCH=wasm go build -mod $(GOMOD) -ldflags="$(LDFLAGS)" -o static/wasm/validate_feature.wasm cmd/validate_feature/main.go

example:
	go run -mod $(GOMOD) cmd/example/main.go
