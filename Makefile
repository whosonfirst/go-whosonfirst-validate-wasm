GOROOT=$(shell go env GOROOT)

GOMOD=$(shell test -f "go.work" && echo "readonly" || echo "vendor")
LDFLAGS=-s -w

TINYGO=tinygo

rebuild:
	@make wasm

wasm:
	GOOS=js GOARCH=wasm go build -mod $(GOMOD) -ldflags="$(LDFLAGS)" \
		-o static/wasm/validate_feature.wasm \
		cmd/validate-feature-wasmjs/main.go

wasi:
	GOOS=wasip1 GOARCH=wasm go build -mod $(GOMOD) -ldflags="$(LDFLAGS)" \
		-o static/wasi/validate_feature.wasm \
		./cmd/validate-feature-wasip/main.go

example:
	go run -mod $(GOMOD) cmd/example/main.go
