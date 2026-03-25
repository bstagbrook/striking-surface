#!/usr/bin/env python3
"""
Stagbrook Tech — Structural Intelligence Interface
The universe in your pocket. 29 domains. O(1) resolution.
"""

from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import subprocess
import os

app = FastAPI()
CWD = os.path.dirname(os.path.abspath(__file__))

def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=120, cwd=CWD, shell=True)
    return r.stdout

def smart_query(question):
    """Multi-domain strike — extract key terms and hit everything."""
    words = question.lower().split()
    stop = {'what','how','why','does','is','the','a','an','to','of','in','my','me','i','and','or','can','do','it','for','with','this','that','be','on','at'}
    terms = [w for w in words if w not in stop and len(w) > 2]

    results = {}
    for term in terms[:5]:  # max 5 terms
        out = run(f"bash tools/query.sh '{term}' domain")
        if "0 atoms matched" not in out:
            results[term] = out

    # Auto-collide top 2 terms if we have them
    collision = ""
    if len(terms) >= 2:
        collision = run(f"bash tools/collider.sh '{terms[0]}' '{terms[1]}'")

    return results, collision, terms

def list_domains():
    domains = []
    for root, dirs, files in os.walk("domain"):
        for f in sorted(files):
            if f.endswith('.rkt') and not '.cal.' in f and not '.def.' in f and 'TEMPLATE' not in f:
                path = os.path.join(root, f)
                with open(path) as fh:
                    if fh.readline().strip() == '#lang strike':
                        layer = os.path.basename(root)
                        name = f.replace('.rkt','').replace('-',' ').title()
                        domains.append((layer, name))
    return domains

@app.get("/", response_class=HTMLResponse)
async def home():
    domains = list_domains()
    domain_chips = "".join(f'<span class="chip">{name}</span>' for _, name in domains)

    papers = []
    if os.path.exists("papers"):
        for f in sorted(os.listdir("papers")):
            if f.endswith('.md'):
                papers.append((f.replace('.md',''), f.replace('.md','').replace('-',' ').title()))
    paper_items = "".join(f'<a class="paper" href="/paper/{slug}">{title}</a>' for slug, title in papers)

    return f"""<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="⚡ ASF">
<title>⚡ Stagbrook Tech</title>
<style>
:root {{
    --bg: #050508;
    --card: #0d0d12;
    --border: #1a1a25;
    --glow: #00ff88;
    --glow2: #00ccff;
    --text: #c8c8d0;
    --dim: #555566;
}}
* {{ margin:0; padding:0; box-sizing:border-box; }}
body {{
    font-family: -apple-system, BlinkMacSystemFont, 'SF Pro', sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
    padding: env(safe-area-inset-top) 16px 90px 16px;
    -webkit-font-smoothing: antialiased;
}}
.hero {{
    text-align: center;
    padding: 30px 0 20px;
}}
.hero h1 {{
    font-size: 1.8em;
    background: linear-gradient(135deg, var(--glow), var(--glow2));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-weight: 800;
}}
.hero .sub {{
    color: var(--dim);
    font-size: 0.75em;
    margin-top: 4px;
    letter-spacing: 2px;
    text-transform: uppercase;
}}
.stats {{
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 8px;
    margin-bottom: 24px;
}}
.stat {{
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 12px 8px;
    text-align: center;
}}
.stat .n {{
    font-size: 1.4em;
    font-weight: 700;
    background: linear-gradient(135deg, var(--glow), var(--glow2));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}}
.stat .l {{ font-size: 0.6em; color: var(--dim); margin-top: 2px; }}
.ask {{
    position: relative;
    margin-bottom: 16px;
}}
.ask input {{
    width: 100%;
    padding: 16px 50px 16px 18px;
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 20px;
    color: var(--text);
    font-size: 17px;
    -webkit-appearance: none;
    transition: border-color 0.3s;
}}
.ask input:focus {{
    outline: none;
    border-color: var(--glow);
    box-shadow: 0 0 20px rgba(0,255,136,0.1);
}}
.ask button {{
    position: absolute;
    right: 6px;
    top: 6px;
    width: 42px;
    height: 42px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, var(--glow), var(--glow2));
    color: #000;
    font-size: 20px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}}
.results-area {{
    display: none;
    margin-bottom: 20px;
}}
.result-card {{
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 16px;
    margin-bottom: 10px;
    animation: fadeIn 0.3s ease;
}}
@keyframes fadeIn {{
    from {{ opacity: 0; transform: translateY(10px); }}
    to {{ opacity: 1; transform: translateY(0); }}
}}
.result-card h3 {{
    font-size: 0.85em;
    color: var(--glow);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 6px;
}}
.result-card pre {{
    font-family: 'SF Mono', monospace;
    font-size: 0.75em;
    color: var(--dim);
    white-space: pre-wrap;
    word-break: break-all;
    max-height: 200px;
    overflow-y: auto;
}}
.collision-card {{
    border-color: var(--glow2);
    background: linear-gradient(135deg, rgba(0,204,255,0.05), rgba(0,255,136,0.05));
}}
.collision-card h3 {{ color: var(--glow2); }}
.section {{ margin-bottom: 24px; }}
.section h2 {{
    font-size: 0.8em;
    color: var(--dim);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 10px;
    padding-left: 4px;
}}
.chips {{
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
}}
.chip {{
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 20px;
    padding: 6px 12px;
    font-size: 0.7em;
    color: var(--dim);
}}
.paper {{
    display: block;
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 12px 16px;
    margin-bottom: 6px;
    color: var(--text);
    text-decoration: none;
    font-size: 0.85em;
    transition: border-color 0.2s;
}}
.paper:hover {{ border-color: var(--glow); }}
.loading {{
    display: inline-block;
    width: 16px;
    height: 16px;
    border: 2px solid var(--dim);
    border-top-color: var(--glow);
    border-radius: 50%;
    animation: spin 0.6s linear infinite;
}}
@keyframes spin {{ to {{ transform: rotate(360deg); }} }}
</style>
</head>
<body>

<div class="hero">
    <h1>⚡ Stagbrook Tech</h1>
    <div class="sub">Structural Intelligence · O(1)</div>
</div>

<div class="stats">
    <div class="stat"><div class="n">{len(domains)}</div><div class="l">Domains</div></div>
    <div class="stat"><div class="n">{len(papers)}</div><div class="l">Papers</div></div>
    <div class="stat"><div class="n">O(1)</div><div class="l">Speed</div></div>
    <div class="stat"><div class="n">∞</div><div class="l">Scale</div></div>
</div>

<div class="ask">
    <input id="q" placeholder="Ask anything..." autocomplete="off" />
    <button onclick="ask()">⚡</button>
</div>

<div class="results-area" id="results"></div>

<div class="section">
    <h2>Registered Domains</h2>
    <div class="chips">{domain_chips}</div>
</div>

<div class="section">
    <h2>Research Papers</h2>
    {paper_items}
</div>

<script>
document.getElementById('q').addEventListener('keydown', e => {{
    if (e.key === 'Enter') ask();
}});

async function ask() {{
    const q = document.getElementById('q').value.trim();
    if (!q) return;
    const r = document.getElementById('results');
    r.style.display = 'block';
    r.innerHTML = '<div class="result-card"><h3><span class="loading"></span> Striking 29 domains...</h3></div>';

    const res = await fetch('/ask?q=' + encodeURIComponent(q));
    const data = await res.json();

    let html = '';

    if (data.matches && Object.keys(data.matches).length > 0) {{
        for (const [term, output] of Object.entries(data.matches)) {{
            html += '<div class="result-card"><h3>🔍 ' + term + '</h3><pre>' + escHtml(output) + '</pre></div>';
        }}
    }}

    if (data.collision) {{
        html += '<div class="result-card collision-card"><h3>💥 Collision: ' + data.terms.join(' × ') + '</h3><pre>' + escHtml(data.collision) + '</pre></div>';
    }}

    if (!html) {{
        html = '<div class="result-card"><h3>CUT</h3><pre>No matches across 29 domains. This is honest silence — the domain model has no receipt for this query.</pre></div>';
    }}

    r.innerHTML = html;
}}

function escHtml(s) {{
    return s.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}}
</script>

</body>
</html>"""

@app.get("/ask")
async def ask(q: str):
    matches, collision, terms = smart_query(q)
    return {
        "matches": matches,
        "collision": collision if "COLLISION" in collision else "",
        "terms": terms[:2]
    }

@app.get("/paper/{name}", response_class=HTMLResponse)
async def paper(name: str):
    path = f"papers/{name}.md"
    if not os.path.exists(path):
        return "<h1>Not found</h1>"
    with open(path) as f:
        content = f.read()
    # Simple markdown to HTML
    import re
    content = re.sub(r'^# (.+)$', r'<h1>\1</h1>', content, flags=re.MULTILINE)
    content = re.sub(r'^## (.+)$', r'<h2>\1</h2>', content, flags=re.MULTILINE)
    content = re.sub(r'^### (.+)$', r'<h3>\1</h3>', content, flags=re.MULTILINE)
    content = re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', content)
    content = re.sub(r'\*(.+?)\*', r'<em>\1</em>', content)
    content = re.sub(r'^---$', '<hr>', content, flags=re.MULTILINE)
    content = re.sub(r'\n\n', '</p><p>', content)

    return f"""<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{name}</title>
<style>
body {{ font-family: -apple-system, sans-serif; background: #050508; color: #c8c8d0; padding: 20px; line-height: 1.6; }}
h1 {{ color: #00ff88; font-size: 1.3em; }}
h2 {{ color: #00ccff; font-size: 1.1em; margin-top: 24px; }}
h3 {{ color: #888; font-size: 0.95em; }}
hr {{ border: 1px solid #1a1a25; margin: 20px 0; }}
a {{ color: #00ff88; }}
table {{ border-collapse: collapse; width: 100%; font-size: 0.8em; }}
th, td {{ border: 1px solid #333; padding: 6px; text-align: left; }}
th {{ background: #1a1a25; color: #00ff88; }}
</style>
</head><body><p>{content}</p></body></html>"""

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8888)
