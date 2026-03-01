<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocHeader from "../../../ui/DocHeader.svelte";
    import DocList from "../../../ui/DocList.svelte";
    import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import { base } from "$app/paths";
	import DocImage from "../../../ui/DocImage.svelte";

    let activePageId = 4;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Advanced Features", href: `${base}/docs/advanced` }
    ];

    const ADVANCED_TIPS = [
        {
            header: "Cross-Contract Calls",
            details: "Since RivETH connects to your local Hardhat node, you can open multiple browser tabs. Deploy <strong>Contract A</strong> in Tab 1, copy its address, and use it as an input for <strong>Contract B</strong> in Tab 2."
        },
        {
            header: "The 'Load' Refresh",
            details: "You don't need to refresh the browser after code changes. Just re-compile in your terminal and hit <strong>Load</strong> in RivETH to pull the latest ABI and bytecode."
        },
        {
            header: "State Persistence",
            details: "Your contracts stay live as long as your <code>npx hardhat node</code> is running in the terminal. Closing a browser tab won't destroy the data on the local chain."
        }
    ];
</script>

<section>
    <DocHeader>Advanced Features</DocHeader>

    <div>
        <DocBody>
            <p>Master the full power of RivETH by utilizing multi-tab orchestration and the rapid redeployment loop.</p>

            <DocSubHead>1. Multi-Tab Orchestration</DocSubHead>
            <p>RivETH supports complex development scenarios like DEXs or DAO governance where multiple contracts need to talk to each other.</p>
            <ul class="list-decimal ml-6 space-y-2 mb-4">
                <li>Open a new browser tab for each contract you are working on.</li>
                <li>Each tab acts as an independent dashboard for a specific contract.</li>
                <li>Because they share the same local RPC (<code>127.0.0.1:8545</code>), they can interact seamlessly.</li>
            </ul>

            <DocSubHead>2. Rapid Redeployment</DocSubHead>
            <p>Made a mistake in your logic? The "Fix-to-Test" loop in RivETH is designed to be the fastest in the ecosystem:</p>
            
            <Info type="info">
                <strong>The Loop:</strong> Update code in VS Code &rarr; Run <code class="!bg-[transparent]">make [File]</code> &rarr; Click <strong>Load</strong> in RivETH &rarr; Click <strong>Deploy</strong>.
            </Info>

            <DocList items={ADVANCED_TIPS} />

            <DocSubHead>3. Debugging with Hardhat</DocSubHead>
            <p>While RivETH provides the UI, your terminal running the Hardhat node provides the logs. If a transaction fails in the RivETH UI, check your terminal for the detailed <strong>stack trace</strong> or revert reason provided by Hardhat.</p>
            <DocImage
                src="{base}/images/riveth-node-logs.png"
                caption="Hardhat logs in terminal"
            />

            <div class="mt-5">
                <p>You have reached the end of the official RivETH documentation, stay in the loop with the latest releases by giving the <a href="https://github.com/Temi-Tade/RivETH">repo</a> a star on GitHub. RivETH is open source, check out the <a href="{base}/#contribution">homepage</a> for the contribution guidelines.</p>
            </div>

            <DocNavLinks
                previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
                nextHref={activePageId === PAGES.length ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
                previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
                nextTopic={''}
            />
        </DocBody>
    </div>
</section>
