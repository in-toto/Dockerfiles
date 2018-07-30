#!/usr/bin/python

from in_toto.models.layout import Layout, Step
from in_toto.models.metadata import Metablock
from in_toto.util import generate_and_write_rsa_keypair, import_rsa_key_from_file

# generate root key (project owner key)
generate_and_write_rsa_keypair("root_key")
root_key = import_rsa_key_from_file("root_key")

# Generate two functionary keys
generate_and_write_rsa_keypair("build_key")
generate_and_write_rsa_keypair("analyze_key")
build_key = import_rsa_key_from_file("build_key.pub")
analyze_key = import_rsa_key_from_file("analyze_key.pub")

# create a layout
layout = Layout()

# create the bulid step and add restrictions
build = Step(name='build')
build.expected_materials.append(["ALLOW", "src/*"])
build.expected_products.append(["CREATE", "foo"])
build.expected_command = ['gcc', '-o foo', 'src/*']
build.pubkeys.append(build_key['keyid'])

# create the analyze step and add restrictions
analyze = Step(name='analyze')
analyze.expected_materials.append(
    ['MATCH', 'foo', 'WITH', 'PRODUCTS', 'FROM', 'build'])
analyze.expected_command = ['valgrind', './foo']
analyze.pubkeys.append(analyze_key['keyid'])

# add the steps to the layout and register their keys
layout.steps.append(build)
layout.steps.append(analyze)
layout.add_functionary_key(build_key)
layout.add_functionary_key(analyze_key)

# add it to a signable payload and dump it.
metablock = Metablock(signed=layout)
metablock.sign(root_key)
metablock.dump("root.layout")
