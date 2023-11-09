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


with open(filename, "r", encoding="utf8") as f:
    tsv_reader = csv.DictReader(f, delimiter="\t")
    for newline in tsv_reader:
        print(newline)

