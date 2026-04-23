<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import CodeSnippet from "../../../ui/CodeSnippet.svelte"; // Your new component
    import {base} from "$app/paths";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";

    let activePageId = 7;

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
    ];

    const counterCode = `// Tab 1: Deploy this first
contract Counter {
    uint256 public count;
    function increment() external { count++; }
}`;

    const callerCode = `// Tab 2: Use the address from the Counter contract tab as the argument to callIncrement()
import { Counter } from "./Counter.sol";

contract Caller {
    function callIncrement(address _counter) external {
        Counter(_counter).increment();
    }
}`;
</script>

<section>
    <div>
        <DocBody>
            <DocSubHead>Cross-Contract Calls</DocSubHead>
            <p>RivETH supports complex development scenarios like Proxies, DEXs, or DAO governance where multiple contracts need to talk to each other through <strong>Multi-Tab Orchestration</strong>.</p>
            
            <ul class="list-decimal ml-6 space-y-2 mb-4">
                <li>Open a new browser tab for each contract you are working on.</li>
                <li>Each tab acts as an independent dashboard for a specific contract.</li>
                <li>Because they share the same local RPC <code>127.0.0.1:8545</code>, they can interact seamlessly.</li>
            </ul>

            <h4 class="text-lg font-semibold mt-6 mb-2">Example: Interactive Testing</h4>
            <p>Deploy the Counter, copy its address from the RivETH UI, and pass it as an argument to the Caller contract in another tab. Remember to apply the formatting as explained<a href="{base}/docs/interacting">here</a></p>
            
            <CodeSnippet title="Counter.sol" code={counterCode} />
            <CodeSnippet title="Caller.sol" code={callerCode} />

            <p>Calling <code>callIncrement</code> updates <code>count</code> in the <code>Counter</code> contract. This because both contracts are on the same blockchain, connected to the same RPC URL, giving them the ability to 'call' each other.</p>
            <p>This is a very minimalistic example, RivETH's cross-contract calls can be used for deploying proxies, DAOs, DEXs and systems in which contracts need to talk to one another. The contracts are in different browser tabs, no interference.</p>
        </DocBody>

        <DocNavLinks
            previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
            nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
            previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
            nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
        />
    </div>
</section>