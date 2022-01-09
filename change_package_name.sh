#!/bin/bash

read -p 'What would you like to name this new package? ' package_name
read -p 'Can you give a 1 sentence title for the package? ' package_title
read -p 'Can you give a 1 paragraph description of the purpose for the package? ' package_description

find . -path ./.git -prune -o -type f -exec sed -i "s/<<package_name>>/$package_name/g" {} +
find . -path ./.git -prune -o -type f -exec sed -i "s/<<package_title>>/$package_title/g" {} +
find . -path ./.git -prune -o -type f -exec sed -i "s/<<package_description>>/$package_description/g" {} +

git mv default_template_name.Rproj "$package_name.Rproj"
git rm change_package_name.sh
git add --all
git commit -m "feat: replaced defaults in templates with package info"
git push

