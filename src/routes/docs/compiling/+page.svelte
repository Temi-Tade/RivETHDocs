<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocHeader from "../../../ui/DocHeader.svelte";
    import DocList from "../../../ui/DocList.svelte";
    import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import { base } from "$app/paths";

    let activePageId = 2;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` }
    ];

    const COMPILATION_STEPS = [
        {
            header: "The Shell Script",
            details: "Use <code>./compile.sh [FileName]</code> (omit the .sol). This invokes the Solidity compiler (solc) to generate the necessary artifacts."
        },
        {
            header: "The Make Shortcut",
            details: "Alternatively, use <code>make [FileName]</code> (omit the .sol). It’s a faster way to trigger the same compilation logic."
        },
        {
            header: "Artifact Generation",
            details: "The compiler automatically writes ABI and BIN files to the <code>artifacts/</code> folder. <strong>Do not edit these manually.</strong>"
        }
    ];
</script>

<section>
    <DocHeader>Writing & Compiling</DocHeader>

    <div>
        <DocBody>
            <p>RivETH follows a strict 'Naming Convention' to ensure the browser can correctly fetch your contract's ABI and bytecode.</p>

            <DocSubHead>1. Writing your Contract</DocSubHead>
            <p>Place your Solidity files in the <code>contracts/</code> folder. To ensure RivETH can load them, follow this rule:</p>

            <Info type="caution">
                Pre-written solidity smart contracts are in the <code class="!bg-[transparent]">contracts/</code> folder. Note that these contracts have not been audited and are not to be used in production.
            </Info>
            
            <Info type="warning">
                The <strong>Filename</strong> and the <strong>Contract Name</strong> must match exactly. 
                <br/>Example: <code class="!bg-[transparent]">MyContract.sol</code> should contain <code class="!bg-[transparent]">contract MyContract {'{...}'}</code>.
            </Info>

            <DocSubHead>2. Compiling the Code</DocSubHead>
            <p>Open a separate terminal window (while your Hardhat node is running) and run the compilation command:</p>
            
            <pre class="bg-gray-900 text-green-400 p-4 rounded-md my-4"># Method 1: Using the shell script
./compile.sh MyContract

# Method 2: Using the Makefile shortcut
make MyContract</pre>

            <DocList items={COMPILATION_STEPS} />

            <DocSubHead>3. Verification</DocSubHead>
            <p>After running the command, check your <code>artifacts/</code> folder. You should see .abi and .bin files named after your contract. This file contains the ABI and Bytecode that the RivETH UI will fetch.</p>

            <DocNavLinks
                previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
                nextHref={activePageId === PAGES.length ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
                previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
                nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
            />
        </DocBody>
    </div>
</section>
