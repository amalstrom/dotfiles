cd; cd development/Etsyweb;

# PATH variables
export PATH="/usr/local/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/amalstrom/anaconda3/bin:$PATH"

# Directory management
alias web="cd; cd development/Etsyweb/;"
alias email="cd; cd development/salesforce-templates/;"
alias search="cd; cd development/Search/;"
alias data="cd; cd development/BigData/;"

# Fuzzy finder
alias fuz="vim \$(fzf)"
export FZF_DEFAULT_OPTS="--reverse"

# Logging
export il="/var/log/httpd/info.log"
export el="/var/log/httpd/php.log"
alias info="tail -f /var/log/httpd/info.log"
alias error="tail -f /var/log/httpd/php.log"

# Config management
alias prod="vim ~/development/Etsyweb/phplib/EtsyConfig/production.php"
alias mydev="vim ~/development/Etsyweb/phplib/EtsyConfig/local_development.php"
alias dev="vim ~/development/Etsyweb/phplib/EtsyConfig/development.php"

# try
alias tryp="try -P"
alias try-configp="try-config -P"

# Code reviews
alias gistdiff="git diff | gist -t diff"
function gistdiff_file {
    git diff -w "$@"| gist -t diff;
}
# function re {
#     review -r $1 -c adx-eng -a adx-squad
# }

# Jupyter
alias notebook="jupyter notebook --ip=0.0.0.0 --port=5678 --no-browser"
alias vsql="/opt/vertica/bin/vsql -h vertica-prod -U amalstrom"

# Test coverage
alias test_coverage="bin/test_eng/getEstimatedCoverageByEmail.php"

# Break listing card cache: kick_thrift listing_ids.txt
function kick_thrift {
    bin/drift/replicate_some.php Drift_Config_Dbsearch3_Listings $1;
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
