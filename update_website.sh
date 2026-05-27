
#!/bin/sh

git fetch

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
   echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
	git pull && rm -rf build/* && ./../Blog/build/Src/blog -out=build   -in=posts   -static=Resources   -blogTemplate=Resources/BlogPageTemplate.html   -atomTemplate=Resources/AtomFeedTemplate.xml   -url=http://bobyn.uk/  && docker restart cv-website

elif [ $REMOTE = $BASE ]; then
   echo "Need to push"
else
   echo "Diverged"
fi
