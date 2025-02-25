.PHONY = clean
CSD ?= main
CS = csound
clean:
	rm -rf *.wav *.aif *.log *.sco *.txt *.table

cs:
	$(CS) $(CSD).csd -W -+id_scopyright=1 -+id_title=delta -+id_software=csound -+id_artist=GiulioRomanoDeMattia -d --logfile=FILE.log