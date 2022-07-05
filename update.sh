#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup update stable
rustc -V
cd ~/pathfinder
git fetch
git checkout v0.2.4-alpha
cargo build --release --bin pathfinder
mv ~/pathfinder/target/release/pathfinder /usr/local/bin/
cd py
source .venv/bin/activate
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt
systemctl restart starknetd

if [ "$language" = "uk" ]; then
	echo -e "\n\033[0;94mНода успішно оновлена до актуальної версії!"
	echo -e "\033[0;93mПоточна версія ноди:"
else
	echo -e "\n\033[0;94mNode was successfully updated!"
	echo -e "\033[0;93mCurrent node version:"
fi
pathfinder -V