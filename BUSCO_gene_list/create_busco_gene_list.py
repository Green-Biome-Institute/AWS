import csv
from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
import warnings
warnings.simplefilter("ignore")
 
# Parse command line arguments
parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
parser.add_argument("-f", "--file", type=str, help="tsv filename with BUSCO gene results")
parser.add_argument("-d", "--database", type=str, help="name of the BUSCO gene database used")
parser.add_argument("-n", "--name", type=str, help="name of the organism that BUSCO was run on")
args = vars(parser.parse_args())
 
# Set up parameters
filename = args["file"]
db_name = args["database"]
plant_name = args["name"]

gene_dict = {}

with open(filename, "r", encoding="utf8") as f:
    tsv_reader = csv.reader(f, delimiter="\t")
    next(tsv_reader, None)
    next(tsv_reader, None)
    next(tsv_reader, None)
    for newline in tsv_reader:
        gene_dict[newline[0]] = newline[1]

sorted_genes = sorted(gene_dict.items(), key=lambda x: int(x[0].split("at")[0]))

# for gene in sorted_genes:
#     print(gene[0], gene_dict[gene[0]], db_name, plant_name)

# Write sorted output to CSV file
output_filename = "gene_list_BUSCO_" + plant_name + "_" + db_name
with open(output_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    for gene, value in sorted_genes:
        csv_writer.writerow([gene, value, db_name, plant_name])
just_completeness_filename = "gene_list_BUSCO_" + plant_name + "_" + db_name + "_ONLYCOMPLETENESS"
with open(just_completeness_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    for gene in sorted_genes:

        csv_writer.writerow([gene[1]])