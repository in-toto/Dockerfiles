ORGANIZATION_NAME='intoto'

base:
	docker build -f base/Dockerfile -t $(ORGANIZATION_NAME)/base .

.PHONY: base
