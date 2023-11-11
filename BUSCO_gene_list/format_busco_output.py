import re
import csv

from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
import warnings
warnings.simplefilter("ignore")

# Parse command line arguments
parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
parser.add_argument("-f", "--file", type=str, help="short_summary.txt filename with BUSCO gene results")
parser.add_argument("-n", "--name", type=str, help="name of the organism that BUSCO was run on")
parser.add_argument("-d", "--database", type=str, help="name of the BUSCO gene database used")
args = vars(parser.parse_args())

# Set up parameters
input_file_path = args["file"]
db_name = args["database"]
plant_name = args["name"]

# Open the input file and read its content
with open(input_file_path, 'r') as file:
    content = file.readlines()

ninth_line = content[8].strip()
print(ninth_line)

# Extract percentages using regular expressions
percentages = re.findall(r'(\d+\.\d+)%', ninth_line)
print(percentages)

# Convert the percentages to the desired format
formatted_percentages = [f'{float(p):.1f}%' for p in percentages]
print(formatted_percentages)

output_filename = plant_name + "_" + db_name + "_completion_percentages.csv"
with open(output_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    csv_writer.writerow(formatted_percentages)