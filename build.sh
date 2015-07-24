for f in `find . -name "*.lua" -type f -not -path '*/\.*' -not -path '*init.lua'`
do
  lc="${f%lua}lc"
  echo "compile ${f} to ${lc}"
  luac -o $lc $f
done
