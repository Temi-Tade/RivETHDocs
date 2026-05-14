echo "Downloading, extracting and installing RivETH..."
curl -L -0 https://github.com/Temi-Tade/RivETH/archive/refs/heads/main.zip --output RivETH.zip && unzip RivETH.zip -d temp && mv temp/RivETH-main/* . && rm -rf temp RivETH.zip

echo "Installation successful! Cleaning up..."
echo -e "Run:\n- \`npm install\` to install dependencies\n- \`npx hardhat node\` to start the local Blockchain node"