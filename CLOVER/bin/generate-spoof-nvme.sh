#!/usr/bin/env sh

cd $(dirname $0)
python generate-spoof-nvme.py > ../ACPI/patched/SSDT-NVMe-Pcc.aml
ACPICA/iasl ../ACPI/patched/SSDT-NVMe-Pcc.aml
