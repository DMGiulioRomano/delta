import ast
from typing import List, Dict, Set

class LogicFlowVisitor(ast.NodeVisitor):
    def __init__(self):
        self.flow = ["flowchart TD"]
        self.node_count = 0
        
    def get_node_id(self) -> str:
        self.node_count += 1
        return f"N{self.node_count}"

    def analyze_main_flow(self, tree):
        """Analizza il flusso logico principale del programma"""
        # Trova la funzione main o il flusso principale
        main_flow = []
        main_flow.append(("START", "Inizializzazione"))
        
        # Analizza la logica di composizione
        main_flow.extend([
            ("INIT", "Inizializza stato musicale"),
            ("VALIDATE", "Valida stato iniziale"),
            ("LOOP_START", "Tempo < Durata totale?"),
            ("ANALYZE", "Analizza risonanze"),
            ("PERTURB", "Applica perturbazione"),
            ("VALIDATE_NEW", "Valida nuovo stato"),
            ("UPDATE", "Aggiorna stato e storia"),
            ("GENERATE", "Genera file YAML"),
            ("END", "Fine")
        ])

        # Genera il diagramma
        last_id = None
        node_ids = {}
        
        for step, desc in main_flow:
            node_id = self.get_node_id()
            node_ids[step] = node_id
            
            if step in ["VALIDATE", "LOOP_START", "VALIDATE_NEW"]:
                self.flow.append(f'    {node_id}{{{desc}}}')
            elif step in ["START", "END"]:
                self.flow.append(f'    {node_id}(({desc}))')
            else:
                self.flow.append(f'    {node_id}["{desc}"]')
            
            if last_id:
                self.flow.append(f"    {last_id} --> {node_id}")
            last_id = node_id

        # Aggiungi le connessioni speciali
        loop_id = node_ids["LOOP_START"]
        analyze_id = node_ids["ANALYZE"]
        generate_id = node_ids["GENERATE"]
        validate_id = node_ids["VALIDATE_NEW"]
        update_id = node_ids["UPDATE"]
        
        # Ciclo principale
        self.flow.append(f"    {loop_id} -->|Sì| {analyze_id}")
        self.flow.append(f"    {loop_id} -->|No| {generate_id}")
        
        # Ciclo di validazione
        self.flow.append(f"    {validate_id} -->|No| {loop_id}")
        self.flow.append(f"    {update_id} --> {loop_id}")

def generate_logic_flow(file_path: str) -> str:
    """Genera un diagramma di flusso logico da un file Python."""
    with open(file_path, 'r') as file:
        content = file.read()
    
    tree = ast.parse(content)
    visitor = LogicFlowVisitor()
    visitor.analyze_main_flow(tree)
    
    return "\n".join(visitor.flow)

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python flow_generator.py <python_file>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    diagram = generate_logic_flow(file_path)
    
    with open("flow_diagram.md", "w") as f:
        f.write("```mermaid\n")
        # Scrive il contenuto del diagramma
        f.write(diagram)
        # Scrive il delimitatore di chiusura
        f.write("\n```")
    
    print("Diagramma di flusso logico generato in flow_diagram.mmd")