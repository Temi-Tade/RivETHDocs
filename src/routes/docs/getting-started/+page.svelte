<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocHeader from "../../../ui/DocHeader.svelte";
    import DocList from "../../../ui/DocList.svelte";
    import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import { base } from "$app/paths";
	import CopyButton from "../../../ui/CopyButton.svelte";
	import DocImage from "../../../ui/DocImage.svelte";

    let activePageId = 1;
    let installCode = "curl -L -O https://github.com --output RivETH.zip && unzip RivETH.zip -d temp && mv temp/RivETH-main/* . && rm -rf temp RivETH.zip";

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` }
    ];

    const REQUIREMENTS = [
        {
            header: "NodeJS",
            details: "Required to run the Hardhat node and manage packages."
        },
        {
            header: "VS Code Extensions",
            details: "You need <strong>Live Server</strong> (to serve the UI) and a <strong>Solidity</strong> extension (for syntax highlighting)."
        },
        {
            header: "Terminal Access",
            details: "Used for running the Hardhat node and the compilation shell scripts."
        }
    ];
</script>

<section>
    <DocHeader>Getting Started</DocHeader>

    <div>
        <DocBody>
            <p>Ready to build? Follow these steps to set up your local development environment with RivETH.</p>
            
            <DocSubHead>1. Requirements</DocSubHead>
            <DocList items={REQUIREMENTS} />

            <DocSubHead>2. Installation</DocSubHead>
            <p>Open your terminal and run the following command to download and extract RivETH into your working directory:</p>
            <pre class="relative bg-gray-900 text-green-400 p-4 rounded-md my-4 overflow-x-auto md:w-200"><CopyButton textToCopy={installCode}/>{installCode}</pre>

            <DocSubHead>3. Setup & Dependencies</DocSubHead>
            <p>Navigate into the directory and install the necessary tools (Hardhat, Ethers.js, and the Solidity compiler):</p>
            <pre class="bg-gray-900 text-green-400 p-4 rounded-md my-4 md:w-200">cd RivETH
npm install
</pre>

            <DocSubHead>4. Spin up the Node</DocSubHead>
            <p>In your terminal, start the local Hardhat network. This spins up the local Blockchain node and provides you with 20 pre-funded test accounts:</p>
            <pre class="bg-gray-900 text-green-400 p-4 rounded-md my-4 md:w-200">npx hardhat node</pre>

            <Info type="info">
                Keep this terminal window open! RivETH automatically connects to the node's RPC URL. If the node stops, your contracts and transactions cannot be loaded.
            </Info>

            <DocSubHead>5. Launch the UI</DocSubHead>
            <p>Open the project in VS Code and click <strong>Go Live</strong> on the bottom status bar (Live Server extension). This will open the RivETH dashboard in your default browser.</p>

            <DocImage
                src="{base}/images/riveth-landing-page-post-install-and-setup.png"
                caption="RivETH UI in the browser"
            />

            <Info type="info">
                This documentation explains how to use RivETH to interact with smart contracts in the browser, it does not contain any tutorial on solidity, there are many fantastic resources out there that teach solidity.
            </Info>

            <DocNavLinks
                previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
                nextHref={activePageId === PAGES.length ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
                previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
                nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
            />
        </DocBody>
    </div>
</section>