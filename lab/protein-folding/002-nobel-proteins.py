#!/usr/bin/env python3
"""
NOBEL PROTEIN CHALLENGE
========================
Fold every Nobel Prize-winning protein from first principles.
Compare predictions to known structures.
Document what works, what doesn't, and why.

This IS the science. The receipts ARE the results.
"""

import sys
import os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# ═══════════════════════════════════════════════════════════════
# NOBEL PRIZE PROTEINS — known structures, known biology
# ═══════════════════════════════════════════════════════════════

PROTEINS = {
    # ── 2024 Nobel Chemistry: Computational protein design (Baker/Hassabis/Jumper) ──
    'p24_capsid_ntd': {
        'sequence': 'PIVQNLQGQMVHQAISPRTLNAWVKVVEEKAFSPEVIPMFSALSEGATPQDLNTMLNTVGGHQAAMQMLKETINEEAAEWDRLHPVHAGPIAPGQMREPRGSDIAGTTSTLQEQIGWMTNNPPIPVGEIYKRWIILGLNKIVRMYSPTSILDIRQGPKEPFRDYVDRFYKTLRAEQASQEVKNWMTETLLVQNANPDCKTILKALGPA',
        'known_helix_pct': 70,
        'known_sheet_pct': 5,
        'description': 'HIV-1 p24 capsid NTD — 7 alpha helices (AlphaFold/Jumper 2024 Nobel)',
        'pdb': '3H47',
    },

    # ── 2009 Nobel Chemistry: Ribosome structure (Ramakrishnan/Steitz/Yonath) ──
    # Using a small ribosomal protein L7/L12 (70 residues)
    'ribosomal_L12': {
        'sequence': 'MKFDTAVSEINSFIEALKEGDATRLEILKELFEELVEMDELGFISFKEGVSKLDSKTDSIAALKQAGLKVAEKVAEEA',
        'known_helix_pct': 78,
        'known_sheet_pct': 0,
        'description': 'Ribosomal protein L7/L12 — almost entirely helical (2009 Nobel)',
        'pdb': '1CTF',
    },

    # ── 2004 Nobel Chemistry: Ubiquitin (Ciechanover/Hershko/Rose) ──
    'ubiquitin': {
        'sequence': 'MQIFVKTLTGKTITLEVEPSDTIENVKAKIQDKEGIPPDQQRLIFAGKQLEDGRTLSDYNIQKESTLHLVLRLRGG',
        'known_helix_pct': 23,
        'known_sheet_pct': 28,
        'description': 'Ubiquitin — mixed alpha/beta (2004 Nobel)',
        'pdb': '1UBQ',
    },

    # ── 2018 Nobel Chemistry: Directed evolution (Arnold) ──
    # Green Fluorescent Protein — the tool that made directed evolution visible
    'GFP': {
        'sequence': 'MSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGKLTLKFICTTGKLPVPWPTLVTTFSYGVQCFSRYPDHMKQHDFFKSAMPEGYVQERTIFFKDDGNYKTRAEVKFEGDTLVNRIELKGIDFKEDGNILGHKLEYNYNSHNVYIMADKQKNGIKVNFKIRHNIEDGSVQLADHYQQNTPIGDGPVLLPDNHYLSTQSALSKDPNEKRDHMVLLEFVTAAGITHGMDELYK',
        'known_helix_pct': 15,
        'known_sheet_pct': 45,
        'description': 'GFP — beta barrel (2008 Nobel Shimomura/Chalfie/Tsien, tool for 2018 Arnold)',
        'pdb': '1EMA',
    },

    # ── 1962 Nobel Chemistry: Myoglobin (Kendrew) — first protein structure ever solved ──
    'myoglobin': {
        'sequence': 'VLSEGEWQLVLHVWAKVEADVAGHGQDILIRLFKSHPETLEKFDRFKHLKTEAEMKASEDLKKHGVTVLTALGAILKKKGHHEAELKPLAQSHATKHKIPIKYLEFISEAIIHVLHSRHPGDFGADAQGAMNKALELFRKDIAAKYKELGYQG',
        'known_helix_pct': 78,
        'known_sheet_pct': 0,
        'description': 'Myoglobin — all-alpha, first protein structure solved by X-ray (1962 Nobel)',
        'pdb': '1MBN',
    },

    # ── 1958 Nobel Chemistry: Insulin (Sanger — sequence) ──
    'insulin_b_chain': {
        'sequence': 'FVNQHLCGSHLVEALYLVCGERGFFYTPKT',
        'known_helix_pct': 50,
        'known_sheet_pct': 10,
        'description': 'Insulin B chain — first protein sequenced (1958 Nobel Sanger)',
        'pdb': '4INS',
    },

    # ── 2017 Nobel Chemistry: Cryo-EM (Dubochet/Frank/Henderson) ──
    # Bacteriorhodopsin — the protein Henderson first imaged
    'bacteriorhodopsin': {
        'sequence': 'MLELLPTAVEGVSQAQITGRPEWIWLALGTALMGLGTLYFLVKGMGVSDPDAKKFYAITTLVPAIAFTMYLSMLLGYGLTMVPFGGEQNPIYWARYADWLFTTPLLLLDLALLVDADQGTILALVGADGIMIGTGLVGALTKVYSYRFVWWAISTAAMLYILYVLFFGFTSKAESMRPEVASTFKVLRNVTVVLWSAYPVVWLIGSEGAGIVPLNIETLLFMVLDVSAKVGFGLILLRSRAIFGEAEAPEPSAGDGAAATS',
        'known_helix_pct': 65,
        'known_sheet_pct': 0,
        'description': 'Bacteriorhodopsin — 7-helix transmembrane, first cryo-EM structure (2017 Nobel)',
        'pdb': '1BRD',
    },

    # ── Lysozyme: first enzyme structure (1965) ──
    'lysozyme': {
        'sequence': 'KVFGRCELAAALKPHGLDNYRGYSLGNWVCAAKFESNFNTQATNRNTDGSTDYGILQINSRWWCNDGRTPGSRNLCNIPCSALLSSDITASVNCAKKIVSDGNGMNAWVAWRNRCKGTDVQAWIRGCRL',
        'known_helix_pct': 36,
        'known_sheet_pct': 7,
        'description': 'Hen egg white lysozyme — first enzyme X-ray structure (Phillips 1965)',
        'pdb': '1LYZ',
    },
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL — collect receipts
# ═══════════════════════════════════════════════════════════════

def run_challenge():
    print("═══════════════════════════════════════════════════════════")
    print("  NOBEL PROTEIN CHALLENGE")
    print("  Folding prize-winning proteins from first principles")
    print("  Domain model only. No AlphaFold. No training data.")
    print("═══════════════════════════════════════════════════════════")
    print()

    results = []

    for name, protein in PROTEINS.items():
        result = fold(protein['sequence'])
        known_h = protein['known_helix_pct']
        known_e = protein['known_sheet_pct']
        pred_h = result['helix_pct']
        pred_e = result['sheet_pct']
        h_error = abs(pred_h - known_h)
        e_error = abs(pred_e - known_e)

        results.append({
            'name': name,
            'description': protein['description'],
            'pdb': protein['pdb'],
            'known_helix': known_h,
            'predicted_helix': pred_h,
            'helix_error': h_error,
            'known_sheet': known_e,
            'predicted_sheet': pred_e,
            'sheet_error': e_error,
            'energy': result['energy'],
            'folds': result['folds'],
            'correct_fold': result['folds'],  # all known proteins fold
        })

        print(f"  {protein['description']}")
        print(f"  PDB: {protein['pdb']}")
        print(f"  Helix: predicted {pred_h:.0f}% vs known {known_h}% (error: {h_error:.0f}%)")
        print(f"  Sheet: predicted {pred_e:.0f}% vs known {known_e}% (error: {e_error:.0f}%)")
        print(f"  Energy: {result['energy']:.1f} kJ/mol")
        print(f"  Folds: {'✓' if result['folds'] else '✗'} (expected: ✓)")
        print()

    # Summary
    print("═══════════════════════════════════════════════════════════")
    print("  SUMMARY")
    print("═══════════════════════════════════════════════════════════")

    all_fold = all(r['correct_fold'] for r in results)
    avg_h_error = sum(r['helix_error'] for r in results) / len(results)
    avg_e_error = sum(r['sheet_error'] for r in results) / len(results)

    print(f"  Proteins tested:     {len(results)}")
    print(f"  Correct fold/no-fold: {sum(1 for r in results if r['correct_fold'])}/{len(results)}")
    print(f"  Avg helix error:     {avg_h_error:.1f}%")
    print(f"  Avg sheet error:     {avg_e_error:.1f}%")
    print()

    if avg_h_error < 15:
        print("  HELIX PREDICTION: GOOD (<15% average error)")
    elif avg_h_error < 30:
        print("  HELIX PREDICTION: MODERATE (15-30% average error)")
    else:
        print("  HELIX PREDICTION: NEEDS CALIBRATION (>30% error)")

    if avg_e_error < 15:
        print("  SHEET PREDICTION: GOOD (<15% average error)")
    elif avg_e_error < 30:
        print("  SHEET PREDICTION: MODERATE (15-30% average error)")
    else:
        print("  SHEET PREDICTION: NEEDS CALIBRATION (>30% error)")

    print()
    print("  RECEIPTS COLLECTED. These errors are the calibration signal.")
    print("  The domain model learns from every comparison to known structure.")
    print("═══════════════════════════════════════════════════════════")

if __name__ == '__main__':
    # First, make the fold function importable
    import importlib.util
    spec = importlib.util.spec_from_file_location("engine", "lab/protein-folding/001-fold-from-first-principles.py")
    engine = importlib.util.module_from_spec(spec)

    # Suppress output during import
    import io
    old_stdout = sys.stdout
    sys.stdout = io.StringIO()
    spec.loader.exec_module(engine)
    sys.stdout = old_stdout

    # Override fold to use engine's fold but capture result
    fold = engine.fold

    run_challenge()
