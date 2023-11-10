import csv

mydict = {}
mydict['101241at33090'] = ('https://v10.orthodb.org/?query=101241at33090', 'actin-related protein 6')
mydict['101701at33090'] = ('https://v10.orthodb.org/?query=101701at33090', 'UTP--glucose-1-phosphate uridylyltransferase 3, chloroplastic')

sorted_genes = sorted(mydict.items(), key=lambda x: int(x[0].split("at")[0]))

# print(sorted_genes)
output_filename = 'testoutput.csv'
with open(output_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    for tmp_url, gene_name in sorted_genes:
        csv_writer.writerow([gene_name[0], gene_name[1]])