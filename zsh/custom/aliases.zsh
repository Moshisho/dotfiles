alias runmongo="docker rm mongo-5.0 && docker run --name mongo-5.0 -v ~/mongo/data:/data/db -p 27017:27017 mongo:5.0.6" 
alias runserver="cd ~/dev/sibp/server && npm start"
alias runworker="cd ~/dev/sibp/server && npm run worker"
alias runember="cd ~/dev/sibp/front-end && NODE_OPTIONS=\"--openssl-legacy-provider\" ember s"
alias cda="cd ~/dev/sibp-automation"
alias python='python3'
alias gmo="git fetch; git merge origin main" 
alias ffnotify="ffmpeg -i $1 $2 && osascript -e 'tell app \"System Events\" to display dialog \"Finished!\""
alias work="cd ~/dev/Work/"
