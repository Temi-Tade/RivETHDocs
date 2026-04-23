<script>
    import { base } from "$app/paths";
    import DocBody from "../../../ui/DocBody.svelte";
    import DocImage from "../../../ui/DocImage.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import CodeSnippet from "../../../ui/CodeSnippet.svelte";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";

    let activePageId = 6;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` },
        { id: 6, name: "Debugging", href: `${base}/docs/debugging` },
        { id: 7, name: "Cross-contract calls", href: `${base}/docs/cross-contract-calls` },
    ];

    const accessCode = `// Tab 1: Deploy as the first signer (0xf3...266)
contract Protected {
    address public owner;

    constructor() { owner = msg.sender; }

    function secureAction() external {
        // This will revert if called by the second signer 2 (0x7...98)
        require(msg.sender == owner, "Caller is not owner");
    }
}`;
</script>

<section>
    <div>
        <DocBody>
            <DocSubHead>Debugging with Hardhat</DocSubHead>
            <p>While RivETH provides the UI, your terminal running the Hardhat node is your source of truth. If a transaction fails in the RivETH UI, the terminal will provide the <strong>stack trace</strong> or the exact <strong>revert reason</strong>.</p>
            
            <DocImage
                src="{base}/images/riveth-node-logs.png"
                caption="Hardhat logs showing a 'Caller is not owner' revert"
            />

            <DocSubHead>Access-Based Debugging</DocSubHead>
            <p>Access control is one of the most common reasons for transaction failure. When testing multi-role contracts (like those using <code>Ownable</code>), the terminal logs help you verify identity mismatches immediately.</p>
            
            <CodeSnippet title="AccessControl.sol" code={accessCode} />

            <div class="space-y-4 mb-6">
                <p>Whenever you initiate a transaction in RivETH, your terminal will output a trace:</p>
                <ul class="list-disc ml-6 space-y-2">
                    <li><strong>Transaction Hash:</strong> The unique ID for the transaction.</li>
                    <li><strong>From/To:</strong> The <code>msg.sender</code> (signer)/the contract being interacted with.</li>
                    <li><strong>Error Message (in case of reverts, like in the code snippet above):</strong> Look for the string <code>"Caller is not owner"</code>. If no string is present, it might be a <strong>Custom Error</strong> or a failing <code>assert</code>.</li>
                </ul>
            </div>

            <Info type="warning">
                <strong>Important:</strong> If a transaction fails during <em>Gas Estimation</em>, RivETH will prevent the broadcast entirely. In this case, the terminal will show a <code>eth_estimateGas</code> failure rather than a transaction trace. Check the parameters in the terminal to see why the EVM thinks the call will fail before it even starts.
            </Info>

            <DocSubHead>The JSON-RPC Handshake</DocSubHead>
            <p>Every click in the RivETH UI corresponds to a JSON-RPC call in your terminal. Watching these logs in real-time is a great way to understand the underlying mechanics, some of the calls include:</p>
            <ul class="list-none space-y-1 font-mono text-sm p-3 rounded">
                <li>eth_call <span>// Triggered by "Read" buttons</span></li>
                <li>eth_sendTransaction <span>// Triggered by "Write" buttons</span></li>
                <li>eth_getBalance <span>// Triggered on account switch/refresh</span></li>
            </ul>
        </DocBody>

        <DocNavLinks
            previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
            nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
            previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
            nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
        />
    </div>
</section>

<!-- todo: get more images: terminal reverts, ui reverts -->