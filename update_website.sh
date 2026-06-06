#!/bin/sh
export GIT_SSH_COMMAND="ssh -i /home/bob/.ssh/deploy_blog -o IdentitiesOnly=yes"
export PATH="/usr/local/bin:/usr/bin:/bin"

REPO="/home/bob/Websites/BlogPosts"
BLOG_BIN="/home/bob/Websites/Blog/build/Src/blog"
cd "$REPO" || exit 1

git fetch
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Up-to-date"
elif [ "$LOCAL" = "$BASE" ]; then
    git pull \
      && rm -rf build/* \
      && "$BLOG_BIN" -out=build -in=posts -static=Resources \
           -blogTemplate=Resources/BlogPageTemplate.html \
           -atomTemplate=Resources/AtomFeedTemplate.xml \
           -url=http://bobyn.uk/ \
	&& sudo /usr/bin/docker restart cv-website
elif [ "$REMOTE" = "$BASE" ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
