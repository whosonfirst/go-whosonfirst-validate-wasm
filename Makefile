GOROOT=$(shell go env GOROOT)

rebuild:
	@make wasm

wasm:
	GOOS=js GOARCH=wasm go build -mod vendor -ldflags="-s -w" -o static/wasm/validate_feature.wasm cmd/validate_feature/main.go

example:
	go run -mod vendor cmd/example/main.go
