read -p "Major / Minor / Patch: " version

while [ "${version,,}" != "major" ] && [ "${version,,}" != "minor" ] && [ "${version,,}" != "patch" ]
do
	read -p "Major / Minor / Patch: " version
done

npx grunt bump:"${version}"