# Calcula a variação de temperatura para todos os arquivos

#echo é o print do bash
echo "variacao_C_por_ano,pais"

echo ""

for arquivos in dados/temperatura/a*.csv
do 
	python code/variacao_temperatura.py $arquivos
done