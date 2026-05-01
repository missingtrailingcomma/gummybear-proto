.PHONY: generate

PROTO_FILES := $(shell find proto/ -name "*.proto")

generate:
	mkdir -p gen/go
	mkdir -p gen/ts

	protoc \
		--proto_path=proto \
		--go_out=gen/go --go_opt=paths=source_relative \
		--go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)

	@pnpm exec protoc \
		--proto_path=proto \
		--ts_out=gen/ts \
		--ts_opt=long_type_number \
		$(PROTO_FILES)
