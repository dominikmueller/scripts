filepath=`pwd`

if [[ -z "$1" ]]; then
  echo >&2 "You must supply two arguments. First one is the string to replace. Second one is the replacement string."
  exit 1
elif [[ -z "$2" ]]; then
  echo >&2 "You must supply a string which should replace the first one as second argument."
  exit 1
fi

searchstring=$1
replacestring=$2

i=0; 

for file in $(grep -l -R $searchstring $filepath)
do
#  cp $file $file.bak
  sed -e "s/$searchstring/$replacestring/g" $file > tempfile.tmp
  mv tempfile.tmp $file

  let i++;

  echo "Modified: " $file
done
