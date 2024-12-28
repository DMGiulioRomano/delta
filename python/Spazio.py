import matplotlib.pyplot as plt
import numpy as np
from PythagoreanSystem import PythagoreanSystem
import plotly.graph_objects as go
import pdb

class Spazio:
    def __init__(self, dizionario):
        sistema_str = dizionario['frequenze'][0]
        sistema = eval(sistema_str)
        self.sistema = sistema(dizionario['frequenze'][1])
        self.durate = dizionario.get("durate", [])
        self.ampiezze = dizionario.get("ampiezze", [])
        self.frequenze = self.creaDimensioneFrequenze()

    def creaDimensioneFrequenze(self):
        return self.sistema.frequencies

    def genera_e_plotta_funzioni(self):
        """
        Genera e plotta le funzioni sin(x * i / 2) per i in range(1, 11).
        """
        x = np.linspace(0, 2 * np.pi, 96000)  # Genera un intervallo di valori x da 0 a 2π
        plt.figure(figsize=(10, 6))

        for i in range(1, 11):
            y = np.sin(x * i / 2)  # Calcola la funzione
            plt.plot(x, y, label=f'sin(x * {i} / 2)')  # Plotta la funzione

        plt.title("Grafici delle funzioni sin(x * i / 2)")
        plt.xlabel("x")
        plt.ylabel("sin(x * i / 2)")
        plt.legend()
        plt.grid(True)
        plt.show()


    def genera_e_plotta_con_slider_esponente_globale(self):
        """
        Genera e plotta interattivamente n funzioni sin(x * i / 2)^n con i in range(1, n+1),
        e uno slider che modifica l'esponente n per tutte le funzioni.
        """
        x = np.linspace(0, 2 * np.pi, 5000)  # Intervallo x da 0 a 2π
        num_funzioni = 10  # Numero di funzioni
        colori = [f"hsl({hue}, 70%, 50%)" for hue in np.linspace(0, 360, num_funzioni)]  # Colori per le funzioni

        # Base delle funzioni
        y_base = [np.sin(x * i / 2) for i in range(1, num_funzioni + 1)]

        # Crea il grafico iniziale
        fig = go.Figure(
            data=[
                go.Scatter(
                    x=x,
                    y=y_base[i]**1,  # Esponente iniziale = 1
                    mode='lines',
                    line=dict(width=2, color=colori[i]),
                    name=f'sin({(i+1)/2}x)' # Equazione per la funzione con esponente 1
                )
                for i in range(num_funzioni)
            ],
            layout=go.Layout(
                title="Grafici di sin(x * i / 2)^n con slider globale per l'esponente",
                xaxis_title="x (radianti)",
                yaxis_title="sin(x * i / 2)^n",
                xaxis=dict(
                    tickmode='array',
                    tickvals=np.linspace(0, 2 * np.pi, 5),
                    ticktext=[r"0", r"π/2", r"π", r"3π/2", r"2π"],
                    showgrid=True,  # Mostra la griglia
                    zeroline=True,  # Mostra la linea dello zero
                    linecolor='black',  # Colore dell'asse x
                    linewidth=2,  # Spessore dell'asse x
                    mirror=True  # Rende visibile anche l'asse x nella parte inferiore
                ),
                template="plotly_white",
            )
        )

        # Aggiungi i frame per ogni valore di esponente n
        frames = []
        valori_n = np.arange(1, 80, 1)  # Esponenti da 0.5 a 5.0 con passo 0.5
        for n in valori_n:
            frames.append(go.Frame(
                data=[
                    go.Scatter(
                        x=x,
                        y=y_base[i]**n,  # Applica l'esponente a tutte le funzioni
                        mode='lines',
                        line=dict(width=2, color=colori[i]),
                        name=f'sin({(i+1)/2}x)'
                    )
                    for i in range(num_funzioni)
                ],
                name=f'{n:.1f}'  # Nome del frame
            ))

        fig.frames = frames

        # Slider per modificare l'esponente n
        sliders = [{
            "steps": [
                {
                    "args": [[f'{n:.1f}'], {"frame": {"duration": 0, "redraw": True}, "mode": "immediate", "transition": {"duration": 0}}],
                    "label": f"n = {n:.1f}",
                    "method": "animate"
                }
                for n in valori_n
            ],
            "active": 0,
            "currentvalue": {"font": {"size": 20}, "prefix": "Esponente n: ", "visible": True, "xanchor": "center"},
            "pad": {"b": 10, "t": 50},
            "x": 0.1,
            "len": 0.9
        }]

        fig.update_layout(sliders=sliders)
        fig.show()

    # Funzione della sinusoide smorzata
    def sinusoide_smorzata(self,t, A, omega, phi, gamma):
        return A * np.sin(omega * t + phi) * np.exp(-gamma * t)

    def ampiezzaSpazio(self,t,amp,gamma=-.65):
        return amp * np.sin(.5 * t + 0) * np.exp(gamma * t)


    # Funzione per generare il grafico interattivo
    def plot_sinusoide_smorzata(self):
        # Impostazioni di base
        A = .5  # Ampiezza
        omega = 3  # Frequenza angolare
        phi = 0  # Fase iniziale
        t = np.linspace(0, 2 * np.pi, 5000)  # Intervallo tra 0 e 2pi per l'asse x
        # Inizializza la figura
        fig = go.Figure()

        # Crea la traccia per la sinusoide smorzata
        fig.add_trace(go.Scatter(
            x=t,
            y=self.sinusoide_smorzata(t, A, omega, phi, .65),  # Imposta un valore iniziale di smorzamento
            mode='lines',
            name="Sinusoide smorzata"
        ))

        # Aggiungi gli slider alla configurazione del grafico
        fig.update_layout(
            title="Sinusoide Smorzata con Coefficiente di Smorzamento Variabile",
            xaxis_title="Tempo (t)",
            yaxis_title="y(t)",
            xaxis=dict(
                tickmode='array',
                tickvals=[0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi],  # Etichette personalizzate per x
                ticktext=[r"0", r"$\pi/2$", r"$\pi$", r"$3\pi/2$", r"$2\pi$"],  # Etichette in forma di frazioni di pi
                showgrid=True,  # Mostra la griglia
                zeroline=True,  # Mostra la linea dello zero
                linecolor='black',  # Colore dell'asse x
                linewidth=2,  # Spessore dell'asse x
                mirror=True  # Rende visibile anche l'asse x nella parte inferiore
            ),
            yaxis=dict(
                showgrid=True,  # Mostra la griglia
                zeroline=True,  # Mostra la linea dello zero
                linecolor='black',  # Colore dell'asse y
                linewidth=2,  # Spessore dell'asse y
                mirror=True  # Rende visibile anche l'asse y nella parte laterale
            ),
            template="plotly_white",
        )

        fig.show()

    def genera_e_plotta_polare_sine(self):
        """
        Genera un grafico polare delle funzioni sin(x * i / 2)^n 
        per i in range(1, 11), con uno slider interattivo per variare l'esponente n.
        """
        theta = np.linspace(0, 2 * np.pi, 500)  # Angolo theta per il grafico polare
        num_funzioni = 10  # Numero di funzioni sinusoidali
        colori = [f"hsl({hue}, 70%, 50%)" for hue in np.linspace(0, 360, num_funzioni)]  # Colori per le tracce

        # Base delle funzioni sinusoidali
        r_base = [np.abs(np.sin(theta * i / 2)) for i in range(1, num_funzioni + 1)]

        # Figura iniziale
        fig = go.Figure(
            data=[
                go.Scatterpolar(
                    r=r_base[i]**1,  # Esponente iniziale = 1
                    theta=np.degrees(theta),  # Converti da radianti a gradi
                    mode='lines',
                    line=dict(width=2, color=colori[i]),
                    name=f'sin({(i+1)/2}θ)'
                )
                for i in range(num_funzioni)
            ],
            layout=go.Layout(
                title="Grafico Polare delle Funzioni sin(θ * i / 2)^n",
                polar=dict(
                    angularaxis=dict(
                        tickvals=[0, 90, 180, 270],  # Etichette angolari
                        ticktext=["0°", "90°", "180°", "270°"],
                        rotation=90,  # Ruota il sistema polare
                        direction="counterclockwise"  # Angoli crescono in senso antiorario
                    ),
                    radialaxis=dict(
                        visible=True,
                        showline=True,  # Mostra linea radiale
                        linewidth=2  # Spessore linea
                    )
                ),
                template="plotly_white"
            )
        )

        # Aggiungi i frame per l'animazione
        frames = []
        valori_n = np.arange(1, 5, 0.5)  # Esponenti da 1 a 5 con passo 0.5
        for n in valori_n:
            frames.append(go.Frame(
                data=[
                    go.Scatterpolar(
                        r=r_base[i]**n,  # Applica l'esponente
                        theta=np.degrees(theta),  # Angoli in gradi
                        mode='lines',
                        line=dict(width=2, color=colori[i]),
                        name=f'sin({(i+1)/2}θ)'
                    )
                    for i in range(num_funzioni)
                ],
                name=f'n={n:.1f}'
            ))

        fig.frames = frames

        # Slider per animare l'esponente
        sliders = [{
            "steps": [
                {
                    "args": [[f'n={n:.1f}'], {"frame": {"duration": 500, "redraw": True}, "mode": "immediate"}],
                    "label": f"n = {n:.1f}",
                    "method": "animate"
                }
                for n in valori_n
            ],
            "active": 0,
            "currentvalue": {"font": {"size": 20}, "prefix": "Esponente n: ", "visible": True, "xanchor": "center"},
            "pad": {"b": 10, "t": 50},
            "x": 0.1,
            "len": 0.9
        }]

        fig.update_layout(sliders=sliders)
        fig.show()
        
    def genera_e_plotta_polare_cosine(self):
        """
        Genera un grafico polare delle funzioni sin(x * i / 2)^n 
        per i in range(1, 11), con uno slider interattivo per variare l'esponente n.
        """
        theta = np.linspace(0, 2 * np.pi, 500)  # Angolo theta per il grafico polare
        num_funzioni = 10  # Numero di funzioni sinusoidali
        colori = [f"hsl({hue}, 70%, 50%)" for hue in np.linspace(0, 360, num_funzioni)]  # Colori per le tracce

        # Base delle funzioni sinusoidali
        r_base = [np.abs(np.cos(theta * i / 2)) for i in range(1, num_funzioni + 1)]

        # Figura iniziale
        fig = go.Figure(
            data=[
                go.Scatterpolar(
                    r=r_base[i]**1,  # Esponente iniziale = 1
                    theta=np.degrees(theta),  # Converti da radianti a gradi
                    mode='lines',
                    line=dict(width=2, color=colori[i]),
                    name=f'cos({(i+1)/2}θ)'
                )
                for i in range(num_funzioni)
            ],
            layout=go.Layout(
                title="Grafico Polare delle Funzioni cos(θ * i / 2)^n",
                polar=dict(
                    angularaxis=dict(
                        tickvals=[0, 90, 180, 270],  # Etichette angolari
                        ticktext=["0°", "90°", "180°", "270°"],
                        rotation=90,  # Ruota il sistema polare
                        direction="counterclockwise"  # Angoli crescono in senso antiorario
                    ),
                    radialaxis=dict(
                        visible=True,
                        showline=True,  # Mostra linea radiale
                        linewidth=2  # Spessore linea
                    )
                ),
                template="plotly_white"
            )
        )

        # Aggiungi i frame per l'animazione
        frames = []
        valori_n = np.arange(1, 5, 0.5)  # Esponenti da 1 a 5 con passo 0.5
        for n in valori_n:
            frames.append(go.Frame(
                data=[
                    go.Scatterpolar(
                        r=r_base[i]**n,  # Applica l'esponente
                        theta=np.degrees(theta),  # Angoli in gradi
                        mode='lines',
                        line=dict(width=2, color=colori[i]),
                        name=f'cos({(i+1)/2}θ)'
                    )
                    for i in range(num_funzioni)
                ],
                name=f'n={n:.1f}'
            ))

        fig.frames = frames

        # Slider per animare l'esponente
        sliders = [{
            "steps": [
                {
                    "args": [[f'n={n:.1f}'], {"frame": {"duration": 500, "redraw": True}, "mode": "immediate"}],
                    "label": f"n = {n:.1f}",
                    "method": "animate"
                }
                for n in valori_n
            ],
            "active": 0,
            "currentvalue": {"font": {"size": 20}, "prefix": "Esponente n: ", "visible": True, "xanchor": "center"},
            "pad": {"b": 10, "t": 50},
            "x": 0.1,
            "len": 0.9
        }]

        fig.update_layout(sliders=sliders)
        fig.show()

    def __str__(self):
        """
        Rappresentazione testuale dell'oggetto Spazio.
        """
        return (f"Spazio(\n"
                f"  frequenze={self.frequenze},\n"
                f"  durate={self.durate},\n"
                f"  ampiezze={self.ampiezze}\n"
                f" {str(self.sistema)}"
                f")")
