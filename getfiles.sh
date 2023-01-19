#!/bin/bash

serverArray=(server1.com server2.com)
repoArray=(sr1 sr2 sr3)
folderArray=(complete transfer1 transfer2)

echo "----------------------------------"
echo "[#] - select a server number - [#]"
echo "----------------------------------"
echo ""

for x in ${!serverArray[@]}; do
  echo "$x) ${serverArray[$x]}"
done

echo ""
echo -n "input$ "

read input1;

echo ""
echo "--------------------------------"
echo "[#] - select a repo number - [#]"
echo "--------------------------------"
echo ""

for x in ${!repoArray[@]}; do
  echo "$x) ${repoArray[$x]}"
done

echo ""
echo -n "input$ "

read input2;

echo ""
echo "----------------------------------"
echo "[#] - select a folder number - [#]"
echo "----------------------------------"
echo ""

for x in ${!folderArray[@]}; do
  echo "$x) ${folderArray[$x]}"
done

echo ""
echo -n "input$ "

read input3;

echo ""

if [[ $input1 =~ ^[0-9]+$ && $input2 =~ ^[0-9]+$ && $input3 =~ ^[0-9]+$ ]]; then
  if [[ $input1 -lt ${#repoArray[@]} && $input1 -ge 0 && $input2 -lt ${#repoArray[@]} && $input2 -ge 0 && $input3 -lt ${#folderArray[@]} && $input3 -ge 0 ]]; then
    server=${serverArray[$input1]}
    repo=${repoArray[$input2]}
    folder=${folderArray[$input3]}

    echo "syncing from user@$server:/storage/$repo/files/incoming/$folder"
    echo ""

    sftp -a -r -P 1022 user@$server:/storage/$repo/files/incoming/$folder .

    exit 0
  fi
fi

echo "invalid input(s)"

exit 0
