import plotly.graph_objects as go
from plotly.subplots import make_subplots
import numpy as np
import pandas as pd
import math

# --- 0. Parametro di Discretizzazione ---
LIVELLI_K = 50

# --- 1. Funzione di Mappatura Unica (Metodo 1) - CORRETTA ---
def calcola_stato_armonico_unico(centroide, densita, spread, livelli_k):
    """
    Calcola un valore di stato armonico unico mappando i parametri 3D discretizzati
    a uno spazio 1D. L'ordine di importanza è Centroide > Densità > Spread.
    I parametri di input sono attesi nell'intervallo [0, 1].
    Restituisce un valore normalizzato [0, 1].
    """
    # Validazione input (gestisce sia scalari che array numpy)
    is_array_input = False
    if isinstance(centroide, (list, np.ndarray)):
        is_array_input = True
        if not (np.all((0 <= np.array(centroide)) & (np.array(centroide) <= 1)) and
                np.all((0 <= np.array(densita)) & (np.array(densita) <= 1)) and
                np.all((0 <= np.array(spread)) & (np.array(spread) <= 1))):
            raise ValueError("Tutti i parametri degli array devono essere nell'intervallo [0, 1]")
    else: # Input scalari
        if not (0 <= centroide <= 1 and 0 <= densita <= 1 and 0 <= spread <= 1):
            raise ValueError("I parametri scalari devono essere nell'intervallo [0, 1]")

    # Converti in array numpy se non lo sono già, per operazioni vettoriali
    if not is_array_input:
        centroide = np.array([centroide])
        densita = np.array([densita])
        spread = np.array([spread])
    else: # Assicura che siano array numpy se erano liste
        centroide = np.array(centroide)
        densita = np.array(densita)
        spread = np.array(spread)


    # Discretizza ogni parametro in 'livelli_k' livelli (indici da 0 a k-1)
    centroide_int = np.round(centroide * (livelli_k - 1)).astype(int)
    densita_int = np.round(densita * (livelli_k - 1)).astype(int)
    spread_int = np.round(spread * (livelli_k - 1)).astype(int)

    # Assicura che gli indici rimangano nell'intervallo [0, k-1]
    centroide_int = np.clip(centroide_int, 0, livelli_k - 1)
    densita_int = np.clip(densita_int, 0, livelli_k - 1)
    spread_int = np.clip(spread_int, 0, livelli_k - 1)

    # Combina gli indici in un valore intero unico
    valore_unico_int = (centroide_int * (livelli_k * livelli_k) +
                        densita_int * livelli_k +
                        spread_int)

    # Normalizza il valore nell'intervallo [0, 1]
    max_val_int = ((livelli_k - 1) * (livelli_k * livelli_k) +
                   (livelli_k - 1) * livelli_k +
                   (livelli_k - 1))

    if max_val_int == 0: # Caso k=1
        stato_armonico_normalizzato = np.zeros_like(valore_unico_int, dtype=float)
    else:
        stato_armonico_normalizzato = valore_unico_int / max_val_int
    
    # Se l'input era scalare, restituisci uno scalare
    if not is_array_input and stato_armonico_normalizzato.size == 1:
        return stato_armonico_normalizzato.item()
    return stato_armonico_normalizzato

# Il resto del codice rimane invariato:

# --- 2. Definizione degli Stati Tipici e di Interesse ---
val_B = 0.1
val_M = 0.5
val_A = 0.9

stati_config = {
    "Minimo (0,0,0)": (0.0, 0.0, 0.0),
    "B-B-B (D:0.1,S:0.1,C:0.1)": (val_B, val_B, val_B),
    "M-M-M (D:0.5,S:0.5,C:0.5)": (val_M, val_M, val_M),
    "A-A-A (D:0.9,S:0.9,C:0.9)": (val_A, val_A, val_A),
    "Massimo (1,1,1)": (1.0, 1.0, 1.0),

    "Solo Centroide Alto (D:0,S:0,C:1)": (0.0, 0.0, 1.0),
    "Solo Densità Alta (D:1,S:0,C:0)": (1.0, 0.0, 0.0),
    "Solo Spread Alto (D:0,S:1,C:0)": (0.0, 1.0, 0.0),

    "Quasi Uguali 1a (D:0.5,S:0.5,C:0.78)": (0.5, 0.5, 0.78),
    "Quasi Uguali 1b (D:0.5,S:0.5,C:0.81)": (0.5, 0.5, 0.81),

    "Quasi Uguali 2a (D:0.5,S:0.23,C:0.5)": (0.5, 0.23, 0.5),
    "Quasi Uguali 2b (D:0.5,S:0.28,C:0.5)": (0.5, 0.28, 0.5),

    "Ex-Conflitto 1 (C:1,D:0,S:0)": (0.0, 0.0, 1.0), # Stesso di "Solo Centroide Alto"
    "Ex-Conflitto 2 (C:0,D:1,S:1)": (1.0, 1.0, 0.0),
}

stati_data = []
print(f"--- Calcolo Stati Armonici Unici (k={LIVELLI_K}) ---")
for nome, (d, s, c) in stati_config.items():
    sa_unico = calcola_stato_armonico_unico(c, d, s, livelli_k=LIVELLI_K)
    stati_data.append({
        "nome": nome,
        "densita": d,
        "spread": s,
        "centroide": c,
        "stato_armonico_unico": sa_unico
    })
    c_int = int(round(c * (LIVELLI_K - 1)))
    d_int = int(round(d * (LIVELLI_K - 1)))
    s_int = int(round(s * (LIVELLI_K - 1)))
    c_int = max(0, min(LIVELLI_K - 1, c_int))
    d_int = max(0, min(LIVELLI_K - 1, d_int))
    s_int = max(0, min(LIVELLI_K - 1, s_int))
    val_int = (c_int * (LIVELLI_K * LIVELLI_K) + d_int * LIVELLI_K + s_int)
    print(f"{nome:<40} | C,D,S: ({c:.2f},{d:.2f},{s:.2f}) -> Cds_int: ({c_int},{d_int},{s_int}) -> Val_int: {val_int} -> SA_unico: {sa_unico:.4f}")

df_stati = pd.DataFrame(stati_data)

# --- 3. Generazione di una Griglia di Punti per lo Spazio 3D ---
n_punti_asse = 7
d_vals = np.linspace(0, 1, n_punti_asse)
s_vals = np.linspace(0, 1, n_punti_asse)
c_vals = np.linspace(0, 1, n_punti_asse)

grid_d, grid_s, grid_c = np.meshgrid(d_vals, s_vals, c_vals)
grid_d_flat = grid_d.flatten()
grid_s_flat = grid_s.flatten()
grid_c_flat = grid_c.flatten()

grid_sa_unico = calcola_stato_armonico_unico(grid_c_flat, grid_d_flat, grid_s_flat, livelli_k=LIVELLI_K)

# --- 4. Creazione della Visualizzazione Interattiva ---
fig = make_subplots(
    rows=2, cols=1,
    specs=[[{'type': 'scene'}], [{'type': 'xy'}]],
    row_heights=[0.7, 0.3],
    vertical_spacing=0.1,
    subplot_titles=(
        f"Spazio 3D Parametri (Colorato per SA Unico, k={LIVELLI_K})",
        "Mappatura su Scala 1D dello Stato Armonico Unico (0-1)"
    )
)

fig.add_trace(go.Scatter3d(
    x=grid_d_flat, y=grid_s_flat, z=grid_c_flat,
    mode='markers',
    marker=dict(
        size=3,
        color=grid_sa_unico,
        colorscale='Plasma',
        opacity=0.3,
        colorbar=dict(title="SA Unico", x=1.0, thickness=15)
    ),
    hoverinfo='text',
    hovertext=[
        f"D:{d:.2f}, S:{s:.2f}, C:{c:.2f}<br>SA_unico: {sa:.3f}"
        for d, s, c, sa in zip(grid_d_flat, grid_s_flat, grid_c_flat, grid_sa_unico)
    ],
    name="Griglia Spazio Parametri"
), row=1, col=1)

fig.add_trace(go.Scatter3d(
    x=df_stati['densita'], y=df_stati['spread'], z=df_stati['centroide'],
    mode='markers+text',
    marker=dict(
        size=8,
        color=df_stati['stato_armonico_unico'],
        colorscale='Plasma',
        opacity=1,
        line=dict(color='black', width=1)
    ),
    text=df_stati['stato_armonico_unico'].apply(lambda x: f"{x:.3f}"),
    textposition="top center",
    hoverinfo='text',
    hovertext=[
        f"<b>{row['nome']}</b><br>D:{row['densita']:.2f}, S:{row['spread']:.2f}, C:{row['centroide']:.2f}<br><b>SA_unico: {row['stato_armonico_unico']:.4f}</b>"
        for index, row in df_stati.iterrows()
    ],
    name="Stati Definiti"
), row=1, col=1)

fig.update_layout(
    scene=dict(
        xaxis_title='Densità Armonica (D)',
        yaxis_title='Spread di Ottave (S)',
        zaxis_title='Centroide Spettrale (C)',
        xaxis=dict(range=[0,1]),
        yaxis=dict(range=[0,1]),
        zaxis=dict(range=[0,1]),
        aspectmode='cube'
    ),
    margin=dict(l=0, r=0, b=0, t=50)
)

y_values_1d_ordered = np.zeros(len(df_stati))
y_increment = 0.08
current_y_level = 0
precision_grouping = 8
df_stati['sa_unico_rounded'] = df_stati['stato_armonico_unico'].round(precision_grouping)
unique_sa_values_sorted = sorted(df_stati['sa_unico_rounded'].unique())
processed_indices_for_y_assignment = set()

for sa_val_rounded in unique_sa_values_sorted:
    matching_indices = df_stati[df_stati['sa_unico_rounded'] == sa_val_rounded].index
    if len(matching_indices) > 1:
        temp_y_offset = 0
        is_new_group_level = False
        for idx in matching_indices:
            if idx not in processed_indices_for_y_assignment:
                y_values_1d_ordered[idx] = current_y_level * y_increment + temp_y_offset
                temp_y_offset += y_increment * 0.5 
                processed_indices_for_y_assignment.add(idx)
                is_new_group_level = True # Segna che questo livello y è stato usato
        if is_new_group_level : # Incrementa solo se abbiamo effettivamente posizionato un gruppo qui
            current_y_level += 1
    else:
        idx = matching_indices[0]
        if idx not in processed_indices_for_y_assignment:
            y_values_1d_ordered[idx] = 0
            processed_indices_for_y_assignment.add(idx)

fig.add_trace(go.Scatter(
    x=df_stati['stato_armonico_unico'],
    y=y_values_1d_ordered,
    mode='markers+text',
    marker=dict(
        size=10,
        color=df_stati['stato_armonico_unico'],
        colorscale='Plasma',
        showscale=False
    ),
    text=df_stati['nome'].apply(lambda n: n.split(" (")[0]),
    textposition="top right",
    textfont=dict(size=9),
    hoverinfo='text',
    hovertext=[
        (f"<b>{row['nome']}</b><br><b>SA_unico: {row['stato_armonico_unico']:.4f}</b>"
         f"<br>(D:{row['densita']:.2f}, S:{row['spread']:.2f}, C:{row['centroide']:.2f})")
        for index, row in df_stati.iterrows()
    ],
    name="Stati Mappati su 1D"
), row=2, col=1)

y_axis_max_range = 0.2
if current_y_level > 0: # Se ci sono stati gruppi sfalsati
    y_axis_max_range = max((current_y_level + 1) * y_increment, 0.2)

fig.update_xaxes(title_text="Valore Stato Armonico Unico (SA_unico)", range=[-0.05, 1.05], row=2, col=1)
fig.update_yaxes(
    showticklabels=False, showgrid=False, zeroline=True, zerolinewidth=1, zerolinecolor='grey',
    range=[-0.05, y_axis_max_range],
    row=2, col=1
)

fig.update_layout(
    height=900,
    title_text=f"Mappatura Dimensionale Unica (k={LIVELLI_K}) e Impatto Discretizzazione",
    title_x=0.5,
    legend_orientation="h", legend_yanchor="bottom", legend_y=1.02, legend_xanchor="center", legend_x=0.5
)

print("\n--- Analisi 'Conflitti di Discretizzazione' (Stati Definiti con stesso SA_unico) ---")
grouped_by_sa = df_stati.groupby('sa_unico_rounded')
found_conflicts = False
for sa_val, group in grouped_by_sa:
    if len(group) > 1:
        found_conflicts = True
        print(f"SA_unico: {sa_val:.4f} generato da {len(group)} stati:")
        for index, row in group.iterrows():
            c_int_dbg = int(round(row['centroide'] * (LIVELLI_K - 1)))
            d_int_dbg = int(round(row['densita'] * (LIVELLI_K - 1)))
            s_int_dbg = int(round(row['spread'] * (LIVELLI_K - 1)))
            c_int_dbg = max(0, min(LIVELLI_K - 1, c_int_dbg))
            d_int_dbg = max(0, min(LIVELLI_K - 1, d_int_dbg))
            s_int_dbg = max(0, min(LIVELLI_K - 1, s_int_dbg))
            print(f"  - {row['nome']} (C:{row['centroide']:.2f}, D:{row['densita']:.2f}, S:{row['spread']:.2f}) -> Indici C,D,S: ({c_int_dbg},{d_int_dbg},{s_int_dbg})")
if not found_conflicts:
    print("Nessuno degli stati definiti ha prodotto lo stesso SA_unico con k =", LIVELLI_K)

desc_testo = f"""
<b>Come leggere il grafico (Mappatura Unica con k={LIVELLI_K}):</b><br>
- <b>Grafico Superiore (3D)</b>: Mostra lo spazio D-S-C. Il colore indica 'stato_armonico_unico' (SA_unico).<br>
  SA_unico è calcolato discretizzando ogni parametro in {LIVELLI_K} livelli e combinandoli in un indice unico normalizzato.<br>
  L'ordine di importanza per l'indice è: Centroide > Densità > Spread.<br>
- <b>Grafico Inferiore (1D)</b>: Proiezione dei punti 3D sulla scala SA_unico (0-1).<br>
  <b>'Conflitti di Discretizzazione'</b>: Se due stati definiti originali (con valori D,S,C diversi) vengono mappati<br>
  alla *stessa combinazione di indici discreti* a causa dell'arrotondamento con {LIVELLI_K} livelli, otterranno lo stesso SA_unico.<br>
  Questi punti appariranno con lo stesso valore sull'asse x e sono sfalsati verticalmente per visibilità.<br>
  Aumentare `LIVELLI_K` riduce la probabilità di tali conflitti per stati vicini.
"""
print("\n" + desc_testo.replace("<br>", "\n").replace("<b>","").replace("</b>","").replace("<code>","").replace("</code>",""))

fig.show()