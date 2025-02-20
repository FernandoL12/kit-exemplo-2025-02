# Formato geral de um Makefile

# alvo: pre-requisito1 pre-requisito2 ...
#
# comandos que usam os pre requisitos para gerar o alvo
#

all: paper/paper.pdf resultados/numero_de_dados.txt
		#Nenhum comando
		
clean:
	rm -r -f -v resultados dados figuras paper/paper.pdf
		# rm apaga; -r apaga pasta; -f força a apagar; -v explica o que está sendo apagado
		

#Comando para fazer PDF no tectonic LaTeX		
paper/paper.pdf: paper/paper.tex figuras/variacao_de_temperatura.png
	tectonic -X compile paper/paper.tex

	
resultados/variacao_de_temperatura.csv: code/variacao_temperatura.py dados/temperature-data.zip code/variacao_temperatura_todos.sh
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_de_temperatura.csv
	# cat code/variacao_temperatura_todos.csv

	
resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt
	
	
dados/temperature-data.zip: code/baixa_dados.py
	mkdir -p resultados
	python code/baixa_dados.py dados
	
	
figuras/variacao_de_temperatura.png: code/plota_dados.py resultados/variacao_de_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py resultados/variacao_de_temperatura.csv figuras/variacao_de_temperatura.png
	
	