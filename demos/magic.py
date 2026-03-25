#!/usr/bin/env python3
"""
MAGIC TRICKS — futuristic tech demos you show on your phone

Each trick is something no phone app can do today.
No external APIs. No internet required. Runs locally.
"""

from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
import subprocess
import os
import math
import json
import random
import time

app = FastAPI()
CWD = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')

# ═══════════════════════════════════════════════════════════════

def query_domains(term):
    r = subprocess.run(["bash", "tools/query.sh", term, "domain"],
                       capture_output=True, text=True, timeout=60, cwd=CWD)
    return r.stdout

def collide(t1, t2):
    r = subprocess.run(["bash", "tools/collider.sh", t1, t2],
                       capture_output=True, text=True, timeout=120, cwd=CWD)
    return r.stdout

def fold_protein(seq):
    r = subprocess.run(["python3", "lab/protein-folding/001-fold-from-first-principles.py", seq],
                       capture_output=True, text=True, timeout=30, cwd=CWD)
    return r.stdout

# ═══════════════════════════════════════════════════════════════

@app.get("/", response_class=HTMLResponse)
async def home():
    return """<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<title>⚡ Magic</title>
<style>
:root { --bg:#050508; --card:#0d0d12; --border:#1a1a25; --glow:#00ff88; --glow2:#00ccff; --text:#c8c8d0; --dim:#555; }
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:-apple-system,sans-serif; background:var(--bg); color:var(--text); padding:env(safe-area-inset-top) 16px 40px; min-height:100vh; }
.logo { text-align:center; padding:30px 0 10px; }
.logo h1 { font-size:2.2em; background:linear-gradient(135deg,var(--glow),var(--glow2)); -webkit-background-clip:text; -webkit-text-fill-color:transparent; }
.logo p { color:var(--dim); font-size:0.7em; letter-spacing:3px; text-transform:uppercase; }
.tricks { display:grid; gap:12px; margin-top:20px; }
.trick {
    background:var(--card); border:1px solid var(--border); border-radius:16px;
    padding:20px; cursor:pointer; transition:all 0.2s;
    text-decoration:none; display:block; color:var(--text);
}
.trick:active { transform:scale(0.97); border-color:var(--glow); }
.trick .icon { font-size:2em; margin-bottom:8px; }
.trick h2 { font-size:1em; color:var(--glow); margin-bottom:4px; }
.trick p { font-size:0.8em; color:var(--dim); line-height:1.4; }
.trick .tag { display:inline-block; font-size:0.6em; background:rgba(0,255,136,0.1); color:var(--glow); padding:2px 8px; border-radius:10px; margin-top:8px; }
</style>
</head>
<body>
<div class="logo">
    <h1>⚡ Magic</h1>
    <p>Futuristic Tech Demos</p>
</div>
<div class="tricks">
    <a class="trick" href="/trick/mindread">
        <div class="icon">🧠</div>
        <h2>Mind Reader</h2>
        <p>Think of any topic. The system finds hidden connections you didn't know existed — across 29 scientific domains simultaneously.</p>
        <span class="tag">29 DOMAINS · O(1)</span>
    </a>
    <a class="trick" href="/trick/protein">
        <div class="icon">🧬</div>
        <h2>Protein Folder</h2>
        <p>Type any amino acid sequence. Get its 3D fold predicted from first principles — no AI training, no database. Pure physics.</p>
        <span class="tag">FIRST PRINCIPLES · NO ALPHAFOLD</span>
    </a>
    <a class="trick" href="/trick/collision">
        <div class="icon">💥</div>
        <h2>Idea Collider</h2>
        <p>Pick any two concepts. Smash them together like particles. Read the daughter ideas that fall out. Discover what nobody has connected before.</p>
        <span class="tag">HADRON COLLIDER FOR IDEAS</span>
    </a>
    <a class="trick" href="/trick/synth">
        <div class="icon">🎵</div>
        <h2>Emotion Synth</h2>
        <p>Describe a feeling. Hear it as sound — generated from the physics of waveforms, not from samples or AI. Pure frequency synthesis from emotion.</p>
        <span class="tag">WAVEFORM FROM FEELING</span>
    </a>
    <a class="trick" href="/trick/oracle">
        <div class="icon">🔮</div>
        <h2>The Oracle</h2>
        <p>Ask anything. Get cross-domain structural reasoning — or honest silence. Never hallucinates. Never guesses. Knows or says CUT.</p>
        <span class="tag">HONEST INTELLIGENCE</span>
    </a>
</div>
</body>
</html>"""

# ═══════════════════════════════════════════════════════════════
# TRICK 1: MIND READER — hidden connections
# ═══════════════════════════════════════════════════════════════

@app.get("/trick/mindread", response_class=HTMLResponse)
async def mindread_page():
    return _trick_page("🧠 Mind Reader",
        "Think of anything. I'll find connections you didn't know existed.",
        "mindread", "What's on your mind?")

@app.get("/api/mindread")
async def mindread_api(q: str):
    words = q.lower().split()
    stop = {'what','how','why','does','is','the','a','an','to','of','in','my','me','i','and','or','can','do','it','for','with','this','that','be','on','at','about','would','could','should'}
    terms = [w for w in words if w not in stop and len(w) > 2]

    findings = []
    for term in terms[:3]:
        result = query_domains(term)
        if "0 atoms matched" not in result:
            # Parse out domain matches
            lines = result.split('\n')
            for line in lines:
                if line.strip().startswith('['):
                    domain = line.strip().strip('[]')
                    findings.append({"domain": domain, "term": term, "raw": ""})
                elif line.strip().startswith('→') or line.strip().startswith('←'):
                    if findings:
                        findings[-1]["raw"] += line.strip() + "\n"

    # Auto-collide first two terms
    collision = ""
    if len(terms) >= 2:
        collision = collide(terms[0], terms[1])

    return {"findings": findings, "collision": collision, "terms": terms}

# ═══════════════════════════════════════════════════════════════
# TRICK 2: PROTEIN FOLDER
# ═══════════════════════════════════════════════════════════════

@app.get("/trick/protein", response_class=HTMLResponse)
async def protein_page():
    return _trick_page("🧬 Protein Folder",
        "Enter amino acid letters (like AGILKWMV). I'll predict how it folds using only physics — no AI, no training data.",
        "protein", "Amino acid sequence...",
        placeholder_hint="Try: PIVQNLQGQMVHQAIS (HIV capsid)")

@app.get("/api/protein")
async def protein_api(q: str):
    seq = ''.join(c for c in q.upper() if c in 'ACDEFGHIKLMNPQRSTVWY')
    if len(seq) < 5:
        return {"error": "Need at least 5 amino acids", "result": ""}
    result = fold_protein(seq)
    return {"result": result}

# ═══════════════════════════════════════════════════════════════
# TRICK 3: IDEA COLLIDER
# ═══════════════════════════════════════════════════════════════

@app.get("/trick/collision", response_class=HTMLResponse)
async def collision_page():
    return """<!DOCTYPE html>
<html><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>💥 Idea Collider</title>
<style>
:root { --bg:#050508; --card:#0d0d12; --border:#1a1a25; --glow:#00ff88; --glow2:#00ccff; --text:#c8c8d0; --dim:#555; }
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:-apple-system,sans-serif; background:var(--bg); color:var(--text); padding:20px; }
h1 { text-align:center; font-size:1.5em; background:linear-gradient(135deg,var(--glow),var(--glow2)); -webkit-background-clip:text; -webkit-text-fill-color:transparent; margin-bottom:5px; }
.sub { text-align:center; color:var(--dim); font-size:0.8em; margin-bottom:20px; }
input { width:100%; padding:14px 18px; background:var(--card); border:1px solid var(--border); border-radius:16px; color:var(--text); font-size:16px; margin-bottom:10px; -webkit-appearance:none; }
input:focus { outline:none; border-color:var(--glow); }
button { width:100%; padding:14px; background:linear-gradient(135deg,var(--glow),var(--glow2)); color:#000; border:none; border-radius:16px; font-size:16px; font-weight:bold; cursor:pointer; }
#result { background:var(--card); border:1px solid var(--border); border-radius:16px; padding:16px; margin-top:16px; display:none; white-space:pre-wrap; font-family:'SF Mono',monospace; font-size:0.75em; color:var(--dim); max-height:60vh; overflow-y:auto; }
.back { display:block; text-align:center; color:var(--dim); font-size:0.8em; margin-top:16px; text-decoration:none; }
</style></head><body>
<h1>💥 Idea Collider</h1>
<p class="sub">Smash two concepts. Read the daughter ideas.</p>
<input id="t1" placeholder="Concept 1 (e.g. music)" />
<input id="t2" placeholder="Concept 2 (e.g. DNA)" />
<button onclick="go()">💥 COLLIDE</button>
<div id="result"></div>
<a class="back" href="/">← Back</a>
<script>
async function go() {
    const t1=document.getElementById('t1').value, t2=document.getElementById('t2').value;
    if(!t1||!t2) return;
    const r=document.getElementById('result'); r.style.display='block'; r.textContent='Colliding...';
    const res=await fetch('/api/collision?t1='+encodeURIComponent(t1)+'&t2='+encodeURIComponent(t2));
    const data=await res.json(); r.textContent=data.result;
}
</script></body></html>"""

@app.get("/api/collision")
async def collision_api(t1: str, t2: str):
    result = collide(t1, t2)
    return {"result": result}

# ═══════════════════════════════════════════════════════════════
# TRICK 4: EMOTION SYNTH — sound from feeling
# ═══════════════════════════════════════════════════════════════

@app.get("/trick/synth", response_class=HTMLResponse)
async def synth_page():
    return """<!DOCTYPE html>
<html><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>🎵 Emotion Synth</title>
<style>
:root { --bg:#050508; --card:#0d0d12; --border:#1a1a25; --glow:#00ff88; --glow2:#00ccff; --text:#c8c8d0; --dim:#555; }
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:-apple-system,sans-serif; background:var(--bg); color:var(--text); padding:20px; }
h1 { text-align:center; font-size:1.5em; background:linear-gradient(135deg,var(--glow),var(--glow2)); -webkit-background-clip:text; -webkit-text-fill-color:transparent; margin-bottom:5px; }
.sub { text-align:center; color:var(--dim); font-size:0.8em; margin-bottom:20px; }
input { width:100%; padding:14px 18px; background:var(--card); border:1px solid var(--border); border-radius:16px; color:var(--text); font-size:16px; margin-bottom:10px; -webkit-appearance:none; }
input:focus { outline:none; border-color:var(--glow); }
button { width:100%; padding:14px; background:linear-gradient(135deg,var(--glow),var(--glow2)); color:#000; border:none; border-radius:16px; font-size:16px; font-weight:bold; cursor:pointer; margin-bottom:8px; }
.stop { background:var(--card); color:var(--glow); border:1px solid var(--border); }
canvas { width:100%; height:120px; background:var(--card); border:1px solid var(--border); border-radius:16px; margin-top:12px; }
.params { background:var(--card); border:1px solid var(--border); border-radius:16px; padding:16px; margin-top:12px; font-size:0.8em; }
.params .row { display:flex; justify-content:space-between; margin-bottom:4px; }
.params .label { color:var(--dim); }
.params .val { color:var(--glow); }
.back { display:block; text-align:center; color:var(--dim); font-size:0.8em; margin-top:16px; text-decoration:none; }
</style></head><body>
<h1>🎵 Emotion Synth</h1>
<p class="sub">Describe a feeling. Hear it as pure waveform.</p>
<input id="feeling" placeholder="e.g. calm sunrise over ocean" />
<button onclick="play()">▶ SYNTHESIZE</button>
<button class="stop" onclick="stop()">⬜ STOP</button>
<canvas id="viz"></canvas>
<div class="params" id="params" style="display:none"></div>
<a class="back" href="/">← Back</a>
<script>
let ctx=null, nodes=[], animId=null, analyser=null;

const EMOTIONS = {
    // valence: -1 (negative) to +1 (positive)
    // arousal: 0 (calm) to 1 (intense)
    happy:{v:0.8,a:0.6}, sad:{v:-0.6,a:0.2}, angry:{v:-0.8,a:0.9},
    calm:{v:0.3,a:0.1}, anxious:{v:-0.5,a:0.8}, excited:{v:0.7,a:0.9},
    peaceful:{v:0.5,a:0.05}, melancholy:{v:-0.3,a:0.15}, euphoric:{v:1,a:1},
    tense:{v:-0.4,a:0.7}, serene:{v:0.4,a:0.05}, rage:{v:-1,a:1},
    love:{v:0.9,a:0.4}, fear:{v:-0.7,a:0.85}, hope:{v:0.6,a:0.3},
    grief:{v:-0.8,a:0.3}, joy:{v:0.9,a:0.7}, despair:{v:-0.9,a:0.2},
    wonder:{v:0.7,a:0.5}, awe:{v:0.8,a:0.6}, nostalgia:{v:0.1,a:0.2},
    sunrise:{v:0.6,a:0.2}, sunset:{v:0.3,a:0.15}, ocean:{v:0.2,a:0.3},
    storm:{v:-0.2,a:0.8}, rain:{v:0,a:0.2}, fire:{v:0,a:0.9},
    forest:{v:0.3,a:0.1}, night:{v:-0.1,a:0.1}, morning:{v:0.5,a:0.3},
    dark:{v:-0.4,a:0.3}, light:{v:0.5,a:0.4}, warm:{v:0.4,a:0.3},
    cold:{v:-0.2,a:0.2}, soft:{v:0.2,a:0.1}, loud:{v:0,a:0.9},
    quiet:{v:0.1,a:0.05}, deep:{v:0,a:0.3}, high:{v:0.3,a:0.6},
};

function parseEmotion(text) {
    let words = text.toLowerCase().split(/\\s+/);
    let v=0, a=0, n=0;
    for (let w of words) {
        if (EMOTIONS[w]) { v+=EMOTIONS[w].v; a+=EMOTIONS[w].a; n++; }
    }
    if (n===0) { v=0; a=0.3; } else { v/=n; a/=n; }
    return {valence:v, arousal:a};
}

function emotionToSound(valence, arousal) {
    // Map valence/arousal to musical parameters
    // Valence → major/minor (frequency ratios), brightness
    // Arousal → tempo, volume, harmonic density

    // Base frequency: 110-440Hz, valence shifts it up (brighter = happier)
    let baseFreq = 220 * Math.pow(2, valence * 0.5);

    // Chord: major (happy) vs minor (sad)
    let third = valence > 0 ? 5/4 : 6/5; // major third vs minor third
    let fifth = 3/2;
    let seventh = valence > 0 ? 15/8 : 9/5; // major 7th vs minor 7th

    // Tempo: 40-180 BPM based on arousal
    let bpm = 40 + arousal * 140;

    // Volume: 0.05-0.3 based on arousal
    let volume = 0.05 + arousal * 0.25;

    // Detune: more for negative valence (dissonance)
    let detune = Math.max(0, -valence) * 15;

    // Filter: brighter for positive valence
    let filterFreq = 500 + (valence + 1) * 1500;

    // Reverb: more for calm
    let reverbTime = 2 - arousal * 1.5;

    return { baseFreq, third, fifth, seventh, bpm, volume, detune, filterFreq, reverbTime };
}

function play() {
    stop();
    const text = document.getElementById('feeling').value || 'calm';
    const {valence, arousal} = parseEmotion(text);
    const params = emotionToSound(valence, arousal);

    // Show parameters
    const pd = document.getElementById('params');
    pd.style.display = 'block';
    pd.innerHTML = `
        <div class="row"><span class="label">Feeling</span><span class="val">${text}</span></div>
        <div class="row"><span class="label">Valence</span><span class="val">${valence>0?'+':''}${valence.toFixed(2)} (${valence>0?'positive':'negative'})</span></div>
        <div class="row"><span class="label">Arousal</span><span class="val">${arousal.toFixed(2)} (${arousal>0.5?'intense':'calm'})</span></div>
        <div class="row"><span class="label">Base freq</span><span class="val">${params.baseFreq.toFixed(1)} Hz</span></div>
        <div class="row"><span class="label">Chord</span><span class="val">${valence>0?'Major':'Minor'} ${params.seventh>1.8?'7th':'triad'}</span></div>
        <div class="row"><span class="label">Tempo</span><span class="val">${params.bpm.toFixed(0)} BPM</span></div>
        <div class="row"><span class="label">Brightness</span><span class="val">${params.filterFreq.toFixed(0)} Hz cutoff</span></div>
    `;

    ctx = new (window.AudioContext || window.webkitAudioContext)();
    analyser = ctx.createAnalyser();
    analyser.fftSize = 256;
    analyser.connect(ctx.destination);

    // Create chord tones
    const freqs = [
        params.baseFreq,
        params.baseFreq * params.third,
        params.baseFreq * params.fifth,
        params.baseFreq * params.seventh * 0.5, // octave down
    ];

    const masterGain = ctx.createGain();
    masterGain.gain.value = params.volume;
    masterGain.connect(analyser);

    const filter = ctx.createBiquadFilter();
    filter.type = 'lowpass';
    filter.frequency.value = params.filterFreq;
    filter.Q.value = 1 + arousal * 3;
    filter.connect(masterGain);

    for (let freq of freqs) {
        const osc = ctx.createOscillator();
        osc.type = arousal > 0.5 ? 'sawtooth' : 'sine';
        osc.frequency.value = freq + (Math.random()-0.5) * params.detune;

        // LFO for movement
        const lfo = ctx.createOscillator();
        lfo.frequency.value = 0.1 + arousal * 2;
        const lfoGain = ctx.createGain();
        lfoGain.gain.value = freq * 0.01 * (1 + arousal);
        lfo.connect(lfoGain);
        lfoGain.connect(osc.frequency);
        lfo.start();

        const g = ctx.createGain();
        g.gain.value = 0.25;
        osc.connect(g);
        g.connect(filter);
        osc.start();
        nodes.push(osc, lfo);
    }

    // Pulse/rhythm via gain modulation if arousal > 0.3
    if (arousal > 0.3) {
        const beatHz = params.bpm / 60;
        const pulseOsc = ctx.createOscillator();
        pulseOsc.frequency.value = beatHz;
        const pulseGain = ctx.createGain();
        pulseGain.gain.value = 0.3 * arousal;
        pulseOsc.connect(pulseGain);
        pulseGain.connect(masterGain.gain);
        pulseOsc.start();
        nodes.push(pulseOsc);
    }

    // Visualize
    const canvas = document.getElementById('viz');
    const cctx = canvas.getContext('2d');
    canvas.width = canvas.offsetWidth * 2;
    canvas.height = canvas.offsetHeight * 2;

    function draw() {
        const data = new Uint8Array(analyser.frequencyBinCount);
        analyser.getByteFrequencyData(data);
        cctx.fillStyle = '#0d0d12';
        cctx.fillRect(0, 0, canvas.width, canvas.height);

        const barW = canvas.width / data.length;
        for (let i = 0; i < data.length; i++) {
            const h = (data[i] / 255) * canvas.height;
            const hue = 140 + (i/data.length) * 60; // green to cyan
            cctx.fillStyle = `hsl(${hue}, 100%, ${30 + data[i]/255*40}%)`;
            cctx.fillRect(i * barW, canvas.height - h, barW - 1, h);
        }
        animId = requestAnimationFrame(draw);
    }
    draw();
}

function stop() {
    if (nodes.length) { nodes.forEach(n => { try{n.stop();}catch(e){} }); nodes=[]; }
    if (ctx) { ctx.close(); ctx=null; }
    if (animId) { cancelAnimationFrame(animId); animId=null; }
}
</script></body></html>"""

# ═══════════════════════════════════════════════════════════════
# TRICK 5: THE ORACLE
# ═══════════════════════════════════════════════════════════════

@app.get("/trick/oracle", response_class=HTMLResponse)
async def oracle_page():
    return _trick_page("🔮 The Oracle",
        "Ask anything. Cross-domain structural reasoning — or honest silence (CUT).",
        "oracle", "Ask the oracle...")

@app.get("/api/oracle")
async def oracle_api(q: str):
    words = q.lower().split()
    stop_words = {'what','how','why','does','is','the','a','an','to','of','in','my','me','i','and','or','can','do','it','for','with','this','that','be','on','at','about','would','could','should','tell','explain'}
    terms = [w for w in words if w not in stop_words and len(w) > 2]

    if not terms:
        return {"answer": "CUT — I need a concrete concept to search for.", "domains": []}

    all_results = {}
    for term in terms[:4]:
        result = query_domains(term)
        if "0 atoms matched" not in result:
            all_results[term] = result

    if not all_results:
        return {"answer": f"CUT — No matches for {', '.join(terms)} across 29 domains. Honest silence: the domain model has no receipt for this query.", "domains": []}

    # Auto-collide if multiple terms
    collision = ""
    if len(terms) >= 2:
        coll = collide(terms[0], terms[1])
        if "no shared atoms" not in coll.lower():
            collision = coll

    return {"matches": all_results, "collision": collision, "terms": terms}

# ═══════════════════════════════════════════════════════════════
# SHARED TEMPLATE
# ═══════════════════════════════════════════════════════════════

def _trick_page(title, subtitle, api_name, placeholder, placeholder_hint=""):
    hint_html = f'<p style="color:var(--dim);font-size:0.7em;margin-bottom:10px">{placeholder_hint}</p>' if placeholder_hint else ''
    return f"""<!DOCTYPE html>
<html><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>{title}</title>
<style>
:root {{ --bg:#050508; --card:#0d0d12; --border:#1a1a25; --glow:#00ff88; --glow2:#00ccff; --text:#c8c8d0; --dim:#555; }}
* {{ margin:0; padding:0; box-sizing:border-box; }}
body {{ font-family:-apple-system,sans-serif; background:var(--bg); color:var(--text); padding:20px; }}
h1 {{ text-align:center; font-size:1.5em; background:linear-gradient(135deg,var(--glow),var(--glow2)); -webkit-background-clip:text; -webkit-text-fill-color:transparent; margin-bottom:5px; }}
.sub {{ text-align:center; color:var(--dim); font-size:0.8em; margin-bottom:20px; }}
input {{ width:100%; padding:14px 18px; background:var(--card); border:1px solid var(--border); border-radius:16px; color:var(--text); font-size:16px; margin-bottom:10px; -webkit-appearance:none; }}
input:focus {{ outline:none; border-color:var(--glow); }}
button {{ width:100%; padding:14px; background:linear-gradient(135deg,var(--glow),var(--glow2)); color:#000; border:none; border-radius:16px; font-size:16px; font-weight:bold; cursor:pointer; }}
#result {{ background:var(--card); border:1px solid var(--border); border-radius:16px; padding:16px; margin-top:16px; display:none; white-space:pre-wrap; font-family:'SF Mono',monospace; font-size:0.75em; color:var(--dim); max-height:60vh; overflow-y:auto; }}
.back {{ display:block; text-align:center; color:var(--dim); font-size:0.8em; margin-top:16px; text-decoration:none; }}
.loading {{ display:inline-block; width:14px; height:14px; border:2px solid var(--dim); border-top-color:var(--glow); border-radius:50%; animation:spin 0.6s linear infinite; }}
@keyframes spin {{ to {{ transform:rotate(360deg); }} }}
</style></head><body>
<h1>{title}</h1>
<p class="sub">{subtitle}</p>
{hint_html}
<input id="q" placeholder="{placeholder}" autocomplete="off" />
<button onclick="go()">⚡ GO</button>
<div id="result"></div>
<a class="back" href="/">← Back</a>
<script>
document.getElementById('q').addEventListener('keydown', e => {{ if(e.key==='Enter') go(); }});
async function go() {{
    const q=document.getElementById('q').value;
    if(!q) return;
    const r=document.getElementById('result'); r.style.display='block';
    r.innerHTML='<span class="loading"></span> Searching 29 domains...';
    const res=await fetch('/api/{api_name}?q='+encodeURIComponent(q));
    const data=await res.json();
    if(data.result) r.textContent=data.result;
    else if(data.answer) r.textContent=data.answer;
    else {{
        let txt='';
        if(data.matches) for(const[k,v] of Object.entries(data.matches)) txt+='🔍 '+k+'\\n'+v+'\\n';
        if(data.collision) txt+='\\n💥 COLLISION\\n'+data.collision;
        r.textContent=txt||'CUT';
    }}
}}
</script></body></html>"""

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8888)
