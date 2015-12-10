all:
	build

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build       - build the openresty image"
	@echo "   2. make stop        - stop openresty"
	@echo "   3. make logs        - view logs"
	@echo "   4. make purge       - stop and remove the container"

build:
	@docker build --tag=dseg/openresty-http2 .

release:
	@docker build --tag=dseg/openresty-http2:$(shell cat VERSION) .

stop:
	@echo "Stopping openresty..."

purge: stop
	@echo "Removing stopped container..."
	@docker rm openresty > /dev/null

logs:
	@docker logs -f openresty
