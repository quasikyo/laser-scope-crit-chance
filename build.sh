#!/bin/bash

if [[ $1 != "Debug" && $1 != "Release" ]]; then
	echo "Expecting 'Debug' or 'Release' argument" >&2
	exit 1
fi

dotnet build -c $1
cp ./LaserScopeCritChance/bin/$1/netstandard2.0/LaserScopeCritChance.dll ~/AppData/Roaming/r2modmanPlus-local/RiskOfRain2/profiles/Testing/BepInEx/plugins/quasikyo-LaserScopeCritChance/LaserScopeCritChance
cp ./Thunderstore/plugins/LaserScopeCritChance/LaserScopeCritChance.language ~/AppData/Roaming/r2modmanPlus-local/RiskOfRain2/profiles/Testing/BepInEx/plugins/quasikyo-LaserScopeCritChance/LaserScopeCritChance

if [[ $1 == "Release" ]]; then
	cp ./LaserScopeCritChance/bin/Release/netstandard2.0/LaserScopeCritChance.dll ./Thunderstore/plugins/LaserScopeCritChance/
	cp ./README.md ./Thunderstore/
fi
