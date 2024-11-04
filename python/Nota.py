class Nota:
    def __init__(self, at, dur):
        self.at = at 
        self.dur = dur  # Duration of the note

    def to_csound(self):
        return f"i1 {self.at} {self.dur}\n"
