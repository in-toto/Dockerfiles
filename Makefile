ORGANIZATION_NAME='intoto'

base:
	docker build -f base/Dockerfile -t $(ORGANIZATION_NAME)/base .

verifier: base
	docker build -f verifier/Dockerfile -t $(ORGANIZATION_NAME)/verifier .

functionary: base
	docker build -f functionary/Dockerfile -t $(ORGANIZATION_NAME)/functionary .

.PHONY: base
