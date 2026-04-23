<script>
    import { base } from "$app/paths";
    import DocBody from "../../../ui/DocBody.svelte";
    import DocImage from "../../../ui/DocImage.svelte";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";

    let activePageId = 8;

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
            <DocSubHead>RivETHScan</DocSubHead>
            <p>
                <strong>RivETHScan</strong> is the built-in, local block explorer designed specifically for the RivETH toolkit. It provides a real-time visual record of every transaction mined on your local Hardhat node, offering a high-level view that complements the raw logs in your terminal.
            </p>

            <Info type="info">
                RivETHScan was added in v1.4.0
            </Info>

            <DocImage
                src="{base}/images/rivethscan-empty.png"
                caption="RivETHScan initial state waiting for transactions."
            />

            <DocSubHead>1. Launching the Explorer</DocSubHead>
            <p>You can access RivETHScan at any time without interrupting your contract interactions. There are two primary ways to launch it in a new tab:</p>
            <ul class="list-disc ml-6 space-y-2 mb-4">
                <li><strong>The Menu:</strong> Click the <strong>RivETH Logo</strong> in the center of the navigation bar to open the main menu, then select "Launch Explorer".</li>
                <li><strong>Keyboard Shortcut:</strong> Press the <kbd class="px-2 py-1 rounded border border-gray-600 text-xs">E</kbd> key while the RivETH window is in focus.</li>
            </ul>

            <DocSubHead>2. Real-Time Monitoring</DocSubHead>
            <p>RivETHScan operates as a passive listener. Once opened, it automatically syncs with the RivETH dashboard. For every transaction you sign and mine:</p>
            <ul class="list-disc ml-6 space-y-2 mb-4">
                <li>A new entry is added to the top of the list.</li>
                <li>The <strong>Block Number</strong>, <strong>Timestamp</strong>, and unique <strong>Block Hash</strong> are captured instantly.</li>
                <li>The <strong>Transactions</strong> column tracks the number of interactions contained within that specific block.</li>
            </ul>

            <DocImage
                src="{base}/images/rivethscan.png"
                caption="Live transaction feed in RivETHScan."
            />

            <DocSubHead>3. Decoding Calldata</DocSubHead>
            <p>Beyond simple logging, RivETHScan helps you verify that your frontend is sending the correct data. By clicking on a transaction and scrolling to the <strong>data</strong> row, you can <strong>Decode</strong> the calldata.</p>
            <p>This allows you to see the exact function name and the arguments passed to the contract in a human-readable format, making it much easier to debug complex state changes or multi-argument inputs.</p>

            <Info type="info">
                In the latest release (v1.5.0), RivETHScan focuses on logging trandactions and decoding calldata. Support for event decoding and internal call traces is planned for future updates.
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

<!-- todo: decode calldata image -->