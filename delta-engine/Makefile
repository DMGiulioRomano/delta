.PHONY = clean
CSD ?= prova
CS = csound
clean:
	rm -rf *.wav *.aif *.log *.sco

cs:
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia --logfile=FILE.log