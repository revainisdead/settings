### My .bashrc ###

# Debug `source .bashrc` aka. print line numbers on error
#set -x
#set -eE -i functrace

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Includes
source /home/christian/bin/settings/utils.sh

#PS1='[\u@\h \W]\$ '

#export PS1="\[\033[1;30m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[1;30m\]]\[\033[1;30m\]$\[\033[00m\] "

# Show git branch in terminal
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add command completion for git aliases (defined in .gitconfig)
_git_odelete() {
    _git_branch
}
_git_newpush() {
    _git_branch
}
_git_fpush() {
    _git_branch
}
_git_mpush() {
    _git_branch
}
_git_merge() {
    _git_branch
}
_git_nmerge() {
    _git_branch
}

create_PS1() {
    # Add documentation to ps1 terminal line, ie:
    #    [christian@system76-pc (master) ~/bin/summit-knowledge-integration]$
    MAKE_BOLD_YELLOW="\[\033[1;33m\]"
    MAKE_BOLD_BLACK="\[\033[1;30m\]"
    MAKE_REG_GREEN="\[\033[0;32m\]"
    MAKE_RGB1="\[\033[38;5;246m\]"
    MAKE_RGB2="\[\033[38;5;246m\]"
    MAKE_NORMAL="\[\033[00m\]"
    LITERAL_DOLLAR="$"
    user="\u"           # see `man bash` -> PROMPTING
    hostname="\h"       # see `man bash` -> PROMPTING
    working_dir="\w"    # see `man bash` -> PROMPTING
    branch=$(parse_git_branch)

    echo "$MAKE_RGB1[$user@$hostname $MAKE_BOLD_YELLOW$branch $MAKE_BOLD_BLACK$MAKE_REG_GREEN$working_dir$MAKE_RGB2]$MAKE_RGB2$LITERAL_DOLLAR$MAKE_NORMAL "
}
#export PS1=$(create_PS1)

export PS1="\[\033[38;5;246m\][\u@\h \[\033[1;33m\]\$(parse_git_branch) \[\033[1;30m\]\[\033[0;32m\]\w\[\033[38;5;246m\]]\[\033[38;5;246m\]$\[\033[00m\] "

# Include local bin in path for vim 9
export PATH="/usr/local/bin:$PATH"

# Disable Ctrl-s (pause terminal): Inadvertently enable search with Ctrl-s (Ctrl-r: reverse search)
stty -ixon

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    # Use -n for line numbers (`git grep -n also`)
    alias grep='grep -n --color=auto'
    alias fgrep='fgrep -n --color=auto'
    alias egrep='egrep -n --color=auto'
fi

# Aliases
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../../"

# Warning: no longer able to pass arguments to cd using this method
#alias cd=pushd > /dev/null # overwrite cd to use pushd instead, so that I can go back multiple directories
#alias bb="popd && popd"
#alias bbb="popd && popd && popd"
#alias bbbb="popd && popd && popd && popd"

# Screenshots
alias flame="flameshot gui"
alias flamed="flameshot gui --delay 3000"
alias shots="kazam --area"
alias gif="peek"

# Tools
alias ls="ls --color=auto --group-directories-first"
alias lsswp="ls .*.swp"
alias lsdate="ls -tra" # t: list by date, a: show hidden, r: latest date first (reverse)
alias unzipper="tar -zxf"
alias installed="sudo apt list --installed"
alias installed_files="dpkg -L" # <package_name>
alias search="sudo apt-cache search"
alias local-pkg-install="sudo dpkg -i" # <package_name>
alias aliasgit="git config --get-regexp alias"
alias aliasbash="alias"
alias envbash="set"
# Note: The sha for the private and public key will be the same.
alias ssh_sha="ssh-keygen -lf ~/.ssh/id_rsa.pub"
alias ssh_md5="ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub"
alias openpic="xdg-open"
alias corner_drag_settings="ccsm"
alias summitvpn="cd /home/christian/bin/cable_dev_files/chall-incyte_vpn && sudo openvpn --config sk-vpn.ovpn --auth-user-pass credentials"
alias sha256="sha256sum" # {filename}
alias runomega="cd ~/Downloads/Omega_Launcher-Linux && ./'YGO Omega.x86_64' --reset"
alias gnome="gnome-extensions-app"

alias showdir="tree -aL 1 --dirsfirst --noreport" # Show current directory structure, no report, only one level deep

# Notes
alias grepper="grep -v -e -r"
# -e: regex ('e'xpression)
# -v: non-matching (in'v'erted)
# -r: search dirs ('r'ecursive)
#alias grepper_example="GREP_OPTIONS='-v' grep 'one' <<< printf 'line one\nline two\n'"
alias tz_example="TZ='America/Chicago' date"
alias tz_env_example="env TZ='America/Chicago' date"
alias tz_export_example="export TZ='America/Chicago; date"
# print new lines: use printf 'line one\n line two\n'

alias dp="docker ps" # === alias dc="docker container ls"
alias dcp="docker compose ps"
alias di="docker images"
alias dv="docker volume ls"
alias dl="docker compose logs -f --tail 20"
alias ddl="(cd docker && docker compose --env-file .dockerenv logs -f --tail 20)"
alias dlapi="docker compose logs -f --since 0m api"     # Quote / SpyGlass / Reaver
alias dlp="docker compose -f docker-compose-prod.yml logs -f --tail 20"
alias dn="docker network ls"
alias dockerip="docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' summit-knowledge-integration_db_1"
alias cleanlog="sudo sh -c 'truncate -s 0 /var/lib/docker/containers/*/*-json.log'"

# Container Consoles
alias spybash="docker compose exec -u root api /bin/bash"
alias spybash2="docker compose exec -u root falcon /bin/bash"
alias curl_sk_in_docker="curl -H 'Authorization: Token b0fcada58afcdfe8b161d656433e065a8ddfe431' http://sk-web:8000/api/v3/contracts/"
alias btbash="./script-docker/console -t web bash"

vimm() {
  if command vim --serverlist 2>/dev/null | grep -q MAIN; then
    # Open file with existing server using remote tab if already created
    command vim --servername MAIN --remote-tab "$@"
  else
    # Open file and create server with new server name if it does not exist
    command vim --servername MAIN "$@"
  fi
}
vimr() {
  if command vim --serverlist 2>/dev/null | grep -q RIGHT; then
    # Open file with existing server using remote tab if already created
    command vim --servername RIGHT --remote-tab "$@"
  else
    # Open file and create server with new server name if it does not exist
    command vim --servername RIGHT "$@"
  fi
}
alias vimservers="command vim --serverlist"

dockerIdFromName() {
    # Parse `docker images` output for id of image with name "summit-knowledge-integration_static_build"
    #SEARCH_TERM="summit-knowledge-integration_static_build"
    SEARCH_TERM=$1

    # Split line up into multiple lines using awk, delimeter being 3 spaces, print fourth line, finally remove all whitespace
    IMAGE_ID=$(docker images | grep $SEARCH_TERM | awk -F "\ \ \ " '{print $4}' | sed 's/^[[:space:]]*//g')

    # Run command on docker image (would need to update image from running container for this to work on current code)
    #docker run -i $IMAGE_ID lerna run test --stream

    echo Retrieved $IMAGE_ID \(using $SEARCH_TERM\)
}

# Git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gb="git branch"
alias gg="git grep -n"

# Diagnostics
alias ubuntu="lsb_release -a"
alias archs="dpkg --print-architecture"
alias openVims="ps -aux | grep vim | sed /grep/d"
alias devices="fwupdmgr get-devices --show-all-devices" # Bonus: `fwupdmgr update`

# Moving
alias down="cd ~/Downloads"
alias priv="cd /home/christian/private"
alias snips="cd /home/christian/Pictures/snippets"

alias bin="cd /home/christian/bin"
alias notes="cd /home/christian/bin/notes"
alias settings="cd /home/christian/bin/settings"
alias cl="cd /home/christian/bin/captains_log"
alias crh="cd /home/christian/bin/christian-revain-hall"

# Billing Tab
alias bt="cd ~/bin/summit-knowledge-integration/apex/" # billing tab
alias btw="cd ~/bin/summit-knowledge-integration/apex/workspace/" # workspace
alias btk="cd ~/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/" # knowledge
alias btl="cd ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/" # layer
alias btc="cd ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/components/data/" # components
alias btc2="cd ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/composables/" # composables
alias btp="cd ~/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/pages/job/" # page
alias btb="vim ~/bin/summit-knowledge-integration/server/utils/billing.py" # get_combined_charges_and_equipment
alias btplug="cd ~/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/plugins"
alias btu_old="cd ~/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/utils"
alias btu="cd ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/utils"
alias btn="cd ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/"
alias btbillable="vim ~/bin/summit-knowledge-integration/server/tickets/models/billable.py" # Open Billable model
alias btann="vim ~/bin/summit-knowledge-integration/server/tickets/models/billable.py -o ~/bin/summit-knowledge-integration/server/utils/billing.py" # Open Billing Tab files with annotations
alias btnuxt="vim ~/bin/summit-knowledge-integration/apex/workspace/layers/apex/nuxt.config.ts"
alias bt_billing_json="./manage.py runscript scripts.update_billable_json --script-args month=2025-10 plant=2004" # bash
alias btt="cd ~/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/i18n/locales/en_US"  # translations

# Build
alias btbuild="cd ~/bin/summit-knowledge-integration && docker compose exec apex pnpm --filter @summit/knowledge generate"
alias spyrebuild="make stop && make teardown && sleep 5 && make dev && sleep 5 && make restore-spyglass && sleep 30 && make stop && make dev && docker compose logs -f --tail 20"
alias hasurabuild="make export && make generate-types"
alias spybuild1="make export"
alias spybuild2="make generate-types"
alias spy_api_restart="docker compose restart api"

# aws
alias ssh_crh="ssh -i ~/private/first-ec2-salt-master-keys.pem ubuntu@ec2-3-132-194-70.us-east-2.compute.amazonaws.com"

# Cable Moving
alias ski="cd /home/christian/bin/summit-knowledge-integration"
alias erp="cd /home/christian/bin/erp-service"
alias log="cd /home/christian/bin/login-service"
alias rea="cd /home/christian/bin/reaver"
alias abb="cd /home/christian/bin/abby"
alias skq="cd /home/christian/bin/quote"
alias spy="cd /home/christian/bin/spyglass"
alias spyut="cd /home/christian/bin/spyglass/frontend/src/tests"
alias spycy="cd ~/bin/spyglass/frontend/cypress/component"
alias spytest="cd ~/bin/spyglass/frontend/ && npx cypress open"
alias spymod="cd /home/christian/bin/spyglass/frontend/src/models/"
alias spygen="cd /home/christian/bin/spyglass/frontend/src/assets/generated"
alias spyutil="cd /home/christian/bin/spyglass/frontend/src/utils"
alias spyc="cd /home/christian/bin/spyglass/frontend/src"
alias spycv="cd /home/christian/bin/spyglass/frontend/src/views"
alias spycc="cd /home/christian/bin/spyglass/frontend/src/components/"
alias spyccq="cd /home/christian/bin/spyglass/frontend/src/components/quotes/"
alias spys="cd /home/christian/bin/spyglass/"
alias spymig="cd /home/christian/bin/spyglass/hasura/migrations/default"
alias spyresetdb="make teardown && sleep 5 && make dev && make restore-spyglass"
alias spymd="cd /home/christian/bin/spyglass/hasura/metadata"
alias comp="cd /home/christian/bin/spyglass/frontend/src/components/quotes"
alias spystore="cd /home/christian/bin/spyglass/frontend/src/store"

alias ski2="cd /home/christian/bin/sk2/summit-knowledge-integration2"
alias erp2="cd /home/christian/bin/sk2/erp-service2"
alias log2="cd /home/christian/bin/sk2/login-service2"

alias cdf="cd /home/christian/bin/cable_dev_files"

alias spec="cd /home/christian/bin/summit-knowledge-integration/client/spec/cable-ticket"
alias specmod="cd /home/christian/bin/summit-knowledge-integration/client/spec/core/models"
alias specm="cd /home/christian/bin/summit-knowledge-integration/client/spec/core/models"
alias stash="cd /home/christian/bin/stash"

alias cab="cd /home/christian/bin/summit-knowledge-integration/client/src/cable-ticket"
alias charges="cd /home/christian/bin/summit-knowledge-integration/client/src/charges"
alias cabb="cd /home/christian/bin/summit-knowledge-integration/client/src/cable-board"
alias cocm="cd /home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm"
alias job="cd /home/christian/bin/summit-knowledge-integration/client/src/job"
alias mod="cd /home/christian/bin/summit-knowledge-integration/client/src/core/models"
alias core="cd /home/christian/bin/summit-knowledge-integration/client/src/core"
alias tick="cd /home/christian/bin/summit-knowledge-integration/server/tickets"
alias sk="cd /home/christian/bin/summit-knowledge-integration/server/sk"
alias printct="cd /home/christian/bin/summit-knowledge-integration/server/tickets/templates/print/tickets"

alias aifiles="vim ~/bin/summit-knowledge-integration/.github/copilot-instructions.md -o ~/bin/summit-knowledge-integration/AGENTS.md"
alias co="cd ~/.copilot"

#/home/christian/bin/summit-knowledge-integration/server/sk/tasks
#/home/christian/bin/summit-knowledge-integration/client/src/core/save-button

# Greater Than Paper
alias gtp="cd /home/christian/bin/gtpaper-venv/gtpaper"
alias gtpact="source /home/christian/bin/gtpaper-venv/bin/activate"

alias opg="cd /home/christian/bin/opg-venv/one-percent-growth"
alias opgact="source /home/christian/bin/opg-venv/bin/activate"
alias opgs="cd /home/christian/bin/opg-venv/one-percent-growth/server"
alias opgc="cd /home/christian/bin/opg-venv/one-percent-growth/client"

alias osrs="flatpak run com.jagexlauncher.JagexLauncher"


# Run `getpathrc` to get the full path of a local file and append it to the file.
f_array=()
f_array+=("# Notable files")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/inventory/views.py") # ERP /v1 passthrough example (if self.use_s4)
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/views.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/serializers.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/cable.py") # CableTicket, CableSegment
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/abstract.py") # CableSegmentAbstractModel
f_array+=("/home/christian/bin/summit-knowledge-integration/server/templates/index_sk.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/api_v3_urls.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/views.py") # ERPServiceProxyViewSet
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/rest_serializers.py") # NestedListSerializer
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/erp.py") # ERPClient
f_array+=("/home/christian/bin/summit-knowledge-integration/client/grunt-config-new.json")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm/cableModalService.service.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/vendor/cancelableResource.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/js/app-chaplin/routes.js") # Front End Routing
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/uiselect.directive.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/uiselectSearches.service.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/filters/findChoice.filter.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/ERPEquipment.factory.coffee") # MLE
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/Store.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/StorageEngine.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/_SpecRunner.html") # Changing file names, go here too.
f_array+=("/home/christian/bin/summit-knowledge-integration/client/js/vendor/jasmine-2.3.4/jasmine.js")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/filters.py") # TicketFilter

f_array+=("# SK Overview")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/templates/index_sk.html") # SK Entrypoint: HomeView
f_array+=("/home/christian/bin/summit-knowledge-integration/client/css/images") # Add images via css
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/views.py") # HomeView
f_array+=("/home/christian/bin/summit-knowledge-integration/server/locale/en_US/LC_MESSAGES/django.po") # i18next files

f_array+=("# Docs")
f_array+=("/home/christian/bin/summit-knowledge-integration/src/login-service-backend/login_service_backend.egg-info/PKG-INFO")

f_array+=("# ERP")
f_array+=("/home/christian/bin/erp-service/inventory/filters.py")
f_array+=("/home/christian/bin/erp-service/inventory/views.py")
f_array+=("/home/christian/bin/erp-service/sap/tests/fixtures/utils.py")
f_array+=("/home/christian/bin/erp-service/sap/tests/conftest.py")          # @pytest.fixture
f_array+=("/home/christian/bin/erp-service/sap/tests/fixtures/cable_reel_return_fixtures.py")
f_array+=("/home/christian/bin/erp-service/sap/tests/fixtures/cable_reel_return_base_fixtures.py")

f_array+=("# Three model files to keep open")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/charges.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/cable.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/base.py") # _get_erp_material

f_array+=("# Print Ticket/PDF")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/mailer/mixins.py")       # PDFViewMixin (*render_pdf_response*)
f_array+=("/home/christian/bin/summit-knowledge-integration/server/mailer/views.py")        # TicketPDFView
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/views/misc.py")  # TicketPrintView
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/pdf_gen.py")     # generate_ticket_pdf (used by PDFViewMixin)
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/tests/view_tests.py") # TicketPrintViewTests
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/templatetags/cable_ticket_tags.py") # Cable Tags
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/templates/print/tickets/cable_ticket.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/templates/print/tickets/cable_ticket_section.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/templates/print/tickets/cable_segments.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/css/print_styles.styl") # Print css

f_array+=("# Add Material")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/search-dialog/cableMaterialSearchDialog.directive.coffee") # Add Material (from cable ocm)
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/cable-ticket/material-segment/materialSearchDialog.directive.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/spec/cable-ticket/material-segment/materialSearchDialog.directive.spec.coffee") # Tests
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/cable-ticket/material-segment/materialSegmentsModalController.ctrl.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/spec/cable-ticket/material-segment/materialSegmentsModalController.spec.coffee") # Tests

f_array+=("# Import Modal")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/PlanningOrderMaterial.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm/import-cable/importCableModal.ctrl.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/cable-ocm/cableTab.directive.coffee") # Important Import

f_array+=("# Charges total_price")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/Charge.factory.coffee")  # totalPrice
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/charges.py")      # calc_cable_charge_price
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/serializers.py")         # get_charges

f_array+=("# Celery")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/tasks/__init__.py") # celery task created: shared_task()
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/views/cable_ticket_mixins/install.py") # views urls
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/tasks/erp_transactions.py")   # celery events: cable
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/tasks/notifications.py")      # celery events: wave1
f_array+=("/home/christian/bin/summit-knowledge-integration/server/sk/celery.py")                   #
f_array+=("/home/christian/bin/summit-knowledge-integration/server/celery_local_dev.py")            #

f_array+=("# Overview")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/invoicing-tab.html")     # Overview
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/ticket-row.html")        # Overview Line Item

f_array+=("Learn")
f_array+=("/home/christian/bin/erp-service/sap/models.py")
# ERPRequest(TokenRequest)

f_array+=("ERP Transactions")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/ERPTransaction.factory.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/rest_serializers.py")  # NestedListSerializer
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/request.py")           # RequestCaptureMiddleware

f_array+=("Custom Ordering")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/work_order_requests/ordering.py")    # WorkOrderRequestOrdering

f_array+=("Inbound Board")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/inbound-board/list-equipment-tickets.html")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/inbound-board/listEquipmentTicket.ctrl.coffee")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/spec/inbound-board/listEquipmentTicket.spec.coffee")

f_array+=("/home/christian/bin/summit-knowledge-integration/server/events/record.py")           # Job History Tab (Record Events)
f_array+=("/home/christian/bin/summit-knowledge-integration/server/events/event_types.py")      # Job History Tab (Record Events)
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/models/Event.factory.coffee")   # Job History Tab
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/job/eventListTab.directive.coffee")  # Job History Tab

f_array+=("Server Scripts (Prod)")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/scripts/charge_material_numbers_equipment_type_conversions.py")

f_array+=("CSS")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/core/main.styl")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/css/summit.styl")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/charges/charges.styl")
f_array+=("/home/christian/bin/summit-knowledge-integration/client/src/cable-ticket/cable-ticket.styl")

# Billing Tab
f_array+=("Billing Tab")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/jobs/models.py")     # get_salesforce_data, envelope_salesforce_data, callout_job_payload
f_array+=("/home/christian/bin/summit-knowledge-integration/server/utils/billing.py")
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/abstract.py")     # class Billable
f_array+=("/home/christian/bin/summit-knowledge-integration/server/tickets/models/billable.py")     # annotations
f_array+=("/home/christian/bin/summit-knowledge-integration/apex/workspace/apps/knowledge/pages/job/[id]/billing.vue")
f_array+=("/home/christian/bin/summit-knowledge-integration/apex/workspace/layers/apex/components/data/charge/DataChargeTable.vue")
f_array+=("/home/christian/bin/summit-knowledge-integration/apex/workspace/layers/apex/components/data/charge/DataChargeAssignmentGrid.vue")
f_array+=("/home/christian/bin/summit-knowledge-integration/apex/workspace/layers/apex/components/data/charge/DataChargeAddDialog.vue") # mutateCharge
f_array+=("/home/christian/bin/erp-service/s4/utils.py")        # UseS4DataForSKAPI

f_array+=("")
#f array end

alias gar="cd /home/christian/bin/garden-venv/garden/"
alias gar-act="source ../bin/activate"

# Alias functions
quotesgrep() {
    # -I: exclude binary file mathcing
    echo Checking for $1 wrapped in single quotes . . .
    grep -I -r --exclude-dir={node_modules,react-with-addons} "\'$1\'" .
    echo Checking for $1 wrapped in double quotes . . .
    grep -I -r --exclude-dir={node_modules,react-with-addons} "\"$1\"" .
}

exgrep() {
    echo Checking for $1 excluding node_modules and react-with-addons . . .

    # Needed to quote the argument $1 below or the escaped values would not work
    # -I: exclude binary file mathcing
    grep -I -r --exclude="tags" --exclude-dir={node_modules,react-with-addons,site-packages,notes,vendor,app-chaplin,.grunt,app-components,.git,static,media,snap} "$1" .
}

findname() {
    echo Searching for file name containing $1...

    # Grep preferrable to -name because it prints matches in color
    # To exlude folders from find use:
    # `find . -type d \( -path ./.git -o -path ./node_modules -o \) -prune - false -o -name '*.txt'`

    # Add quote at beginning and end of each line to be able to expand and send to rm command
    # s/^/'/ Replace beginning of line with a tick
    # s/$/'/ Replace end of line with a tick
    #find . -type f -print | grep "$1" | sed "s/^/'/;s/$/'/"
    # Summary: turns out not needed, can use `rm $(findname .test1)` without quoting output and it works.

    # Use sed to exclude directories from output
    find . -type f -print | grep "$1" | sed "/node_modules/d" # Delete entire line containing string
}

finddir() {
    echo Searching for folder name containing $1...
    # this does not work for "contain", must be exact match
    find . -type d -name $1

    # might want to do something similar to this but this prints each file path match
    #find . -type d | grep $1
}

getpath() {
    # Or could use . for directory, equivalent
    #find "$PWD" -name $1
    
    # Or
    readlink -f $1
}
getpathrc() {
    echo Printing the absolute path for \"$1\"... \(and adding to .bashrc\)
    # overwrite: >
    # append: >>
    # stderr: &>
    # stderr append: &>>
    # stderr overwrite w/ terminal putput: 2>&1 | tee

    find "$PWD" -name $1
    find "$PWD" -name $1 >> ~/.bashrc

}

printNotable() {
    # Now defined above
    #declare -a arr=($f1, $f2, $f3)

    for item in "${f_array[@]}"
    do
        echo "$item"
    done | less
}

# Cleanup
removeVimUndo() {
    # Use sed to remove lines containing 'node_modules'
    files=$(find . -type f -print | grep ".un~" | sed "/node_modules/d")
    rm $files
}

vimswap() {
    # Get full path of file name
    #file=$( find "$PWD" -name "$1" )

    file=$1
    swapfile="${file}.swp"
    DO_SWAP=0

    echo "File value: $file"

    # Find Vim process using the file and kill it
    pid=$(pgrep -f "vim $file")

    if [ -n "$pid" ]; then
        echo "Vim is already open for this file in another tab (PID: $pid)."

        echo "Closing Vim instance..."
        kill -SIGTERM "$pid"

        echo "Waiting to close..."
        sleep 1  # Give some time for the process to close
        echo "Continuing..."
        sleep 1
    fi

    # Check if the swap file exists and remove it
    if [ -f "$swapfile" ]; then
        echo "Swap file detected: $swapfile"
        echo "Removing swap file..."

        DO_SWAP=1
    fi

    if [ $DO_SWAP -eq 1]; then
        # Idea: instead of removing the swap file,
        #       create a local copy and move to a
        #       directory of back up swap files.
        #       The concern is losing unsaved code.
        rm "$swapfile"
    fi

    # or load up from swap file first to guarantee no missing code?
    # problem: this will remove the new swap file... save fixes
    #if [ $DO_SWAP -eq 1 ]; then
    #    vim -r "$file" && rm "$swapfile"
    #    #rm -i "$swapfile"
    #else
    #    vim "$file"
    #fi

    # Open the file in Vim
    vim "$file"
}

set_razer_mouse_speed() {
    # Ex. set_razer_mouse_speed -0.3
    local mouse_name="Razer Basilisk Ultimate"
    local accel_speed="${1:--0.3}"

    # Get the matching xinput line
    local device_line
    device_line=$(xinput list | grep "$mouse_name")

    if [[ -z "$device_line" ]]; then
      echo "❌ Mouse '$mouse_name' not found."
      return 1
    fi

    # Extract the id from the line (finding `id=11` pattern)
    local id
    id=$(echo "$device_line" | sed -n 's/.*id=\([0-9]\+\).*/\1/p')

    # Apply settings
    xinput set-prop "$id" "libinput Accel Profile Enabled" 0, 1
    xinput set-prop "$id" "libinput Accel Speed" "$accel_speed"

    echo "✅ Set '$mouse_name' (ID $id) to flat profile and accel speed $accel_speed"
}

print_check_emoji() {
    printf '\xE2\x9C\x85\n'
}

#alias db="cd /mnt/dev/opt/cyberfire && auto -u postgres psql cyberfire"
#alias db2="psql -U postgres"

# Django
#alias run="sudo python3 manage.py runserver --nothreading 0.0.0.0:8080"
#alias mm="python3 manage.py makemigrations"
#alias m="python3 manage.py migrate"
#alias link="sudo python manage.py collectstatic --link"

#alias private="ecryptfs-mount-private"
#alias uprivate="ecryptfs-umount-private"
#alias sd="uprivate && sudo telinit 0"

#alias neo="cd ~/bin/matrix && python matrix.py"

# slap dap -LDAP- lap
#alias ldapcdconf="cd /etc/openldap"
#alias ldapconf="sudo vim /etc/openldap/slapd.conf"
#alias ldapcddb="cd /var/lib/openldap/openldap-data"
#alias ldapconftest="sudo slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d/"

# Add python 3.4 to path permanently (old computer)
#alias py2="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python2"
#alias py3="export PATH=/home/christian/.gem/ruby/2.3.0/bin:/home/christian/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python3"



### Ubuntu Defaults ###

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
