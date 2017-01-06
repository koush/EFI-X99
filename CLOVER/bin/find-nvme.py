import plistlib
import subprocess
import re

def find_entries_matching_name(ioreg_plist, name, depth=0):
    if not 'IORegistryEntryName' in ioreg_plist:
        return

    my_name = ioreg_plist['IORegistryEntryName']
    if name == my_name:
        yield my_name
        return

    if 'IORegistryEntryChildren' not in ioreg_plist:
        return

    for child_plist in ioreg_plist['IORegistryEntryChildren']:
        for found in find_entries_matching_name(child_plist, name, depth+1):
            child_path = my_name + '.' + found
            yield child_path

to_find = 'IONVMeController'
ioreg_string = subprocess.check_output(['ioreg', '-a'])
ioreg_plist = plistlib.readPlistFromString(ioreg_string)

concatenated_templates = ''
for found in find_entries_matching_name(ioreg_plist, to_find):
    devpath = re.sub(r'.*?AppleACPIPlatformExpert', '_SB', found).replace('AppleACPIPCI.', '').replace('IOPP.', '').replace('.' + to_find, '')

    template = """
    External(%s, DeviceObj)
    Method(%s._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "class-code", Buffer() { 0xff, 0x08, 0x01, 0x00 },
            "built-in", Buffer() { 0 },
        })
    }
""" % (devpath, devpath)
    concatenated_templates += template

dsl = """
DefinitionBlock("", "SSDT", 2, "hack", "NVMe-Pcc", 0)
{
%s
}
""" % concatenated_templates

print dsl