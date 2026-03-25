#!/usr/bin/env python3
"""
TRANSPILER — Python to Meet-n-Greet and back.

As a transpiler, I contain Python source and express it as
1-atom-thick functional equivalents in Meet-n-Greet.

Usage:
    python tools/transpile.py to-mng   script.py        → Meet-n-Greet (.rkt)
    python tools/transpile.py to-py    program.rkt       → Python (.py)
    python tools/transpile.py analyze  script.py         → show essential shape

This is a thin projection layer. Python reads Python (ast module).
The output IS the 1-atom-thick structural equivalent.
"""

import ast
import sys
import re
import textwrap


def python_to_meet_n_greet(source_path):
    """Parse Python source, produce Meet-n-Greet strike program."""
    with open(source_path) as f:
        source = f.read()

    tree = ast.parse(source)
    module_name = source_path.replace("/", "-").replace(".py", "").replace(".", "-")

    lines = []
    lines.append("#lang strike")
    lines.append("")
    lines.append(f";;; Transpiled from {source_path}")
    lines.append(f";;; 1-atom-thick functional equivalent")
    lines.append("")
    lines.append(f"({module_name}")
    lines.append("")
    lines.append(f"  ((source ({source_path}) (transpiled) (({source_path} . transpiled))))")
    lines.append("")
    lines.append("  (")

    for node in ast.iter_child_nodes(tree):
        if isinstance(node, ast.FunctionDef):
            lines.extend(function_to_transform(node))
        elif isinstance(node, ast.ClassDef):
            lines.extend(class_to_domain(node))
        elif isinstance(node, ast.Import) or isinstance(node, ast.ImportFrom):
            lines.extend(import_to_bridge(node))
        elif isinstance(node, ast.Assign):
            lines.extend(assign_to_registration(node))

    lines.append("")
    lines.append("  )")
    lines.append("")
    lines.append(f"  ((source . {module_name}-transpiled)))")

    return "\n".join(lines)


def function_to_transform(node):
    """As a function, I contain parameters and express them as return value."""
    name = atomize(node.name)
    args = [atomize(a.arg) for a in node.args.args if a.arg != "self"]
    source = "-and-".join(args) if args else "no-input"

    # Find return statements
    returns = []
    for child in ast.walk(node):
        if isinstance(child, ast.Return) and child.value:
            returns.append(child)

    target = "residue"
    if returns:
        target = atomize(ast.dump(returns[0].value)[:60])

    # Extract the causal chain from the function body
    pairs = extract_pairs_from_body(node.body, source)

    lines = []
    lines.append("")
    lines.append(f"    ({name}")
    lines.append(f"      ({source})")
    lines.append(f"      ({target})")

    if pairs:
        pair_strs = [f"({a} . {b})" for a, b in pairs]
        lines.append(f"      ({' '.join(pair_strs)}))")
    else:
        lines.append(f"      (({source} . {target})))")

    return lines


def extract_pairs_from_body(body, seed):
    """Walk function body, extract causal chain as (key . value) pairs."""
    pairs = []
    prev = seed

    for stmt in body:
        if isinstance(stmt, ast.Assign):
            for target in stmt.targets:
                name = atomize(ast.dump(target)[:40])
                pairs.append((prev, name))
                prev = name

        elif isinstance(stmt, ast.If):
            condition = atomize(ast.dump(stmt.test)[:40])
            pairs.append((prev, f"if-{condition}"))
            # True branch
            true_atom = f"then-{atomize(ast.dump(stmt.body[0])[:30])}" if stmt.body else "then-pass"
            pairs.append((f"if-{condition}", true_atom))
            # False branch
            if stmt.orelse:
                false_atom = f"else-{atomize(ast.dump(stmt.orelse[0])[:30])}" if stmt.orelse else "else-pass"
                pairs.append((f"if-{condition}", false_atom))
            prev = true_atom

        elif isinstance(stmt, ast.For):
            iter_name = atomize(ast.dump(stmt.iter)[:40])
            pairs.append((prev, f"for-each-in-{iter_name}"))
            if stmt.body:
                body_atom = atomize(ast.dump(stmt.body[0])[:30])
                pairs.append((f"for-each-in-{iter_name}", f"do-{body_atom}"))
                prev = f"do-{body_atom}"

        elif isinstance(stmt, ast.Return):
            if stmt.value:
                ret = atomize(ast.dump(stmt.value)[:40])
                pairs.append((prev, ret))
                prev = ret

        elif isinstance(stmt, ast.Expr):
            if isinstance(stmt.value, ast.Call):
                call = atomize(ast.dump(stmt.value)[:50])
                pairs.append((prev, call))
                prev = call

        elif isinstance(stmt, ast.Try):
            pairs.append((prev, "trace-attempt"))
            if stmt.body:
                body_atom = atomize(ast.dump(stmt.body[0])[:30])
                pairs.append(("trace-attempt", body_atom))
            if stmt.handlers:
                pairs.append(("trace-attempt", "CUT"))
            prev = "trace-attempt"

    return pairs


def class_to_domain(node):
    """As a class, I contain methods and express them as a domain of transforms."""
    name = atomize(node.name)
    bases = [atomize(b.id) if isinstance(b, ast.Name) else "object" for b in node.bases]
    bridge = bases[0] if bases else "no-base"

    lines = []
    lines.append("")
    lines.append(f"    ;;; domain: {name} (inherits: {bridge})")

    for item in node.body:
        if isinstance(item, ast.FunctionDef):
            lines.extend(function_to_transform(item))

    return lines


def import_to_bridge(node):
    """As an import, I contain a cross-domain reference."""
    lines = []
    if isinstance(node, ast.Import):
        for alias in node.names:
            name = atomize(alias.name)
            lines.append("")
            lines.append(f"    ;;; bridge: {name}")
    elif isinstance(node, ast.ImportFrom):
        module = atomize(node.module) if node.module else "unknown"
        for alias in node.names:
            name = atomize(alias.name)
            lines.append("")
            lines.append(f"    ;;; bridge: {name} from {module}")
    return lines


def assign_to_registration(node):
    """As an assignment, I contain a name bound to a value."""
    lines = []
    for target in node.targets:
        if isinstance(target, ast.Name):
            name = atomize(target.id)
            val = atomize(ast.dump(node.value)[:50])
            lines.append("")
            lines.append(f"    ({name}-registration")
            lines.append(f"      ({val})")
            lines.append(f"      ({name}-registered)")
            lines.append(f"      (({val} . {name}-registered)))")
    return lines


def atomize(s):
    """Convert any string to a valid strike atom (hyphenated, no special chars)."""
    s = str(s)
    # Remove AST wrapper names
    s = re.sub(r"^(Name|Call|Attribute|Subscript|Constant|BinOp|Compare|BoolOp)\(", "", s)
    s = re.sub(r"\)$", "", s)
    # Clean up
    s = re.sub(r"[^a-zA-Z0-9_-]", "-", s)
    s = re.sub(r"-+", "-", s)
    s = s.strip("-")
    s = s[:60]  # max atom length
    if not s:
        s = "empty"
    return s


def meet_n_greet_to_python(source_path):
    """Parse a strike program, produce Python equivalent."""
    with open(source_path) as f:
        source = f.read()

    # Extract transforms: (label (source) (target) ((pairs)))
    transforms = re.findall(
        r'\((\S+)\s*\(([^)]*)\)\s*\(([^)]*)\)\s*\((\([^)]+\. [^)]+\)(?:\s*\([^)]+\. [^)]+\))*)\)\)',
        source
    )

    lines = []
    lines.append(f'"""Instantiated from {source_path}"""')
    lines.append("")

    for label, src, tgt, pairs_str in transforms:
        # Skip metadata transforms
        if label in ("source", "meta", "declaration", "foundation"):
            continue

        # Parse pairs
        pair_list = re.findall(r'\((\S+) \. (\S+)\)', pairs_str)

        func_name = label.replace("-", "_")
        param = src.replace("-", "_") if src else "input"

        lines.append(f"def {func_name}({param}):")
        lines.append(f'    """As {label}, I contain {src} and express {src} as {tgt}."""')

        if pair_list:
            for i, (k, v) in enumerate(pair_list):
                var_name = v.replace("-", "_")
                if i == 0:
                    lines.append(f"    {var_name} = {param}  # {k} -> {v}")
                else:
                    prev_v = pair_list[i-1][1].replace("-", "_")
                    lines.append(f"    {var_name} = {prev_v}  # {k} -> {v}")
            last_var = pair_list[-1][1].replace("-", "_")
            lines.append(f"    return {last_var}")
        else:
            lines.append(f"    return {param}")

        lines.append("")

    return "\n".join(lines)


def analyze(source_path):
    """Show the essential shape of a Python file."""
    mng = python_to_meet_n_greet(source_path)
    # Count transforms
    transform_count = mng.count("      (") // 3  # rough estimate
    pair_count = mng.count(" . ")

    print(f"  Source: {source_path}")
    print(f"  Transforms: ~{transform_count}")
    print(f"  Pairs: {pair_count}")
    print(f"  1-atom-thick: {pair_count} causal steps")
    print()
    print(mng)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage:")
        print("  python tools/transpile.py to-mng   script.py   → Meet-n-Greet")
        print("  python tools/transpile.py to-py    program.rkt  → Python")
        print("  python tools/transpile.py analyze  script.py    → show shape")
        sys.exit(1)

    command = sys.argv[1]
    source = sys.argv[2]

    if command == "to-mng":
        print(python_to_meet_n_greet(source))
    elif command == "to-py":
        print(meet_n_greet_to_python(source))
    elif command == "analyze":
        analyze(source)
    else:
        print(f"Unknown command: {command}")
        sys.exit(1)
