#!/bin/sh

set -e
set -o pipefail

old_pkg_name="refurb-plugin-example"
old_src_name="refurb_plugin_example"
old_author_name="dosisod"

default_pkg_name="$(basename $PWD)"
echo -n "PyPi package name ($default_pkg_name)? "
read -r new_pkg_name > /dev/null
[ -z "$new_pkg_name" ] && { new_pkg_name="$default_pkg_name"; }

default_src_name="$(echo "$new_pkg_name" | sed "s/-/_/g")"
echo -n "Folder name ($default_src_name)? "
read -r new_src_name > /dev/null
[ -z "$new_src_name" ] && { new_src_name="$default_src_name"; }

default_author_name="$(git config --global user.name)"
echo -n "Author/GitHub username ($default_author_name)? "
read -r new_author_name > /dev/null
[ -z "$new_author_name" ] && { new_author_name="$default_author_name"; }

default_version="1.0.0"
echo -n "Version [$default_version]? "
read -r version
[ -z "$version" ] && { version="$default_version"; }

mv "$old_src_name" "$new_src_name"

sed -i \
	-e "s/$old_pkg_name/$new_pkg_name/" \
	-e "s/$old_author_name/$new_author_name/" \
	-e "s/$old_src_name/$new_src_name/" \
	-e "s/version = \".*\"/version = \"$version\"/" \
	pyproject.toml

sed -i "s/$old_src_name/$new_src_name/" Makefile

sed -i "s/$old_src_name/$new_src_name/" test/test_checks.py
