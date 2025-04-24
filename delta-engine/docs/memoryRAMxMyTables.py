import re
import sys
import csv

def parse_orc_memory(filepath, bytes_per_value=8, csv_path="memory_report.csv"):
    # 1) Regex per #define, init, assign, ftgen
    define_re = re.compile(r'^\s*#define\s+(\w+)\s+#(\d+)#')
    init_re   = re.compile(r'^\s*(g[akip]\w*)\s+init\s+(.+)$')
    assign_re = re.compile(r'^\s*(g[akip]\w*)\s*=\s*(.+)$')
    ftgen_re  = re.compile(r'^\s*(g[akip]\w*)\s+ftgen\s+[^,]+,\s*[^,]+,\s*([^,]+)')

    var_exprs  = {}
    var_values = {}

    # 2) Leggi file, processa define, sostituisci macro e raccogli definizioni
    lines = []
    with open(filepath) as f:
        for raw in f:
            # rimuovi newline
            no_nl = raw.rstrip('\n')
            # #define OTTAVE #10#
            mdef = define_re.match(no_nl)
            if mdef:
                key, val = mdef.groups()
                # salviamo direttamente come valore float
                var_values[f"gi_{key}"] = float(val)
                continue

            # rimuovi commenti
            no_comment = no_nl.split(';',1)[0].rstrip()
            # sostituisci macro $OTTAVE → gi_OTTAVE
            line = re.sub(r'\$(\w+)', r'gi_\1', no_comment)
            lines.append(line)

            # match init/assign
            m = init_re.match(line) or assign_re.match(line)
            if m:
                name, expr = m.groups()
                var_exprs[name.strip()] = expr.strip()

    # 3) Risolvi iterativamente le espressioni (init e assign)
    changed = True
    while changed:
        changed = False
        for name, expr in list(var_exprs.items()):
            if name in var_values:
                continue
            try:
                val = eval(expr, {}, var_values)
                var_values[name] = float(val)
                changed = True
            except Exception:
                continue

    # 4) Estrai e calcola le ftgen
    tables = []
    for lineno, line in enumerate(lines, 1):
        m = ftgen_re.match(line)
        if not m:
            continue
        name, size_expr = m.groups()
        try:
            size_val = eval(size_expr, {}, var_values)
        except Exception:
            print(f"⚠️ Warning: non ho potuto valutare “{size_expr}” a riga {lineno}")
            continue
        base_size = int(abs(size_val))
        points    = base_size + 1
        mem       = points * bytes_per_value
        tables.append({
            "line": lineno,
            "name": name,
            "expr": size_expr,
            "base_points": base_size,
            "total_points": points,
            "mem_bytes": mem
        })

    # 5) Calcola memoria variabili semplici
    simple_vars = sorted(var_values.keys())
    mem_simple  = len(simple_vars) * bytes_per_value
    mem_tables  = sum(t["mem_bytes"] for t in tables)
    total_mem   = mem_simple + mem_tables

    # 6) Stampa su console
    print(f"📄 File: {filepath}")
    print(f"🔢 Variabili globali risolte: {len(simple_vars)} → {mem_simple} byte")
    print("📊 Tabelle ftgen trovate:")
    for t in tables:
        print(f"  riga {t['line']}: {t['name']} size={t['expr']} → "
              f"{t['base_points']}+1→{t['total_points']} punti, mem={t['mem_bytes']} byte")
    print(f"🧠 Memoria tabelle: {mem_tables} byte")
    print(f"🧮 Memoria totale stimata: {total_mem} byte ({total_mem/1024:.2f} kB)")

    # 7) Esporta in CSV
    with open(csv_path, "w", newline="") as csvfile:
        fieldnames = ["type","line","name","expr","base_points",
                      "total_points","mem_bytes"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        # variabili
        for name in simple_vars:
            writer.writerow({
                "type":"var","line":"","name":name,"expr":"",
                "base_points":"","total_points":"",
                "mem_bytes":bytes_per_value
            })
        # tabelle
        for t in tables:
            writer.writerow({"type":"table", **t})

    print(f"\n✅ Report CSV scritto in: {csv_path}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python memory_report.py <init.orc> <output.csv>")
        sys.exit(1)
    _, orc, csv_out = sys.argv
    parse_orc_memory(orc, csv_path=csv_out)

# python memory_report.py MACROS/init.orc docs/analysis/memoryRAM.csv
