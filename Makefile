ORGANIZATION_NAME='intoto'

base:
	docker build -f base/Dockerfile -t $(ORGANIZATION_NAME)/base .

functionary: base
	docker build -f functionary/Dockerfile -t $(ORGANIZATION_NAME)/functionary .
.PHONY: base 
