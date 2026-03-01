#!/usr/bin/env python3
"""The striking surface. Five capabilities. Nothing else."""
import sys, subprocess

F = {}  # the flowspace — label to shape

def balanced(s):
    d = 0
    for c in str(s):
        if c == '(': d += 1
        elif c == ')': d -= 1
        if d < 0: return False
    return d == 0

def external(cmd):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return r.stdout.strip()

def emit(s):
    print(s)

def verify(source, target, residue):
    if not residue:
        # empty residue: source is already at ground. if target IS ground, that's complete.
        if str(target) in ('ground', 'e') or str(source) == str(target):
            return True, "at ground"
        return False, "empty"
    chain = all(residue[i][1] == residue[i+1][0] for i in range(len(residue)-1))
    grounded = residue[0][0] == str(source)
    # "ground" and "e" mean: current stopped wherever it stopped. that's complete.
    complete = (residue[-1][1] == str(target)) or str(target) in ('ground', 'e')
    bal = all(r[0] != r[1] for r in residue)
    minimal = len(set(r[0] for r in residue)) == len(residue)
    ok = chain and grounded and complete and bal and minimal
    s = f"chain{'✓' if chain else '✗'} grounded{'✓' if grounded else '✗'} complete{'✓' if complete else '✗'} balanced{'✓' if bal else '✗'} minimal{'✓' if minimal else '✗'}"
    return ok, s

for line in open(sys.argv[1]):
    line = line.strip()
    if not line or line.startswith('#'): continue
    parts = line.split(None, 2)
    op = parts[0]

    if op == 'presence':
        F[parts[1]] = parts[2] if len(parts) > 2 else '()'
        emit(f'  ({parts[1]})')

    elif op == 'contain':
        o, i = parts[1], parts[2]
        cur = F.get(o, [])
        if not isinstance(cur, list): cur = [cur]
        cur.append(F.get(i, i))
        F[o] = cur
        emit(f'  (({i}) in ({o}))')

    elif op == 'label':
        F[parts[2]] = F.get(parts[1], parts[1])
        emit(f'  e:{parts[2]} -> ({parts[1]})')

    elif op == 'transform':
        p = line.split()
        # resolve source: if it names a completed transform, use its residue's final value
        src = F.get(p[2], p[2])
        if isinstance(src, dict) and src.get('r'):
            src = src['r'][-1][1]  # last step's endpoint
        tgt = F.get(p[3], p[3])
        if isinstance(tgt, dict) and tgt.get('r'):
            tgt = tgt['r'][-1][1]
        F[p[1]] = {'s': src, 't': tgt, 'w': None, 'r': []}
        emit(f'  ({p[1]}): ({p[2]}) -> ({p[3]}) (())')

    elif op == 'wire':
        p = line.split(None, 2)
        if p[1] in F and isinstance(F[p[1]], dict):
            F[p[1]]['w'] = p[2]
            emit(f'  ({p[1]}) ~ {p[2]}')

    elif op == 'strike':
        t = F.get(parts[1])
        if isinstance(t, dict) and t.get('w'):
            raw = external(f"{t['w']} '{t['s']}' '{t['t']}'")
            residue = []
            for rl in raw.split('\n'):
                if '->' in rl:
                    a, b = rl.split('->', 1)
                    residue.append((a.strip(), b.strip()))
            t['r'] = residue
            ok, status = verify(t['s'], t['t'], residue)
            emit(f'  strike {parts[1]}: {len(residue)} shapes')
            emit(f'  {status}')
            if ok:
                emit(f'  )  complete.')
            else:
                emit(f'  CUT')

    elif op == 'recognize':
        emit(f'  {"recognized" if parts[1] in F else "absent"}: ({parts[1]})')

    elif op == 'disclose':
        shape = F.get(parts[1])
        if shape is None:
            emit(f'  absent')
        elif isinstance(shape, dict):
            emit(f'  META: {parts[1]}')
            emit(f'  OUTSIDE: ({shape["s"]}) -> ({shape["t"]}) [{len(shape["r"])} shapes]')
            for r in shape['r']:
                emit(f'    {r[0]} -> {r[1]}')
        else:
            emit(f'  ({parts[1]}) = {shape}')
