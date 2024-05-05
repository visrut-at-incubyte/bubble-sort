import sys
from tabulate import tabulate

from typing import List, Union

def calculate_gap(address1: int, address2: int):
    bytes_gap = address2 - address1
    if bytes_gap >= 1024:
        kb_gap = bytes_gap / 1024
        return bytes_gap, f"{kb_gap:.2f}K"
    else:
        return bytes_gap, f"{bytes_gap}B"

prev_address: int | None = None
prev_section_name = None
table_data: List[List[Union[str | None, int]]] = []

for line in sys.stdin:
    parts = line.strip().split()
    address = int(parts[0], 16)
    section_name = parts[-1]
    
    if prev_address is not None:
        gap_bytes, gap_str = calculate_gap(prev_address, address)
        table_data.append([prev_section_name, f"{prev_address:016X}", section_name, f"{address:016X}", gap_str])
    
    prev_address = address
    prev_section_name = section_name

# Print the last section's address
if prev_address is not None:
    table_data.append([prev_section_name, f"{prev_address:016X}", "", "", ""])

headers = ["Previous Section", "Previous Address", "Next Section", "Next Address", "Gap"]
print(tabulate(table_data, headers=headers, tablefmt="grid"))

