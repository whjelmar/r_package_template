#!/bin/bash

$package_name = "new_package"
$package_title = "new title"
$package_repo = "https://github.com/whjelmar/$package_name"

find . -path ./.git -prune -o -type f -exec sed -i 's/<<package_name>>/$package_name/g' {} +
find . -path ./.git -prune -o -type f -exec sed -i 's/<<package_title>>/$package_title/g' {} +

git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/whjelmar/$package_name.git
git push -u origin main