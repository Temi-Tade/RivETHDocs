<script lang="ts">
	import CopyButton from "./CopyButton.svelte";
    let installCode: string = "curl -L -0 https://github.com/Temi-Tade/RivETH/archive/refs/heads/main.zip --output RivETH.zip && unzip RivETH.zip -d temp && mv temp/RivETH-main/* . && rm -rf temp RivETH.zip";

</script>

<section id="setup">
    <div class="p-2">
        <h2 class="text-xl font-bold">Installation and Set up.</h2>
        <div class="p-2">
            <h3 class="text-lg font-bold">Requirements</h3>
            <ul>
                <li>NodeJS. Download <a href="https://nodejs.org/en/download/current">here</a></li>
                <li>Solidity VSCode Extension - for syntax highlighting and code completion.</li>
                <li>VSCode Live Server Extension by Ritwick Dey.</li>
            </ul>

            <div class="my-3">
                <p class="italic">solc and Hardhat will be installed alongside the dependencies.</p>
                <p class="text-red-500 italic">Verify publishers before installing any extension.</p>
            </div>
        </div>

        <div class="p-2">
            <h3 class="text-lg font-bold">Set up</h3>
            <ul>
                <li>In your terminal or git bash (for windows), download RivETH:
                    <pre class="relative text-green-400 text-[.8rem] mb-[.25rem] relative bg-gray-900 p-4 rounded-md my-4 overflow-x-auto"><CopyButton textToCopy={installCode}/>{installCode}</pre>
                </li>
                <li>Navigate to the <code>RivETH</code> folder. <code>cd RivETH</code> and open it in VSCode.</li>
                <li>Install dependencies. <code>npm install</code></li>
                <li>In the <code>RivETH</code> directory in your terminal, start a local hardhat node: <code>npx hardhat node</code></li>
                <li>In a separate terminal and in your working directory, compile the smart contract's solidity code:<code>./compile.sh [FILENAME]</code>or with <code>make [FILENAME]</code>, do not add the <code>.sol</code> extension. Replace <code>[FILE_NAME]</code> with the name of the file you want to compile.</li>
                <li>Start VSCode live server extension to open RivETH in your browser.</li>
            </ul>
        </div>

        <div class="p-2">
            <h3 class="text-red-500 text-lg font-bold">Notes</h3>
            <ul>
                <li>You can find pre-written solidity smart contracts in the <code>contracts/</code> folder. Note that these contracts have not been reviewed and are not to be used in production.</li>
                <li>Do not save or write any file to the <code>artifacts/</code> folder. The solidity compiler will automatically write files to this folder.</li>
                <li>Use the same name for the solidity file and contract (e.g. <code>MyContract.sol</code> and <code>{"contract MyContract{...}"}</code>).</li>
                <li>To effect changes to a contract after making changes, click the “Load” button and redeploy the contract.</li>
            </ul>
        </div>
    </div>
</section>