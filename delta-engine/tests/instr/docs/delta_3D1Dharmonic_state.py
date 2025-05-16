import plotly.graph_objects as go
from plotly.subplots import make_subplots
import numpy as np
import pandas as pd

# --- 1. Definizione della Formula e Funzioni Ausiliarie ---
def calcola_stato_armonico(centroide, densita, spread):
    """Calcola lo stato armonico basato sulla formula ponderata."""
    return 0.5 * centroide + 0.3 * densita + 0.2 * spread

# Definiamo i valori per Basso (B), Medio (M), Alto (A)
# Usiamo valori leggermente scostati da 0 e 1 per una migliore visualizzazione,
# ma includiamo anche gli estremi 0 e 1.
val_B = 0.1
val_M = 0.5
val_A = 0.9

# --- 2. Definizione degli Stati Tipici e di Interesse ---
# (Densità, Spread, Centroide) - ATTENZIONE all'ordine dei parametri!
# La formula è: 0.5 * C + 0.3 * D + 0.2 * S
# Quindi per i nostri input (D,S,C) la formula è: 0.5*param[2] + 0.3*param[0] + 0.2*param[1]

stati_config = {
    # Nomi descrittivi e valori (Densità, Spread, Centroide)
    "Minimo Assoluto (0,0,0)": (0.0, 0.0, 0.0),
    "B-B-B (D:0.1,S:0.1,C:0.1)": (val_B, val_B, val_B),
    "M-M-M (D:0.5,S:0.5,C:0.5)": (val_M, val_M, val_M),
    "A-A-A (D:0.9,S:0.9,C:0.9)": (val_A, val_A, val_A),
    "Massimo Assoluto (1,1,1)": (1.0, 1.0, 1.0),

    "Solo Centroide Alto (D:0,S:0,C:1)": (0.0, 0.0, 1.0),
    "Solo Densità Alta (D:1,S:0,C:0)": (1.0, 0.0, 0.0),
    "Solo Spread Alto (D:0,S:1,C:0)": (0.0, 1.0, 0.0),

    # Stati per illustrare conflitti (stesso stato armonico)
    # SA = 0.5 * C + 0.3 * D + 0.2 * S
    # Esempio 1: SA = 0.5
    "Conflitto 1a (C:1, D:0, S:0)": (0.0, 0.0, 1.0), # SA = 0.5*1 + 0.3*0 + 0.2*0 = 0.5
    "Conflitto 1b (C:0, D:1, S:1)": (1.0, 1.0, 0.0), # SA = 0.5*0 + 0.3*1 + 0.2*1 = 0.5
    "Conflitto 1c (C:0.4, D:1, S:0)": (1.0, 0.0, 0.4),# SA = 0.5*0.4 + 0.3*1 + 0.2*0 = 0.2 + 0.3 = 0.5
    "Conflitto 1d (C:0.2, D:0.5, S:1)": (0.5, 1.0, 0.2),# SA = 0.5*0.2 + 0.3*0.5 + 0.2*1 = 0.1 + 0.15 + 0.2 = 0.45 (quasi, modifichiamo)
                                                      # C:0.3, D:0.5, S:1 => 0.15 + 0.15 + 0.2 = 0.5
    "Conflitto 1d (C:0.3, D:0.5, S:1)": (0.5, 1.0, 0.3), # SA = 0.5*0.3 + 0.3*0.5 + 0.2*1.0 = 0.15 + 0.15 + 0.2 = 0.5

    # Esempio 2: SA = 0.3
    "Conflitto 2a (C:0, D:1, S:0)": (1.0, 0.0, 0.0), # SA = 0.5*0 + 0.3*1 + 0.2*0 = 0.3
    "Conflitto 2b (C:0.6, D:0, S:0)": (0.0, 0.0, 0.6), # SA = 0.5*0.6 + 0.3*0 + 0.2*0 = 0.3
    "Conflitto 2c (C:0.2, D:0, S:1)": (0.0, 1.0, 0.2), # SA = 0.5*0.2 + 0.3*0 + 0.2*1 = 0.1 + 0.2 = 0.3
}

# Calcola lo stato armonico per ogni configurazione
stati_data = []
for nome, (d, s, c) in stati_config.items():
    sa = calcola_stato_armonico(c, d, s) # Attenzione all'ordine C, D, S per la funzione
    stati_data.append({
        "nome": nome,
        "densita": d,
        "spread": s,
        "centroide": c,
        "stato_armonico": sa
    })
df_stati = pd.DataFrame(stati_data)

# --- 3. Generazione di una Griglia di Punti per lo Spazio 3D ---
# Questo aiuta a visualizzare come l'intero spazio mappa allo stato armonico
n_punti_asse = 7 # Più punti = più denso ma più lento
d_vals = np.linspace(0, 1, n_punti_asse)
s_vals = np.linspace(0, 1, n_punti_asse)
c_vals = np.linspace(0, 1, n_punti_asse)

grid_d, grid_s, grid_c = np.meshgrid(d_vals, s_vals, c_vals)
grid_d_flat = grid_d.flatten()
grid_s_flat = grid_s.flatten()
grid_c_flat = grid_c.flatten()

grid_sa = calcola_stato_armonico(grid_c_flat, grid_d_flat, grid_s_flat)

# --- 4. Creazione della Visualizzazione Interattiva ---
fig = make_subplots(
    rows=2, cols=1,
    specs=[[{'type': 'scene'}], [{'type': 'xy'}]],
    row_heights=[0.7, 0.3],
    vertical_spacing=0.1,
    subplot_titles=(
        "Spazio 3D dei Parametri Armonici (Colorato per Stato Armonico)",
        "Mappatura su Scala 1D dello Stato Armonico (0-1)"
    )
)

# SOTTOFIGURA 1: Spazio 3D
# Traccia per la griglia di punti (sfondo)
fig.add_trace(go.Scatter3d(
    x=grid_d_flat, y=grid_s_flat, z=grid_c_flat,
    mode='markers',
    marker=dict(
        size=3,
        color=grid_sa,
        colorscale='Viridis', # Puoi provare 'Plasma', 'Blues', 'RdBu', etc.
        opacity=0.3,
        colorbar=dict(title="Stato Armonico", x=1.0, thickness=15) # Sposta la colorbar
    ),
    hoverinfo='text',
    hovertext=[
        f"D:{d:.2f}, S:{s:.2f}, C:{c:.2f}<br>SA: {sa:.3f}"
        for d, s, c, sa in zip(grid_d_flat, grid_s_flat, grid_c_flat, grid_sa)
    ],
    name="Griglia Spazio Parametri"
), row=1, col=1)

# Traccia per gli stati tipici/di interesse
fig.add_trace(go.Scatter3d(
    x=df_stati['densita'], y=df_stati['spread'], z=df_stati['centroide'],
    mode='markers+text',
    marker=dict(
        size=8,
        color=df_stati['stato_armonico'],
        colorscale='Viridis',
        opacity=1,
        line=dict(color='black', width=1)
    ),
    text=df_stati['stato_armonico'].apply(lambda x: f"{x:.2f}"), # Mostra SA vicino al punto
    textposition="top center",
    hoverinfo='text',
    hovertext=[
        f"<b>{row['nome']}</b><br>D:{row['densita']:.2f}, S:{row['spread']:.2f}, C:{row['centroide']:.2f}<br><b>SA: {row['stato_armonico']:.3f}</b>"
        for index, row in df_stati.iterrows()
    ],
    name="Stati Definiti"
), row=1, col=1)

# Layout per la parte 3D
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
    margin=dict(l=0, r=0, b=0, t=50) # Margini ridotti
)


# SOTTOFIGURA 2: Scala 1D
# Aggiungiamo un leggero jitter verticale per distinguere meglio i punti sovrapposti
jitter_strength = 0.05
y_values_1d = np.random.uniform(-jitter_strength, jitter_strength, size=len(df_stati))


# Per raggruppare i conflitti sulla stessa linea y nel grafico 1D
y_map = {}
current_y = 0
y_increment = 0.1 # Spaziatura verticale per gruppi di conflitti

processed_sa_values = set()

for index, row in df_stati.sort_values(by='stato_armonico').iterrows():
    sa_val = round(row['stato_armonico'], 3) # Arrotonda per raggruppare valori vicini
    # Se è un valore nuovo o parte di un gruppo non ancora "colorato" y
    if sa_val not in y_map:
        # Controlla se ci sono altri punti con lo stesso SA (o molto vicino)
        # che non sono ancora stati processati per l'asse y
        is_conflict_group_starter = df_stati[
            np.isclose(df_stati['stato_armonico'], sa_val, atol=0.001) &
            ~df_stati['stato_armonico'].round(3).isin(y_map.keys())
        ].shape[0] > 1

        is_conflict_point = "Conflitto" in row["nome"]

        if is_conflict_point or is_conflict_group_starter:
            # Se è un nuovo gruppo di conflitti, assegna una nuova y
            # altrimenti, usa la y del gruppo esistente se esiste
            
            # Troviamo tutti i punti che fanno parte di questo gruppo di SA
            group_members_sa = df_stati[np.isclose(df_stati['stato_armonico'], row['stato_armonico'], atol=0.005)]['stato_armonico'].round(3)
            
            # Verifichiamo se qualche membro del gruppo ha già una y assegnata
            assigned_y = None
            for member_sa in group_members_sa:
                if member_sa in y_map:
                    assigned_y = y_map[member_sa]
                    break
            
            if assigned_y is not None:
                y_pos = assigned_y
            else: # Nuovo gruppo, assegna nuova y e incrementa per il prossimo
                y_pos = current_y
                current_y += y_increment
            
            # Assegna questa y a tutti i membri del gruppo
            for member_sa_val in group_members_sa:
                 y_map[member_sa_val] = y_pos # Usiamo il valore arrotondato come chiave
            
            # Assegna la y al punto corrente usando il suo valore esatto (o arrotondato)
            y_values_1d[index] = y_map[sa_val]

        else: # Punto non in conflitto o singolo
            y_map[sa_val] = 0 # Metti i non-conflitti sulla linea y=0
            y_values_1d[index] = 0 # Assegna y=0
    else: # Già mappato, usa la y esistente
         y_values_1d[index] = y_map[sa_val]


# Riordina y_values_1d per corrispondere all'ordine originale di df_stati se necessario
# Ma siccome lo stiamo usando direttamente con df_stati, l'ordine dovrebbe essere corretto
# Se si usa df_stati.iterrows() per popolare y_values_1d con l'indice corretto, va bene.
# Per sicurezza, ricreiamo y_values_1d mappando gli indici:
y_values_1d_ordered = np.zeros(len(df_stati))
unique_sa_values_sorted = sorted(df_stati['stato_armonico'].round(3).unique())

y_level_map = {} # Mappa da SA arrotondato a y_level
current_y_level = 0

for sa_val_rounded in unique_sa_values_sorted:
    # Trova tutti gli stati che mappano a questo SA arrotondato
    matching_indices = df_stati[np.isclose(df_stati['stato_armonico'], sa_val_rounded, atol=0.005)].index
    
    # Se ci sono più stati (conflitto) o uno stato esplicitamente marcato come conflitto
    is_conflict_group = len(matching_indices) > 1 or \
                        any("Conflitto" in df_stati.loc[i, "nome"] for i in matching_indices)

    if is_conflict_group:
        # Se non è già stato assegnato un livello y a questo gruppo di SA
        if sa_val_rounded not in y_level_map:
            y_level_map[sa_val_rounded] = current_y_level * y_increment
            # Solo incrementa current_y_level se questo è effettivamente un gruppo di conflitto
            # e non un singolo punto che è stato solo processato.
            # Se ci sono più punti o se anche un solo punto è etichettato come conflitto
            if len(matching_indices) > 1 or any("Conflitto" in df_stati.loc[i, "nome"] for i in matching_indices):
                 current_y_level += 0.5 # Riduciamo l'incremento per compattare


    # Assegna il livello y (0 se non è un gruppo di conflitto gestito sopra)
    for idx in matching_indices:
        y_values_1d_ordered[idx] = y_level_map.get(sa_val_rounded, 0)


fig.add_trace(go.Scatter(
    x=df_stati['stato_armonico'],
    y=y_values_1d_ordered, # y_values_1d, # Usiamo valori y per separare i conflitti
    mode='markers+text',
    marker=dict(
        size=10,
        color=df_stati['stato_armonico'],
        colorscale='Viridis',
        showscale=False # La colorbar è già mostrata per il 3D
    ),
    text=df_stati['nome'].apply(lambda n: n.split(" (")[0]), # Testo più breve per la scala 1D
    textposition="top right",
    textfont=dict(size=9),
    hoverinfo='text',
    hovertext=[
        f"<b>{row['nome']}</b><br><b>SA: {row['stato_armonico']:.3f}</b><br>(D:{row['densita']:.2f}, S:{row['spread']:.2f}, C:{row['centroide']:.2f})"
        for index, row in df_stati.iterrows()
    ],
    name="Stati Mappati su 1D"
), row=2, col=1)

# Layout per la parte 1D
fig.update_xaxes(title_text="Valore Stato Armonico (SA)", range=[-0.05, 1.05], row=2, col=1)
fig.update_yaxes(
    showticklabels=False, # Nasconde i tick dell'asse y
    showgrid=False,       # Nasconde la griglia dell'asse y
    zeroline=True,        # Mostra la linea dello zero
    zerolinewidth=1,
    zerolinecolor='grey',
    range=[-0.1, max(y_values_1d_ordered.max()*1.5, 0.2)], # Adatta l'intervallo y
    row=2, col=1
)

# Titolo Generale e altri dettagli
fig.update_layout(
    height=900, # Altezza totale della figura
    title_text="Visualizzazione Mappatura Dimensionale per Stati Armonici",
    title_x=0.5,
    legend_orientation="h",
    legend_yanchor="bottom",
    legend_y=1.1, # Posiziona legenda sopra
    legend_xanchor="center",
    legend_x=0.5
)

# Descrizione testuale
desc_testo = """
<b>Come leggere il grafico:</b><br>
- <b>Grafico Superiore (3D)</b>: Mostra lo spazio dei parametri Densità (D), Spread (S), e Centroide (C).<br>
  Ogni punto rappresenta una configurazione armonica. Il colore del punto indica il valore di 'stato_armonico' risultante (vedi legenda colori).<br>
  I punti più grandi etichettati sono gli 'Stati Definiti' di interesse.<br>
  La formula usata è: <code>stato_armonico = 0.5 * Centroide + 0.3 * Densità + 0.2 * Spread</code>.<br>
- <b>Grafico Inferiore (1D)</b>: Mostra la "proiezione" dei punti 3D sulla singola dimensione 'stato_armonico' (da 0 a 1).<br>
  Qui puoi vedere come diverse configurazioni 3D (punti colorati) si mappano sulla scala 1D.<br>
  <b>Conflitti</b>: Se più punti nello spazio 3D hanno lo stesso (o molto simile) valore di 'stato_armonico',<br>
  appariranno sovrapposti o molto vicini su questa linea. Sono stati leggermente sfalsati verticalmente per una migliore leggibilità.
"""

# Aggiungere la descrizione come annotazione (richiede un po' di tuning per la posizione)
# In alternativa, puoi stamparla separatamente o includerla nell'HTML se esporti la figura.
# Per ora, la stampiamo e l'utente può aggiungerla al contesto.
print(desc_testo.replace("<br>", "\n").replace("<b>","").replace("</b>","").replace("<code>","").replace("</code>",""))


fig.show()