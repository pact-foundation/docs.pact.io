#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && source ~/.bashrc && nvm install 18
echo "=> Downloading Golang Plugin Template"
git clone https://github.com/pact-foundation/pact-plugin-template-golang.git
git clone https://github.com/pact-foundation/example-project-js-foobar-plugin.git

project=example-project-js-foobar-plugin

echo "Changing into directory of the project: $project"
cd ~/$project
npm i

project=pact-plugin-template-golang
echo "Changing into directory of the project: $project"
cd ~/$project
rm -rf .git
git init

export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
apt --yes install jq && clear && cat <<-END
"Welcome to the Pact Plugin tutorial, all the dependencies are installed, and you should be good to go!
You are in $project directory
You can switch to the editor tab, to look in the code
press ctrl+p or cmd +p in the editor window, to search for a specific file in the $project directory"
END
