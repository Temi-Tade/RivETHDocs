echo "Downloading, extracting and installing RivETH..."
curl -L -0 https://github.com/Temi-Tade/RivETH/archive/refs/heads/main.zip --output RivETH.zip && unzip RivETH.zip -d temp && mv temp/RivETH-main/* . && rm -rf temp RivETH.zip

echo "Installation successful! Cleaning up..."
echo "Installing dependencies..."

wget -O /usr/local/bin/solc https://github.com/ethereum/solidity/releases/download/v0.8.36/solc-static-linux
chmod +x /usr/local/bin/solc
solc --version

npm install

echo "Spinning up local Blockchain node..."
npx hardhat node

echo "RivETH installation and setup complete..."
