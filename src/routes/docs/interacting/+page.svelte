<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocHeader from "../../../ui/DocHeader.svelte";
    import DocList from "../../../ui/DocList.svelte";
    import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import { base } from "$app/paths";
	import DocImage from "../../../ui/DocImage.svelte";

    let activePageId = 3;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Advanced Features", href: `${base}/docs/advanced` }
    ];

    const CONSTRUCTOR_RULES = [
        {
            header: "Single Input Field",
            details: "The constructor uses a <strong>single input field</strong> regardless of how many parameters it has."
        },
        {
            header: "Parameter Formatting",
            details: "Separate parameters with a <strong>comma and a space</strong>. Example: <code>\"TokenName\", \"TKN\", 18</code>"
        },
        {
            header: "Quotes for Non-Numbers",
            details: "Strings, Bytes, and Addresses <strong>must</strong> be wrapped in double quotes. Example: <code>\"0x123...\"</code>"
        },
        {
            header: "Arrays",
            details: "Use square brackets with elements separated by a <strong>comma only</strong>. Example: <code>[\"0xAbc\",\"0xDef\"]</code>"
        }
    ];
</script>

<section>
    <DocHeader>Interacting with a Contract</DocHeader>

    <div>
        <DocBody>
            <p>RivETH provides a dynamic UI that adapts based on whether you are deploying a contract or calling its functions.</p>

            <DocSubHead>1. Loading the Contract</DocSubHead>
            <p>Enter your <strong>Contract Name</strong> and click <strong>Load</strong>. RivETH fetches the ABI and Bytecode from your <code>artifacts/</code> folder. To refresh after a code change, simply click <strong>Load</strong> and <strong>Deploy</strong> again.</p>
            <DocImage
                src="{base}/images/riveth-load-contract.png"
                caption="Load the compiled contract into the RivETH UI"
            />

            <DocSubHead>2. Deployment & The Constructor</DocSubHead>
            <p>If your contract has a constructor, RivETH provides <strong>one single input field</strong>. You must format your arguments manually here:</p>
            <DocImage
                src="{base}/images/riveth-pass-constructor.png"
                caption="Pass and format constructor parameters"
            />
            
            <DocList items={CONSTRUCTOR_RULES} />

            <Info type="warning">
                If the constructor has no parameters, the input field is automatically disabled.
            </Info>

            <DocSubHead>3. Interacting with Functions</DocSubHead>
            <p>Once deployed, the UI generates buttons for every function in your contract. Unlike the constructor, <strong>each function parameter gets its own dedicated input field</strong> based on the Solidity code. The function parameters should be formatted in the same way as the constructor.</p>
            <DocImage
                src="{base}/images/riveth-deploy-contract.png"
                caption="Each function has a button (lower left) that calls it when clicked. Transaction logs can be seen on the right hand side."
            />
            
            <!-- <ul class="list-disc ml-6 space-y-2 mb-4">
                <li><span class="text-blue-500 font-bold">Blue Buttons:</span> View/Pure functions (Reads state, no gas).</li>
                <li><span class="text-orange-500 font-bold">Orange/Red Buttons:</span> State-changing functions (Writes state, costs gas).</li>
                <li><strong>Payable:</strong> Use the <strong>Value</strong> field to send Ether with the transaction.</li>
            </ul> -->

            <DocSubHead>4. Account Selection</DocSubHead>
            <p>Choose from the 20 pre-funded Hardhat accounts in the dropdown. RivETH tracks the address and current balance, allowing you to swap signers instantly for testing permissions or multi-user flows.</p>
            <DocImage
                src="{base}/images/riveth-default-accounts.png"
                caption="Hardhat default accounts"
            />

            <Info type="caution">
                These accounts, and their private keys, are publicly known. Any funds sent to them on Mainnet or any other live network WILL BE LOST.
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