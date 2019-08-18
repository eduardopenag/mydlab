CONFIG_DIR=../config


default: 
	@echo "Have you tried reading the docs first? For example... the README in the upper dir?"

all: check_requirements build
# 	@echo "# - Alias for make check_requirements build"

install: check_requirements install_templates 
# 	@echo "# - Alias for make install_templates build_images deploy_stacks"

clean:
	@echo "# ------------------------------------------------------------------------"
	@echo "# - Delete temporary files in SRC directory"
	@echo "#"
	rm -rf ../install/

check_requirements: 
	@echo "# ------------------------------------------------------------------------"
	@echo "# - Verify that the environment defined in $(DLAB_ENVFILE) is correct"
	@echo "#"
	@./check_requirements.sh

build: 
	@echo "# ------------------------------------------------------------------------"
	@echo "# - Prepare the templates and binaries based on $(DLAB_ENVFILE)"
	@echo "#"
	@./build.sh

install_templates: 
	@echo "# ------------------------------------------------------------------------"
	@echo "# - Copy (or overrides) the toolscfg and binaries into DLAB_HOME (see "
	@echo "# - default_env.sh for more details)."
	@echo "#"
	@./install_templates.sh

load_installed_env:
	@echo "# - load_installed_env"
	@./load_installed_env.sh

# build_images: 
# 	@echo "# ------------------------------------------------------------------------"
# 	@echo "# - Start registry, build and push all required docker images."
# 	@echo "#"
# 	@./build_images.sh

# deploy_stacks: load_installed_env
# 	@echo "# ------------------------------------------------------------------------"
# 	@echo "# - Deploy all stacks and starts reverse proxy"
# 	@echo "# ------------------------------------------------------------------------"

fresh_install: remove_previous_datalab check_requirements
	@echo "# ------------------------------------------------------------------------"
	@echo "# - Deletes any DATALAB installation in your cluster and starts from "
	@echo "# - scratch. Use at your own risk."
	@echo "#"

sanity_check: env
	@echo "# - I'm perfectly sane"


man:
	@echo "# - Installing documentation. (or nothing to do)"

env:
	./load_default_env.sh
