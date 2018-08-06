ORGANIZATION_NAME='intoto'

base:
	pushd base && docker build -f Dockerfile -t $(ORGANIZATION_NAME)/base . && popd

verifier: base
	pushd verifier && docker build -f Dockerfile -t $(ORGANIZATION_NAME)/verifier . && popd

functionary: base
	pushd functionary && docker build -f Dockerfile -t $(ORGANIZATION_NAME)/functionary . && popd

.PHONY: base
