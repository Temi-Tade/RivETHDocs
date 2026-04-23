<script>
    import { base } from "$app/paths";
    import DocBody from "../../../ui/DocBody.svelte";
	import DocImage from "../../../ui/DocImage.svelte";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";

    let activePageId = 9;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` },
        { id: 6, name: "Debugging", href: `${base}/docs/debugging` },
        { id: 7, name: "Cross-contract calls", href: `${base}/docs/cross-contract-calls` },
        { id: 8, name: "RivETHScan", href: `${base}/docs/rivethscan` },
        { id: 9, name: "Injected Providers", href: `${base}/docs/injected-providers` },
        { id: 10, name: "Updating RivETH", href: `${base}/docs/update` },
    ];
</script>

<section>
    <div>
        <DocBody>
            <DocSubHead>Testing with Injected Providers</DocSubHead>
            <Info type="info">
                The injected provider feature was added in v1.5.0.
            </Info>
            <p>
                To bridge the gap between local development and a real-world user experience, RivETH supports <strong>Injected Providers</strong>. This allows you to use browser wallets like MetaMask as the signer for your transactions, rather than relying solely on the internal default Hardhat accounts.
            </p>

            <DocImage
                src="{base}/images/injected-provider.png"
                caption="Connecting MetaMask to RivETH for testing with an injected provider."
            />

            <Info type="warning">
                <strong>Internet Connection Required:</strong> While RivETH is designed to work fully offline after installation, you must be connected to the internet to use browser-based wallets (like MetaMask) as they require connectivity to initialize and sign.
            </Info>

            <DocSubHead>1. Configuring your Wallet</DocSubHead>
            <p>Before connecting to RivETH, your browser wallet must be configured to talk to your local Hardhat node. Use the following settings to add a Custom Network in MetaMask:</p>
            
            <div class="bg-[#123] p-4 rounded-lg border border-gray-700 my-4">
                <ul class="space-y-1 text-sm font-mono text-[#fff]">
                    <li><span>Network Name:</span> Hardhat Local</li>
                    <li><span>RPC URL:</span> http://127.0.0.1:8545</li>
                    <li><span>Chain ID:</span> 31337</li>
                    <li><span>Currency Symbol:</span> ETH</li>
                </ul>
            </div>

            <p>Next, import a local account from your terminal into your wallet by copying a private key from the running <code>npx hardhat node</code> terminal and pasting it into the "Import Account" section of your wallet.</p>

            <DocSubHead>2. Connecting and Disconnecting</DocSubHead>
            <p>RivETH makes toggling between internal and injected providers seamless via keyboard shortcuts:</p>
            <ul class="list-disc ml-6 space-y-2 mb-4">
                <li><strong>Connect:</strong> Press the <kbd class="px-2 py-1 rounded border border-gray-600 text-xs">I</kbd> key. This will trigger your browser wallet to request a connection. Once approved, your wallet address becomes the active signer.</li>
                <li><strong>Disconnect:</strong> Press the <kbd class="px-2 py-1 rounded border border-gray-600 text-xs">I</kbd> key again while connected to revert back to internal RivETH accounts.</li>
            </ul>

            <DocSubHead>3. Connection Status</DocSubHead>
            <p>You can verify your connection status at a glance by looking at the small status indicator located to the left of the <strong>Accounts</strong> dropdown:</p>
            
            <ul class="list-none space-y-3 mb-6">
                <li class="flex items-center gap-3">
                    <span class="w-2 h-2 rounded-full bg-green-500"></span>
                    <span><strong>Green:</strong> Injected Provider is active. Hover over the circle to view the connected account details.</span>
                </li>
                <li class="flex items-center gap-3">
                    <span class="w-2 h-2 rounded-full bg-red-500"></span>
                    <span><strong>Red:</strong> Disconnected. RivETH is using its internal development accounts.</span>
                </li>
            </ul>

            <Info type="info">
                <strong>Why use this?</strong> Testing with an injected provider allows you to verify how your contract handles gas limit prompts, signature requests, and network switching—scenarios that internal accounts cannot fully simulate.
            </Info>
        </DocBody>

        <DocNavLinks
            previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
            nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
            previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
            nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
        />
    </div>
</section>