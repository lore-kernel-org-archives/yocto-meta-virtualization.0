Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C803E00C34; Mon, 17 Jul 2017 13:04:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDBF1E00C34
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4GCY019481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:17 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:03 -0400
Message-ID: <1500321853-984-3-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] openvswitch: backport py3 fixups
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 20:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Mark Asselstine <mark.asselstine@windriver.com>

While attempting to get ovs to be built and run with py3 (completely
free of py2) host contamination was found (builds on hosts without
python-six installed would fail). It was also determined that pyc
files were still being generated with py2 and not py3. This resulted
in more work being done to achieve the desired results. This work was
sent upstream and subsequently merged. Unfortunately this didn't make
v2.7.1 and may not be available until the next major release, so here
we backport these commits and adjust the recipe to get a clean py3
only build.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...n3-compatibility-Convert-print-statements.patch | 1264 ++++++++++++++++++++
 ...2-Python3-compatibility-exception-cleanup.patch |   79 ++
 ...03-Python3-compatibility-execfile-to-exec.patch |   33 +
 ...-Python3-compatibility-iteritems-to-items.patch |  102 ++
 ...ython3-compatibility-fix-integer-problems.patch |   51 +
 ...n3-compatibility-math-error-compatibility.patch |   56 +
 ...0007-Python3-compatibility-unicode-to-str.patch |   51 +
 .../0008-AUTHORS-Add-Jason-Wessel.patch            |   28 +
 recipes-networking/openvswitch/openvswitch.inc     |    1 -
 recipes-networking/openvswitch/openvswitch_git.bb  |   13 +
 10 files changed, 1677 insertions(+), 1 deletion(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch b/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
new file mode 100644
index 000000000000..d6197588d6d0
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
@@ -0,0 +1,1264 @@
+From c5c18f9c5f1b7217d43af43be9736c1762c7ebba Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 1/8] Python3 compatibility: Convert print statements
+
+Commit d34a1cc02536f9a812517a71accec3fbd3c6c98b from
+https://github.com/openvswitch/ovs.git
+
+This patch fixes up all the print statements to work with python3 or
+python2.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ build-aux/check-structs       |   4 +-
+ build-aux/extract-ofp-actions |  68 +++---
+ build-aux/extract-ofp-errors  |   2 +-
+ build-aux/extract-ofp-fields  |   2 +-
+ build-aux/extract-ofp-msgs    |   6 +-
+ ovsdb/ovsdb-doc               |   6 +-
+ ovsdb/ovsdb-idlc.in           | 523 +++++++++++++++++++++---------------------
+ 7 files changed, 306 insertions(+), 305 deletions(-)
+
+diff --git a/build-aux/check-structs b/build-aux/check-structs
+index f79f235..bae511f 100755
+--- a/build-aux/check-structs
++++ b/build-aux/check-structs
+@@ -211,7 +211,7 @@ def checkStructs():
+ 
+     if '--help' in sys.argv:
+         argv0 = os.path.basename(sys.argv[0])
+-        print '''\
++        print('''\
+ %(argv0)s, for checking struct and struct member alignment
+ usage: %(argv0)s -Ipath HEADER [HEADER]...
+ 
+@@ -226,7 +226,7 @@ assertions using OFP_ASSERT.
+ 
+ This program is specialized for reading Open vSwitch's OpenFlow header
+ files.  It will not work on arbitrary header files without extensions.\
+-''' % {"argv0": argv0}
++''' % {"argv0": argv0})
+         sys.exit(0)
+ 
+     global fileName
+diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
+index 0062ab8..874e6b4 100755
+--- a/build-aux/extract-ofp-actions
++++ b/build-aux/extract-ofp-actions
+@@ -67,7 +67,7 @@ def fatal(msg):
+ 
+ def usage():
+     argv0 = os.path.basename(sys.argv[0])
+-    print ('''\
++    print('''\
+ %(argv0)s, for extracting OpenFlow action data
+ usage: %(argv0)s OFP_ACTIONS.C [--prototypes | --definitions]
+ 
+@@ -238,36 +238,36 @@ def extract_ofp_actions(fn, definitions):
+     if n_errors:
+         sys.exit(1)
+ 
+-    print """\
++    print("""\
+ /* Generated automatically; do not modify!     -*- buffer-read-only: t -*- */
+-"""
++""")
+ 
+     if definitions:
+-        print "/* Verify that structs used as actions are reasonable sizes. */"
++        print("/* Verify that structs used as actions are reasonable sizes. */")
+         for s in sorted(arg_structs):
+-            print "BUILD_ASSERT_DECL(sizeof(%s) %% OFP_ACTION_ALIGN == 0);" % s
++            print("BUILD_ASSERT_DECL(sizeof(%s) %% OFP_ACTION_ALIGN == 0);" % s)
+ 
+-        print "\nstatic struct ofpact_raw_instance all_raw_instances[] = {"
++        print("\nstatic struct ofpact_raw_instance all_raw_instances[] = {")
+         for vendor in domain:
+             for type_ in domain[vendor]:
+                 for version in domain[vendor][type_]:
+                     d = domain[vendor][type_][version]
+-                    print "    { { 0x%08x, %2d, 0x%02x }, " % (
+-                        vendor, type_, version)
+-                    print "      %s," % d["enum"]
+-                    print "      HMAP_NODE_NULL_INITIALIZER,"
+-                    print "      HMAP_NODE_NULL_INITIALIZER,"
+-                    print "      %s," % d["min_length"]
+-                    print "      %s," % d["max_length"]
+-                    print "      %s," % d["arg_ofs"]
+-                    print "      %s," % d["arg_len"]
+-                    print "      \"%s\"," % re.sub('_RAW[0-9]*', '', d["enum"], 1)
++                    print("    { { 0x%08x, %2d, 0x%02x }, " % (
++                        vendor, type_, version))
++                    print("      %s," % d["enum"])
++                    print("      HMAP_NODE_NULL_INITIALIZER,")
++                    print("      HMAP_NODE_NULL_INITIALIZER,")
++                    print("      %s," % d["min_length"])
++                    print("      %s," % d["max_length"])
++                    print("      %s," % d["arg_ofs"])
++                    print("      %s," % d["arg_len"])
++                    print("      \"%s\"," % re.sub('_RAW[0-9]*', '', d["enum"], 1))
+                     if d["deprecation"]:
+-                        print "      \"%s\"," % re.sub(r'(["\\])', r'\\\1', d["deprecation"])
++                        print("      \"%s\"," % re.sub(r'(["\\])', r'\\\1', d["deprecation"]))
+                     else:
+-                        print "      NULL,"
+-                    print "    },"
+-        print "};";
++                        print("      NULL,")
++                    print("    },")
++        print("};")
+ 
+     for versions in enums.values():
+         need_ofp_version = False
+@@ -314,11 +314,11 @@ def extract_ofp_actions(fn, definitions):
+             decl += "}"
+         else:
+             decl += ";"
+-        print decl
+-        print
++        print(decl)
++        print("")
+ 
+     if definitions:
+-        print """\
++        print("""\
+ static enum ofperr
+ ofpact_decode(const struct ofp_action_header *a, enum ofp_raw_action_type raw,
+               enum ofp_version version, uint64_t arg,
+@@ -326,14 +326,14 @@ ofpact_decode(const struct ofp_action_header *a, enum ofp_raw_action_type raw,
+               uint64_t *tlv_bitmap, struct ofpbuf *out)
+ {
+     switch (raw) {\
+-"""
++""")
+         for versions in enums.values():
+             enum = versions[0]["enum"]
+-            print "    case %s:" % enum
++            print("    case %s:" % enum)
+             base_argtype = versions[0]["base_argtype"]
+             arg_vl_mff_map = versions[0]["arg_vl_mff_map"]
+             if base_argtype == 'void':
+-                print "        return decode_%s(out);" % enum
++                print("        return decode_%s(out);" % enum)
+             else:
+                 if base_argtype.startswith('struct'):
+                     arg = "ALIGNED_CAST(const %s *, a)" % base_argtype
+@@ -344,16 +344,16 @@ ofpact_decode(const struct ofp_action_header *a, enum ofp_raw_action_type raw,
+                     else:
+                         arg = "arg"
+                 if arg_vl_mff_map:
+-                    print "        return decode_%s(%s, version, vl_mff_map, tlv_bitmap, out);" % (enum, arg)
++                    print("        return decode_%s(%s, version, vl_mff_map, tlv_bitmap, out);" % (enum, arg))
+                 else:
+-                    print "        return decode_%s(%s, version, out);" % (enum, arg)
+-            print
+-        print """\
++                    print("        return decode_%s(%s, version, out);" % (enum, arg))
++            print("")
++        print("""\
+     default:
+         OVS_NOT_REACHED();
+     }
+ }\
+-"""
++""")
+     else:
+         for versions in enums.values():
+             enum = versions[0]["enum"]
+@@ -368,15 +368,15 @@ ofpact_decode(const struct ofp_action_header *a, enum ofp_raw_action_type raw,
+                 if arg_vl_mff_map:
+                     prototype += 'const struct vl_mff_map *, uint64_t *, '
+             prototype += "struct ofpbuf *);"
+-            print prototype
++            print(prototype)
+ 
+-        print """
++        print("""
+ static enum ofperr ofpact_decode(const struct ofp_action_header *,
+                                  enum ofp_raw_action_type raw,
+                                  enum ofp_version version,
+                                  uint64_t arg, const struct vl_mff_map *vl_mff_map,
+                                  uint64_t *tlv_bitmap, struct ofpbuf *out);
+-"""
++""")
+ 
+ if __name__ == '__main__':
+     if '--help' in sys.argv:
+diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
+index 2312b76..336a240 100755
+--- a/build-aux/extract-ofp-errors
++++ b/build-aux/extract-ofp-errors
+@@ -426,7 +426,7 @@ static const struct ofperr_domain %s = {
+                 vendor, type_, code = map[enum]
+                 if code == None:
+                     code = -1
+-                print "        { %#8x, %2d, %3d }, /* %s */" % (vendor, type_, code, enum)
++                print ("        { %#8x, %2d, %3d }, /* %s */" % (vendor, type_, code, enum))
+             else:
+                 print ("        {       -1, -1,  -1 }, /* %s */" % enum)
+         print ("""\
+diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
+index 498b887..425a85f 100755
+--- a/build-aux/extract-ofp-fields
++++ b/build-aux/extract-ofp-fields
+@@ -728,7 +728,7 @@ def make_ovs_fields(meta_flow_h, meta_flow_xml):
+ ovs\-fields \- protocol header fields in OpenFlow and Open vSwitch
+ .
+ .PP
+-''') % version
++''' % version)
+ 
+     recursively_replace(doc, 'oxm_classes', make_oxm_classes_xml(document))
+ 
+diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
+index 1813638..a67e870 100755
+--- a/build-aux/extract-ofp-msgs
++++ b/build-aux/extract-ofp-msgs
+@@ -56,14 +56,14 @@ def fatal(msg):
+ 
+ def usage():
+     argv0 = os.path.basename(sys.argv[0])
+-    print '''\
++    print('''\
+ %(argv0)s, for extracting OpenFlow message types from header files
+ usage: %(argv0)s INPUT OUTPUT
+   where INPUT is the name of the input header file
+     and OUTPUT is the output file name.
+ Despite OUTPUT, the output is written to stdout, and the OUTPUT argument
+ only controls #line directives in the output.\
+-''' % {"argv0": argv0}
++''' % {"argv0": argv0})
+     sys.exit(0)
+ 
+ def make_sizeof(s):
+@@ -378,5 +378,5 @@ if __name__ == '__main__':
+         line_number = 0
+ 
+         for line in extract_ofp_msgs(sys.argv[2]):
+-            print line
++            print(line)
+         
+diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
+index 5cf26ee..b34fb11 100755
+--- a/ovsdb/ovsdb-doc
++++ b/ovsdb/ovsdb-doc
+@@ -258,7 +258,7 @@ represent strong references; thin lines represent weak references.
+     return s
+ 
+ def usage():
+-    print """\
++    print("""\
+ %(argv0)s: ovsdb schema documentation generator
+ Prints documentation for an OVSDB schema as an nroff-formatted manpage.
+ usage: %(argv0)s [OPTIONS] SCHEMA XML
+@@ -269,7 +269,7 @@ The following options are also available:
+   --er-diagram=DIAGRAM.PIC    include E-R diagram from DIAGRAM.PIC
+   --version=VERSION           use VERSION to display on document footer
+   -h, --help                  display this help message\
+-""" % {'argv0': argv0}
++""" % {'argv0': argv0})
+     sys.exit(0)
+ 
+ if __name__ == "__main__":
+@@ -304,7 +304,7 @@ if __name__ == "__main__":
+         for line in s.split("\n"):
+             line = line.strip()
+             if len(line):
+-                print line
++                print(line)
+ 
+     except error.Error, e:
+         sys.stderr.write("%s: %s\n" % (argv0, e.msg))
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 721ab50..1064448 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -1,5 +1,6 @@
+ #! @PYTHON@
+ 
++from __future__ import print_function
+ import getopt
+ import os
+ import re
+@@ -123,7 +124,7 @@ def sorted_columns(table):
+ def printCIDLHeader(schemaFile):
+     schema = parseSchema(schemaFile)
+     prefix = schema.idlPrefix
+-    print '''\
++    print('''\
+ /* Generated automatically -- do not modify!    -*- buffer-read-only: t -*- */
+ 
+ #ifndef %(prefix)sIDL_HEADER
+@@ -135,39 +136,39 @@ def printCIDLHeader(schemaFile):
+ #include "ovsdb-data.h"
+ #include "ovsdb-idl-provider.h"
+ #include "smap.h"
+-#include "uuid.h"''' % {'prefix': prefix.upper()}
++#include "uuid.h"''' % {'prefix': prefix.upper()})
+ 
+     for tableName, table in sorted(schema.tables.iteritems()):
+         structName = "%s%s" % (prefix, tableName.lower())
+ 
+-        print ""
+-        print "/* %s table. */" % tableName
+-        print "struct %s {" % structName
+-        print "\tstruct ovsdb_idl_row header_;"
++        print("")
++        print("/* %s table. */" % tableName)
++        print("struct %s {" % structName)
++        print("\tstruct ovsdb_idl_row header_;")
+         for columnName, column in sorted_columns(table):
+-            print "\n\t/* %s column. */" % columnName
++            print("\n\t/* %s column. */" % columnName)
+             comment, members = cMembers(prefix, tableName,
+                                         columnName, column, False)
+             for member in members:
+-                print "\t%(type)s%(name)s;%(comment)s" % member
+-        print "};"
++                print("\t%(type)s%(name)s;%(comment)s" % member)
++        print("};")
+ 
+         # Column indexes.
+         printEnum("%s_column_id" % structName.lower(), ["%s_COL_%s" % (structName.upper(), columnName.upper())
+                                                         for columnName, column in sorted_columns(table)]
+                   + ["%s_N_COLUMNS" % structName.upper()])
+ 
+-        print
++        print("")
+         for columnName in table.columns:
+-            print "#define %(s)s_col_%(c)s (%(s)s_columns[%(S)s_COL_%(C)s])" % {
++            print("#define %(s)s_col_%(c)s (%(s)s_columns[%(S)s_COL_%(C)s])" % {
+                 's': structName,
+                 'S': structName.upper(),
+                 'c': columnName,
+-                'C': columnName.upper()}
++                'C': columnName.upper()})
+ 
+-        print "\nextern struct ovsdb_idl_column %s_columns[%s_N_COLUMNS];" % (structName, structName.upper())
++        print("\nextern struct ovsdb_idl_column %s_columns[%s_N_COLUMNS];" % (structName, structName.upper()))
+ 
+-        print '''
++        print('''
+ const struct %(s)s *%(s)s_get_for_uuid(const struct ovsdb_idl *, const struct uuid *);
+ const struct %(s)s *%(s)s_first(const struct ovsdb_idl *);
+ const struct %(s)s *%(s)s_next(const struct %(s)s *);
+@@ -205,87 +206,87 @@ void %(s)s_init(struct %(s)s *);
+ void %(s)s_delete(const struct %(s)s *);
+ struct %(s)s *%(s)s_insert(struct ovsdb_idl_txn *);
+ bool %(s)s_is_updated(const struct %(s)s *, enum %(s)s_column_id);
+-''' % {'s': structName, 'S': structName.upper()}
++''' % {'s': structName, 'S': structName.upper()})
+ 
+         for columnName, column in sorted_columns(table):
+-            print 'void %(s)s_verify_%(c)s(const struct %(s)s *);' % {'s': structName, 'c': columnName}
++            print('void %(s)s_verify_%(c)s(const struct %(s)s *);' % {'s': structName, 'c': columnName})
+ 
+-        print
++        print("")
+         for columnName, column in sorted_columns(table):
+             if column.type.value:
+                 valueParam = ', enum ovsdb_atomic_type value_type'
+             else:
+                 valueParam = ''
+-            print 'const struct ovsdb_datum *%(s)s_get_%(c)s(const struct %(s)s *, enum ovsdb_atomic_type key_type%(v)s);' % {
+-                's': structName, 'c': columnName, 'v': valueParam}
++            print('const struct ovsdb_datum *%(s)s_get_%(c)s(const struct %(s)s *, enum ovsdb_atomic_type key_type%(v)s);' % {
++                's': structName, 'c': columnName, 'v': valueParam})
+ 
+-        print
++        print("")
+         for columnName, column in sorted_columns(table):
+-            print 'void %(s)s_set_%(c)s(const struct %(s)s *,' % {'s': structName, 'c': columnName},
++            print('void %(s)s_set_%(c)s(const struct %(s)s *,' % {'s': structName, 'c': columnName}, end=' ')
+             if column.type.is_smap():
+                 args = ['const struct smap *']
+             else:
+                 comment, members = cMembers(prefix, tableName, columnName,
+                                             column, True)
+                 args = ['%(type)s%(name)s' % member for member in members]
+-            print '%s);' % ', '.join(args)
++            print('%s);' % ', '.join(args))
+ 
+-        print
++        print("")
+         for columnName, column in sorted_columns(table):
+             if column.type.is_map():
+-                print 'void %(s)s_update_%(c)s_setkey(const struct %(s)s *, ' % {'s': structName, 'c': columnName},
+-                print '%(coltype)s, %(valtype)s);' % {'coltype':column.type.key.to_const_c_type(prefix), 'valtype':column.type.value.to_const_c_type(prefix)}
+-                print 'void %(s)s_update_%(c)s_delkey(const struct %(s)s *, ' % {'s': structName, 'c': columnName},
+-                print '%(coltype)s);' % {'coltype':column.type.key.to_const_c_type(prefix)}
++                print('void %(s)s_update_%(c)s_setkey(const struct %(s)s *, ' % {'s': structName, 'c': columnName}, end=' ')
++                print('%(coltype)s, %(valtype)s);' % {'coltype':column.type.key.to_const_c_type(prefix), 'valtype':column.type.value.to_const_c_type(prefix)})
++                print('void %(s)s_update_%(c)s_delkey(const struct %(s)s *, ' % {'s': structName, 'c': columnName}, end=' ')
++                print('%(coltype)s);' % {'coltype':column.type.key.to_const_c_type(prefix)})
+             if column.type.is_set():
+-                print 'void %(s)s_update_%(c)s_addvalue(const struct %(s)s *, ' % {'s': structName, 'c': columnName},
+-                print '%(valtype)s);' % {'valtype':column.type.key.to_const_c_type(prefix)}
+-                print 'void %(s)s_update_%(c)s_delvalue(const struct %(s)s *, ' % {'s': structName, 'c': columnName},
+-                print '%(valtype)s);' % {'valtype':column.type.key.to_const_c_type(prefix)}
++                print('void %(s)s_update_%(c)s_addvalue(const struct %(s)s *, ' % {'s': structName, 'c': columnName}, end=' ')
++                print('%(valtype)s);' % {'valtype':column.type.key.to_const_c_type(prefix)})
++                print('void %(s)s_update_%(c)s_delvalue(const struct %(s)s *, ' % {'s': structName, 'c': columnName}, end=' ')
++                print('%(valtype)s);' % {'valtype':column.type.key.to_const_c_type(prefix)})
+ 
+-            print 'void %(s)s_add_clause_%(c)s(struct ovsdb_idl_condition *, enum ovsdb_function function,' % {'s': structName, 'c': columnName},
++            print('void %(s)s_add_clause_%(c)s(struct ovsdb_idl_condition *, enum ovsdb_function function,' % {'s': structName, 'c': columnName}, end=' ')
+             if column.type.is_smap():
+                 args = ['const struct smap *']
+             else:
+                 comment, members = cMembers(prefix, tableName, columnName,
+                                             column, True, refTable=False)
+                 args = ['%(type)s%(name)s' % member for member in members]
+-            print '%s);' % ', '.join(args)
++            print('%s);' % ', '.join(args))
+ 
+-            print 'void %(s)s_set_condition(struct ovsdb_idl *, struct ovsdb_idl_condition *);' % {'s': structName},
++            print('void %(s)s_set_condition(struct ovsdb_idl *, struct ovsdb_idl_condition *);' % {'s': structName})
+ 
+-        print
++        print("")
+ 
+     # Table indexes.
+     printEnum("%stable_id" % prefix.lower(), ["%sTABLE_%s" % (prefix.upper(), tableName.upper()) for tableName in sorted(schema.tables)] + ["%sN_TABLES" % prefix.upper()])
+-    print
++    print("")
+     for tableName in schema.tables:
+-        print "#define %(p)stable_%(t)s (%(p)stable_classes[%(P)sTABLE_%(T)s])" % {
++        print("#define %(p)stable_%(t)s (%(p)stable_classes[%(P)sTABLE_%(T)s])" % {
+             'p': prefix,
+             'P': prefix.upper(),
+             't': tableName.lower(),
+-            'T': tableName.upper()}
+-    print "\nextern struct ovsdb_idl_table_class %stable_classes[%sN_TABLES];" % (prefix, prefix.upper())
++            'T': tableName.upper()})
++    print("\nextern struct ovsdb_idl_table_class %stable_classes[%sN_TABLES];" % (prefix, prefix.upper()))
+ 
+-    print "\nextern struct ovsdb_idl_class %sidl_class;" % prefix
++    print("\nextern struct ovsdb_idl_class %sidl_class;" % prefix)
+ 
+-    print "\nconst char * %sget_db_version(void);" % prefix
+-    print "\n#endif /* %(prefix)sIDL_HEADER */" % {'prefix': prefix.upper()}
++    print("\nconst char * %sget_db_version(void);" % prefix)
++    print("\n#endif /* %(prefix)sIDL_HEADER */" % {'prefix': prefix.upper()})
+ 
+ def printEnum(type, members):
+     if len(members) == 0:
+         return
+ 
+-    print "\nenum %s {" % type
++    print("\nenum %s {" % type)
+     for member in members[:-1]:
+-        print "    %s," % member
+-    print "    %s" % members[-1]
+-    print "};"
++        print("    %s," % member)
++    print("    %s" % members[-1])
++    print("};")
+ 
+ def printCIDLSource(schemaFile):
+     schema = parseSchema(schemaFile)
+     prefix = schema.idlPrefix
+-    print '''\
++    print('''\
+ /* Generated automatically -- do not modify!    -*- buffer-read-only: t -*- */
+ 
+ #include <config.h>
+@@ -296,33 +297,33 @@ def printCIDLSource(schemaFile):
+ #include "ovsdb-error.h"
+ #include "util.h"
+ 
+-''' % schema.idlHeader
++''' % schema.idlHeader)
+ 
+     # Cast functions.
+     for tableName, table in sorted(schema.tables.iteritems()):
+         structName = "%s%s" % (prefix, tableName.lower())
+-        print '''
++        print('''
+ static struct %(s)s *
+ %(s)s_cast(const struct ovsdb_idl_row *row)
+ {
+     return row ? CONTAINER_OF(row, struct %(s)s, header_) : NULL;
+ }\
+-''' % {'s': structName}
++''' % {'s': structName})
+ 
+ 
+     for tableName, table in sorted(schema.tables.iteritems()):
+         structName = "%s%s" % (prefix, tableName.lower())
+-        print ""
+-        print "/* %s table. */" % (tableName)
++        print("")
++        print("/* %s table. */" % (tableName))
+ 
+         # Parse functions.
+         for columnName, column in sorted_columns(table):
+-            print '''
++            print('''
+ static void
+ %(s)s_parse_%(c)s(struct ovsdb_idl_row *row_, const struct ovsdb_datum *datum)
+ {
+     struct %(s)s *row = %(s)s_cast(row_);''' % {'s': structName,
+-                                                'c': columnName}
++                                                'c': columnName})
+             type = column.type
+             if type.value:
+                 keyVar = "row->key_%s" % columnName
+@@ -332,89 +333,89 @@ static void
+                 valueVar = None
+ 
+             if type.is_smap():
+-                print "    smap_init(&row->%s);" % columnName
+-                print "    for (size_t i = 0; i < datum->n; i++) {"
+-                print "        smap_add(&row->%s," % columnName
+-                print "                 datum->keys[i].string,"
+-                print "                 datum->values[i].string);"
+-                print "    }"
++                print("    smap_init(&row->%s);" % columnName)
++                print("    for (size_t i = 0; i < datum->n; i++) {")
++                print("        smap_add(&row->%s," % columnName)
++                print("                 datum->keys[i].string,")
++                print("                 datum->values[i].string);")
++                print("    }")
+             elif (type.n_min == 1 and type.n_max == 1) or type.is_optional_pointer():
+-                print
+-                print "    if (datum->n >= 1) {"
++                print("")
++                print("    if (datum->n >= 1) {")
+                 if not type.key.ref_table:
+-                    print "        %s = datum->keys[0].%s;" % (keyVar, type.key.type.to_string())
++                    print("        %s = datum->keys[0].%s;" % (keyVar, type.key.type.to_string()))
+                 else:
+-                    print "        %s = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->keys[0].uuid));" % (keyVar, prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower())
++                    print("        %s = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->keys[0].uuid));" % (keyVar, prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower()))
+ 
+                 if valueVar:
+                     if not type.value.ref_table:
+-                        print "        %s = datum->values[0].%s;" % (valueVar, type.value.type.to_string())
++                        print("        %s = datum->values[0].%s;" % (valueVar, type.value.type.to_string()))
+                     else:
+-                        print "        %s = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->values[0].uuid));" % (valueVar, prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower())
+-                print "    } else {"
+-                print "        %s" % type.key.initCDefault(keyVar, type.n_min == 0)
++                        print("        %s = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->values[0].uuid));" % (valueVar, prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower()))
++                print("    } else {")
++                print("        %s" % type.key.initCDefault(keyVar, type.n_min == 0))
+                 if valueVar:
+-                    print "        %s" % type.value.initCDefault(valueVar, type.n_min == 0)
+-                print "    }"
++                    print("        %s" % type.value.initCDefault(valueVar, type.n_min == 0))
++                print("    }")
+             else:
+                 if type.n_max != sys.maxint:
+-                    print "    size_t n = MIN(%d, datum->n);" % type.n_max
++                    print("    size_t n = MIN(%d, datum->n);" % type.n_max)
+                     nMax = "n"
+                 else:
+                     nMax = "datum->n"
+-                print "    %s = NULL;" % keyVar
++                print("    %s = NULL;" % keyVar)
+                 if valueVar:
+-                    print "    %s = NULL;" % valueVar
+-                print "    row->n_%s = 0;" % columnName
+-                print "    for (size_t i = 0; i < %s; i++) {" % nMax
++                    print("    %s = NULL;" % valueVar)
++                print("    row->n_%s = 0;" % columnName)
++                print("    for (size_t i = 0; i < %s; i++) {" % nMax)
+                 if type.key.ref_table:
+-                    print """\
++                    print("""\
+         struct %s%s *keyRow = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->keys[i].uuid));
+         if (!keyRow) {
+             continue;
+         }\
+-""" % (prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower())
++""" % (prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower(), prefix, type.key.ref_table.name.lower()))
+                     keySrc = "keyRow"
+                 else:
+                     keySrc = "datum->keys[i].%s" % type.key.type.to_string()
+                 if type.value and type.value.ref_table:
+-                    print """\
++                    print("""\
+         struct %s%s *valueRow = %s%s_cast(ovsdb_idl_get_row_arc(row_, &%stable_%s, &datum->values[i].uuid));
+         if (!valueRow) {
+             continue;
+         }\
+-""" % (prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower())
++""" % (prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower(), prefix, type.value.ref_table.name.lower()))
+                     valueSrc = "valueRow"
+                 elif valueVar:
+                     valueSrc = "datum->values[i].%s" % type.value.type.to_string()
+-                print "        if (!row->n_%s) {" % (columnName)
++                print("        if (!row->n_%s) {" % (columnName))
+ 
+-                print "            %s = xmalloc(%s * sizeof *%s);" % (
+-                    keyVar, nMax, keyVar)
++                print("            %s = xmalloc(%s * sizeof *%s);" % (
++                    keyVar, nMax, keyVar))
+                 if valueVar:
+-                    print "            %s = xmalloc(%s * sizeof *%s);" % (
+-                        valueVar, nMax, valueVar)
+-                print "        }"
+-                print "        %s[row->n_%s] = %s;" % (keyVar, columnName, keySrc)
++                    print("            %s = xmalloc(%s * sizeof *%s);" % (
++                        valueVar, nMax, valueVar))
++                print("        }")
++                print("        %s[row->n_%s] = %s;" % (keyVar, columnName, keySrc))
+                 if valueVar:
+-                    print "        %s[row->n_%s] = %s;" % (valueVar, columnName, valueSrc)
+-                print "        row->n_%s++;" % columnName
+-                print "    }"
+-            print "}"
++                    print("        %s[row->n_%s] = %s;" % (valueVar, columnName, valueSrc))
++                print("        row->n_%s++;" % columnName)
++                print("    }")
++            print("}")
+ 
+         # Unparse functions.
+         for columnName, column in sorted_columns(table):
+             type = column.type
+             if type.is_smap() or (type.n_min != 1 or type.n_max != 1) and not type.is_optional_pointer():
+-                print '''
++                print('''
+ static void
+ %(s)s_unparse_%(c)s(struct ovsdb_idl_row *row_)
+ {
+     struct %(s)s *row = %(s)s_cast(row_);''' % {'s': structName,
+-                                                'c': columnName}
++                                                'c': columnName})
+ 
+                 if type.is_smap():
+-                    print "    smap_destroy(&row->%s);" % columnName
++                    print("    smap_destroy(&row->%s);" % columnName)
+                 else:
+                     if type.value:
+                         keyVar = "row->key_%s" % columnName
+@@ -422,45 +423,45 @@ static void
+                     else:
+                         keyVar = "row->%s" % columnName
+                         valueVar = None
+-                    print "    free(%s);" % keyVar
++                    print("    free(%s);" % keyVar)
+                     if valueVar:
+-                        print "    free(%s);" % valueVar
+-                print '}'
++                        print("    free(%s);" % valueVar)
++                print('}')
+             else:
+-                print '''
++                print('''
+ static void
+ %(s)s_unparse_%(c)s(struct ovsdb_idl_row *row OVS_UNUSED)
+ {
+     /* Nothing to do. */
+-}''' % {'s': structName, 'c': columnName}
++}''' % {'s': structName, 'c': columnName})
+ 
+         # Generic Row Initialization function.
+-        print """
++        print("""
+ static void
+ %(s)s_init__(struct ovsdb_idl_row *row)
+ {
+     %(s)s_init(%(s)s_cast(row));
+-}""" % {'s': structName}
++}""" % {'s': structName})
+ 
+         # Row Initialization function.
+-        print """
++        print("""
+ /* Clears the contents of 'row' in table "%(t)s". */
+ void
+ %(s)s_init(struct %(s)s *row)
+ {
+-    memset(row, 0, sizeof *row); """ % {'s': structName, 't': tableName}
++    memset(row, 0, sizeof *row); """ % {'s': structName, 't': tableName})
+         for columnName, column in sorted_columns(table):
+             if column.type.is_smap():
+-                print "    smap_init(&row->%s);" % columnName
++                print("    smap_init(&row->%s);" % columnName)
+             elif (column.type.n_min == 1 and
+                   column.type.n_max == 1 and
+                   column.type.key.type == ovs.db.types.StringType and
+                   not column.type.value):
+-                print "    row->%s = \"\";" % columnName
+-        print "}"
++                print("    row->%s = \"\";" % columnName)
++        print("}")
+ 
+         # First, next functions.
+-        print '''
++        print('''
+ /* Searches table "%(t)s" in 'idl' for a row with UUID 'uuid'.  Returns
+  * a pointer to the row if there is one, otherwise a null pointer.  */
+ const struct %(s)s *
+@@ -514,9 +515,9 @@ const struct %(s)s
+         'P': prefix.upper(),
+         't': tableName,
+         'tl': tableName.lower(),
+-        'T': tableName.upper()}
++        'T': tableName.upper()})
+ 
+-        print '''
++        print('''
+ 
+ /* Deletes 'row' from table "%(t)s".  'row' may be freed, so it must not be
+  * accessed afterward.
+@@ -550,11 +551,11 @@ bool
+         'P': prefix.upper(),
+         't': tableName,
+         'tl': tableName.lower(),
+-        'T': tableName.upper()}
++        'T': tableName.upper()})
+ 
+         # Verify functions.
+         for columnName, column in sorted_columns(table):
+-            print '''
++            print('''
+ /* Causes the original contents of column "%(c)s" in 'row' to be
+  * verified as a prerequisite to completing the transaction.  That is, if
+  * "%(c)s" in 'row' changed (or if 'row' was deleted) between the
+@@ -585,7 +586,7 @@ void
+ }''' % {'s': structName,
+         'S': structName.upper(),
+         'c': columnName,
+-        'C': columnName.upper()}
++        'C': columnName.upper()})
+ 
+         # Get functions.
+         for columnName, column in sorted_columns(table):
+@@ -597,7 +598,7 @@ void
+                 valueParam = ''
+                 valueType = ''
+                 valueComment = ''
+-            print """
++            print("""
+ /* Returns the "%(c)s" column's value from the "%(t)s" table in 'row'
+  * as a struct ovsdb_datum.  This is useful occasionally: for example,
+  * ovsdb_datum_find_key() is an easier and more efficient way to search
+@@ -625,7 +626,7 @@ const struct ovsdb_datum *
+     return ovsdb_idl_read(&row->header_, &%(s)s_col_%(c)s);
+ }""" % {'t': tableName, 's': structName, 'c': columnName,
+        'kt': column.type.key.toAtomicType(),
+-       'v': valueParam, 'vt': valueType, 'vc': valueComment}
++       'v': valueParam, 'vt': valueType, 'vc': valueComment})
+ 
+         # Set functions.
+         for columnName, column in sorted_columns(table):
+@@ -635,8 +636,8 @@ const struct ovsdb_datum *
+                                         column, True)
+ 
+             if type.is_smap():
+-                print comment
+-                print """void
++                print(comment)
++                print("""void
+ %(s)s_set_%(c)s(const struct %(s)s *row, const struct smap *%(c)s)
+ {
+     struct ovsdb_datum datum;
+@@ -654,7 +655,7 @@ const struct ovsdb_datum *
+        's': structName,
+        'S': structName.upper(),
+        'c': columnName,
+-       'C': columnName.upper()}
++       'C': columnName.upper()})
+                 continue
+ 
+             keyVar = members[0]['name']
+@@ -668,84 +669,84 @@ const struct ovsdb_datum *
+                 if len(members) > 1:
+                     nVar = members[1]['name']
+ 
+-            print comment
+-            print """\
++            print(comment)
++            print("""\
+ void
+ %(s)s_set_%(c)s(const struct %(s)s *row, %(args)s)
+ {
+     struct ovsdb_datum datum;""" % {'s': structName,
+         'c': columnName,
+         'args': ', '.join(['%(type)s%(name)s'
+-                           % m for m in members])}
++                           % m for m in members])})
+             if type.n_min == 1 and type.n_max == 1:
+-                print "    union ovsdb_atom key;"
++                print("    union ovsdb_atom key;")
+                 if type.value:
+-                    print "    union ovsdb_atom value;"
+-                print
+-                print "    datum.n = 1;"
+-                print "    datum.keys = &key;"
+-                print "    " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar)
++                    print("    union ovsdb_atom value;")
++                print("")
++                print("    datum.n = 1;")
++                print("    datum.keys = &key;")
++                print("    " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar))
+                 if type.value:
+-                    print "    datum.values = &value;"
+-                    print "    "+ type.value.assign_c_value_casting_away_const("value.%s" % type.value.type.to_string(), valueVar)
++                    print("    datum.values = &value;")
++                    print("    "+ type.value.assign_c_value_casting_away_const("value.%s" % type.value.type.to_string(), valueVar))
+                 else:
+-                    print "    datum.values = NULL;"
++                    print("    datum.values = NULL;")
+                 txn_write_func = "ovsdb_idl_txn_write_clone"
+             elif type.is_optional_pointer():
+-                print "    union ovsdb_atom key;"
+-                print
+-                print "    if (%s) {" % keyVar
+-                print "        datum.n = 1;"
+-                print "        datum.keys = &key;"
+-                print "        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar)
+-                print "    } else {"
+-                print "        datum.n = 0;"
+-                print "        datum.keys = NULL;"
+-                print "    }"
+-                print "    datum.values = NULL;"
++                print("    union ovsdb_atom key;")
++                print("")
++                print("    if (%s) {" % keyVar)
++                print("        datum.n = 1;")
++                print("        datum.keys = &key;")
++                print("        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar))
++                print("    } else {")
++                print("        datum.n = 0;")
++                print("        datum.keys = NULL;")
++                print("    }")
++                print("    datum.values = NULL;")
+                 txn_write_func = "ovsdb_idl_txn_write_clone"
+             elif type.n_max == 1:
+-                print "    union ovsdb_atom key;"
+-                print
+-                print "    if (%s) {" % nVar
+-                print "        datum.n = 1;"
+-                print "        datum.keys = &key;"
+-                print "        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), "*" + keyVar)
+-                print "    } else {"
+-                print "        datum.n = 0;"
+-                print "        datum.keys = NULL;"
+-                print "    }"
+-                print "    datum.values = NULL;"
++                print("    union ovsdb_atom key;")
++                print("")
++                print("    if (%s) {" % nVar)
++                print("        datum.n = 1;")
++                print("        datum.keys = &key;")
++                print("        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), "*" + keyVar))
++                print("    } else {")
++                print("        datum.n = 0;")
++                print("        datum.keys = NULL;")
++                print("    }")
++                print("    datum.values = NULL;")
+                 txn_write_func = "ovsdb_idl_txn_write_clone"
+             else:
+-                print
+-                print "    datum.n = %s;" % nVar
+-                print "    datum.keys = %s ? xmalloc(%s * sizeof *datum.keys) : NULL;" % (nVar, nVar)
++                print("")
++                print("    datum.n = %s;" % nVar)
++                print("    datum.keys = %s ? xmalloc(%s * sizeof *datum.keys) : NULL;" % (nVar, nVar))
+                 if type.value:
+-                    print "    datum.values = xmalloc(%s * sizeof *datum.values);" % nVar
++                    print("    datum.values = xmalloc(%s * sizeof *datum.values);" % nVar)
+                 else:
+-                    print "    datum.values = NULL;"
+-                print "    for (size_t i = 0; i < %s; i++) {" % nVar
+-                print "        " + type.key.copyCValue("datum.keys[i].%s" % type.key.type.to_string(), "%s[i]" % keyVar)
++                    print("    datum.values = NULL;")
++                print("    for (size_t i = 0; i < %s; i++) {" % nVar)
++                print("        " + type.key.copyCValue("datum.keys[i].%s" % type.key.type.to_string(), "%s[i]" % keyVar))
+                 if type.value:
+-                    print "        " + type.value.copyCValue("datum.values[i].%s" % type.value.type.to_string(), "%s[i]" % valueVar)
+-                print "    }"
++                    print("        " + type.value.copyCValue("datum.values[i].%s" % type.value.type.to_string(), "%s[i]" % valueVar))
++                print("    }")
+                 if type.value:
+                     valueType = type.value.toAtomicType()
+                 else:
+                     valueType = "OVSDB_TYPE_VOID"
+                 txn_write_func = "ovsdb_idl_txn_write"
+-            print "    %(f)s(&row->header_, &%(s)s_col_%(c)s, &datum);" \
++            print("    %(f)s(&row->header_, &%(s)s_col_%(c)s, &datum);" \
+                 % {'f': txn_write_func,
+                    's': structName,
+                    'S': structName.upper(),
+-                   'c': columnName}
+-            print "}"
++                   'c': columnName})
++            print("}")
+         # Update/Delete of partial map column functions
+         for columnName, column in sorted_columns(table):
+             type = column.type
+             if type.is_map():
+-                print '''
++                print('''
+ /* Sets an element of the "%(c)s" map column from the "%(t)s" table in 'row'
+  * to 'new_value' given the key value 'new_key'.
+  *
+@@ -761,17 +762,17 @@ void
+     datum->values = xmalloc(datum->n * sizeof *datum->values);
+ ''' % {'s': structName, 'c': columnName,'coltype':column.type.key.to_const_c_type(prefix),
+         'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper(),
+-        'C': columnName.upper(), 't': tableName}
++        'C': columnName.upper(), 't': tableName})
+ 
+-                print "    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "new_key")
+-                print "    "+ type.value.copyCValue("datum->values[0].%s" % type.value.type.to_string(), "new_value")
+-                print '''
++                print("    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "new_key"))
++                print("    "+ type.value.copyCValue("datum->values[0].%s" % type.value.type.to_string(), "new_value"))
++                print('''
+     ovsdb_idl_txn_write_partial_map(&row->header_,
+                                     &%(s)s_col_%(c)s,
+                                     datum);
+ }''' % {'s': structName, 'c': columnName,'coltype':column.type.key.toCType(prefix),
+-        'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper()}
+-                print '''
++        'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper()})
++                print('''
+ /* Deletes an element of the "%(c)s" map column from the "%(t)s" table in 'row'
+  * given the key value 'delete_key'.
+  *
+@@ -787,19 +788,19 @@ void
+     datum->values = NULL;
+ ''' % {'s': structName, 'c': columnName,'coltype':column.type.key.to_const_c_type(prefix),
+         'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper(),
+-        'C': columnName.upper(), 't': tableName}
++        'C': columnName.upper(), 't': tableName})
+ 
+-                print "    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "delete_key")
+-                print '''
++                print("    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "delete_key"))
++                print('''
+     ovsdb_idl_txn_delete_partial_map(&row->header_,
+                                     &%(s)s_col_%(c)s,
+                                     datum);
+ }''' % {'s': structName, 'c': columnName,'coltype':column.type.key.toCType(prefix),
+-        'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper()}
++        'valtype':column.type.value.to_const_c_type(prefix), 'S': structName.upper()})
+         # End Update/Delete of partial maps
+         # Update/Delete of partial set column functions
+             if type.is_set():
+-                print '''
++                print('''
+ /* Adds the value 'new_value' to the "%(c)s" set column from the "%(t)s" table
+  * in 'row'.
+  *
+@@ -814,16 +815,16 @@ void
+     datum->keys = xmalloc(datum->n * sizeof *datum->values);
+     datum->values = NULL;
+ ''' % {'s': structName, 'c': columnName,
+-        'valtype':column.type.key.to_const_c_type(prefix), 't': tableName}
++        'valtype':column.type.key.to_const_c_type(prefix), 't': tableName})
+ 
+-                print "    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "new_value")
+-                print '''
++                print("    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "new_value"))
++                print('''
+     ovsdb_idl_txn_write_partial_set(&row->header_,
+                                     &%(s)s_col_%(c)s,
+                                     datum);
+ }''' % {'s': structName, 'c': columnName,'coltype':column.type.key.toCType(prefix),
+-        'valtype':column.type.key.to_const_c_type(prefix), 'S': structName.upper()}
+-                print '''
++        'valtype':column.type.key.to_const_c_type(prefix), 'S': structName.upper()})
++                print('''
+ /* Deletes the value 'delete_value' from the "%(c)s" set column from the
+  * "%(t)s" table in 'row'.
+  *
+@@ -839,15 +840,15 @@ void
+     datum->values = NULL;
+ ''' % {'s': structName, 'c': columnName,'coltype':column.type.key.to_const_c_type(prefix),
+         'valtype':column.type.key.to_const_c_type(prefix), 'S': structName.upper(),
+-        'C': columnName.upper(), 't': tableName}
++        'C': columnName.upper(), 't': tableName})
+ 
+-                print "    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "delete_value")
+-                print '''
++                print("    "+ type.key.copyCValue("datum->keys[0].%s" % type.key.type.to_string(), "delete_value"))
++                print('''
+     ovsdb_idl_txn_delete_partial_set(&row->header_,
+                                     &%(s)s_col_%(c)s,
+                                     datum);
+ }''' % {'s': structName, 'c': columnName,'coltype':column.type.key.toCType(prefix),
+-        'valtype':column.type.key.to_const_c_type(prefix), 'S': structName.upper()}
++        'valtype':column.type.key.to_const_c_type(prefix), 'S': structName.upper()})
+         # End Update/Delete of partial set
+ 
+         # Add clause functions.
+@@ -858,8 +859,8 @@ void
+                                         column, True, refTable=False)
+ 
+             if type.is_smap():
+-                print comment
+-                print """void
++                print(comment)
++                print("""void
+ %(s)s_add_clause_%(c)s(struct ovsdb_idl_condition *cond, enum ovsdb_function function, const struct smap *%(c)s)
+ {
+     struct ovsdb_datum datum;
+@@ -884,7 +885,7 @@ void
+        'P': prefix.upper(),
+        's': structName,
+        'S': structName.upper(),
+-       'c': columnName}
++       'c': columnName})
+                 continue
+ 
+             keyVar = members[0]['name']
+@@ -898,73 +899,73 @@ void
+                 if len(members) > 1:
+                     nVar = members[1]['name']
+ 
+-            print comment
+-            print 'void'
+-            print '%(s)s_add_clause_%(c)s(struct ovsdb_idl_condition *cond, enum ovsdb_function function, %(args)s)' % \
++            print(comment)
++            print('void')
++            print('%(s)s_add_clause_%(c)s(struct ovsdb_idl_condition *cond, enum ovsdb_function function, %(args)s)' % \
+                 {'s': structName, 'c': columnName,
+-                 'args': ', '.join(['%(type)s%(name)s' % m for m in members])}
+-            print "{"
+-            print "    struct ovsdb_datum datum;"
++                 'args': ', '.join(['%(type)s%(name)s' % m for m in members])})
++            print("{")
++            print("    struct ovsdb_datum datum;")
+             free = []
+             if type.n_min == 1 and type.n_max == 1:
+-                print "    union ovsdb_atom key;"
++                print("    union ovsdb_atom key;")
+                 if type.value:
+-                    print "    union ovsdb_atom value;"
+-                print
+-                print "    datum.n = 1;"
+-                print "    datum.keys = &key;"
+-                print "    " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar, refTable=False)
++                    print("    union ovsdb_atom value;")
++                print("")
++                print("    datum.n = 1;")
++                print("    datum.keys = &key;")
++                print("    " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar, refTable=False))
+                 if type.value:
+-                    print "    datum.values = &value;"
+-                    print "    "+ type.value.assign_c_value_casting_away_const("value.%s" % type.value.type.to_string(), valueVar, refTable=False)
++                    print("    datum.values = &value;")
++                    print("    "+ type.value.assign_c_value_casting_away_const("value.%s" % type.value.type.to_string(), valueVar, refTable=False))
+                 else:
+-                    print "    datum.values = NULL;"
++                    print("    datum.values = NULL;")
+             elif type.is_optional_pointer():
+-                print "    union ovsdb_atom key;"
+-                print
+-                print "    if (%s) {" % keyVar
+-                print "        datum.n = 1;"
+-                print "        datum.keys = &key;"
+-                print "        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar, refTable=False)
+-                print "    } else {"
+-                print "        datum.n = 0;"
+-                print "        datum.keys = NULL;"
+-                print "    }"
+-                print "    datum.values = NULL;"
++                print("    union ovsdb_atom key;")
++                print("")
++                print("    if (%s) {" % keyVar)
++                print("        datum.n = 1;")
++                print("        datum.keys = &key;")
++                print("        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), keyVar, refTable=False))
++                print("    } else {")
++                print("        datum.n = 0;")
++                print("        datum.keys = NULL;")
++                print("    }")
++                print("    datum.values = NULL;")
+             elif type.n_max == 1:
+-                print "    union ovsdb_atom key;"
+-                print
+-                print "    if (%s) {" % nVar
+-                print "        datum.n = 1;"
+-                print "        datum.keys = &key;"
+-                print "        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), "*" + keyVar, refTable=False)
+-                print "    } else {"
+-                print "        datum.n = 0;"
+-                print "        datum.keys = NULL;"
+-                print "    }"
+-                print "    datum.values = NULL;"
++                print("    union ovsdb_atom key;")
++                print("")
++                print("    if (%s) {" % nVar)
++                print("        datum.n = 1;")
++                print("        datum.keys = &key;")
++                print("        " + type.key.assign_c_value_casting_away_const("key.%s" % type.key.type.to_string(), "*" + keyVar, refTable=False))
++                print("    } else {")
++                print("        datum.n = 0;")
++                print("        datum.keys = NULL;")
++                print("    }")
++                print("    datum.values = NULL;")
+             else:
+-                print "    datum.n = %s;" % nVar
+-                print "    datum.keys = %s ? xmalloc(%s * sizeof *datum.keys) : NULL;" % (nVar, nVar)
++                print("    datum.n = %s;" % nVar)
++                print("    datum.keys = %s ? xmalloc(%s * sizeof *datum.keys) : NULL;" % (nVar, nVar))
+                 free += ['datum.keys']
+                 if type.value:
+-                    print "    datum.values = xmalloc(%s * sizeof *datum.values);" % nVar
++                    print("    datum.values = xmalloc(%s * sizeof *datum.values);" % nVar)
+                     free += ['datum.values']
+                 else:
+-                    print "    datum.values = NULL;"
+-                print "    for (size_t i = 0; i < %s; i++) {" % nVar
+-                print "        " + type.key.assign_c_value_casting_away_const("datum.keys[i].%s" % type.key.type.to_string(), "%s[i]" % keyVar, refTable=False)
++                    print("    datum.values = NULL;")
++                print("    for (size_t i = 0; i < %s; i++) {" % nVar)
++                print("        " + type.key.assign_c_value_casting_away_const("datum.keys[i].%s" % type.key.type.to_string(), "%s[i]" % keyVar, refTable=False))
+                 if type.value:
+-                    print "        " + type.value.assign_c_value_casting_away_const("datum.values[i].%s" % type.value.type.to_string(), "%s[i]" % valueVar, refTable=False)
+-                print "    }"
++                    print("        " + type.value.assign_c_value_casting_away_const("datum.values[i].%s" % type.value.type.to_string(), "%s[i]" % valueVar, refTable=False))
++                print("    }")
+                 if type.value:
+                     valueType = type.value.toAtomicType()
+                 else:
+                     valueType = "OVSDB_TYPE_VOID"
+-                print "    ovsdb_datum_sort_unique(&datum, %s, %s);" % (
+-                    type.key.toAtomicType(), valueType)
++                print("    ovsdb_datum_sort_unique(&datum, %s, %s);" % (
++                    type.key.toAtomicType(), valueType))
+ 
+-            print"""    ovsdb_idl_condition_add_clause(cond,
++            print("""    ovsdb_idl_condition_add_clause(cond,
+                           function,
+                           &%(s)s_col_%(c)s,
+                           &datum);\
+@@ -974,28 +975,28 @@ void
+        'P': prefix.upper(),
+        's': structName,
+        'S': structName.upper(),
+-       'c': columnName}
++       'c': columnName})
+             for var in free:
+-                print "    free(%s);" % var
+-            print "}"
++                print("    free(%s);" % var)
++            print("}")
+ 
+-        print """
++        print("""
+ void
+ %(s)s_set_condition(struct ovsdb_idl *idl, struct ovsdb_idl_condition *condition)
+ {
+     ovsdb_idl_set_condition(idl, &%(p)stable_%(tl)s, condition);
+ }""" % {'p': prefix,
+         's': structName,
+-        'tl': tableName.lower()}
++        'tl': tableName.lower()})
+ 
+         # Table columns.
+         for columnName, column in sorted_columns(table):
+             prereqs = []
+             x = column.type.cInitType("%s_col_%s" % (tableName, columnName), prereqs)
+             if prereqs:
+-                print '\n'.join(prereqs)
+-        print "\nstruct ovsdb_idl_column %s_columns[%s_N_COLUMNS] = {" % (
+-            structName, structName.upper())
++                print('\n'.join(prereqs))
++        print("\nstruct ovsdb_idl_column %s_columns[%s_N_COLUMNS] = {" % (
++            structName, structName.upper()))
+         for columnName, column in sorted_columns(table):
+             if column.mutable:
+                 mutable = "true"
+@@ -1003,7 +1004,7 @@ void
+                 mutable = "false"
+             type_init = '\n'.join("            " + x
+                                   for x in column.type.cInitType("%s_col_%s" % (tableName, columnName), prereqs))
+-            print """\
++            print("""\
+     [%(P)s%(T)s_COL_%(C)s] = {
+          .name = "%(c)s",
+          .type = {
+@@ -1018,38 +1019,38 @@ void
+                'C': columnName.upper(),
+                's': structName,
+                'mutable': mutable,
+-               'type': type_init}
+-        print "};"
++               'type': type_init})
++        print("};")
+ 
+     # Table classes.
+-    print ""
+-    print "struct ovsdb_idl_table_class %stable_classes[%sN_TABLES] = {" % (prefix, prefix.upper())
++    print("")
++    print("struct ovsdb_idl_table_class %stable_classes[%sN_TABLES] = {" % (prefix, prefix.upper()))
+     for tableName, table in sorted(schema.tables.iteritems()):
+         structName = "%s%s" % (prefix, tableName.lower())
+         if table.is_root:
+             is_root = "true"
+         else:
+             is_root = "false"
+-        print "    {\"%s\", %s," % (tableName, is_root)
+-        print "     %s_columns, ARRAY_SIZE(%s_columns)," % (
+-            structName, structName)
+-        print "     sizeof(struct %s), %s_init__}," % (structName, structName)
+-    print "};"
++        print("    {\"%s\", %s," % (tableName, is_root))
++        print("     %s_columns, ARRAY_SIZE(%s_columns)," % (
++            structName, structName))
++        print("     sizeof(struct %s), %s_init__}," % (structName, structName))
++    print("};")
+ 
+     # IDL class.
+-    print "\nstruct ovsdb_idl_class %sidl_class = {" % prefix
+-    print "    \"%s\", %stable_classes, ARRAY_SIZE(%stable_classes)" % (
+-        schema.name, prefix, prefix)
+-    print "};"
++    print("\nstruct ovsdb_idl_class %sidl_class = {" % prefix)
++    print("    \"%s\", %stable_classes, ARRAY_SIZE(%stable_classes)" % (
++        schema.name, prefix, prefix))
++    print("};")
+ 
+-    print """
++    print("""
+ /* Return the schema version.  The caller must not free the returned value. */
+ const char *
+ %sget_db_version(void)
+ {
+     return "%s";
+ }
+-""" % (prefix, schema.version)
++""" % (prefix, schema.version))
+ 
+ 
+ 
+@@ -1075,7 +1076,7 @@ def ovsdb_escape(string):
+     return re.sub(r'["\\\000-\037]', escape, string)
+ 
+ def usage():
+-    print """\
++    print("""\
+ %(argv0)s: ovsdb schema compiler
+ usage: %(argv0)s [OPTIONS] COMMAND ARG...
+ 
+@@ -1087,7 +1088,7 @@ The following commands are supported:
+ The following options are also available:
+   -h, --help                  display this help message
+   -V, --version               display version information\
+-""" % {'argv0': argv0}
++""" % {'argv0': argv0})
+     sys.exit(0)
+ 
+ if __name__ == "__main__":
+@@ -1105,7 +1106,7 @@ if __name__ == "__main__":
+             if key in ['-h', '--help']:
+                 usage()
+             elif key in ['-V', '--version']:
+-                print "ovsdb-idlc (Open vSwitch) @VERSION@"
++                print("ovsdb-idlc (Open vSwitch) @VERSION@")
+             elif key in ['-C', '--directory']:
+                 os.chdir(value)
+             else:
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
new file mode 100644
index 000000000000..59c0f3e4d4c3
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
@@ -0,0 +1,79 @@
+From c98fee41d130cb946aa4e60fefaa6cbf203f6790 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 2/8] Python3 compatibility: exception cleanup
+
+Commit 52e4a477f0b3c0a0ece7adeede6e06e07814f8b9 from
+https://github.com/openvswitch/ovs.git
+
+The exception syntax which is compatible with python2 and python3 is
+to use the "as" form for "except:".
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ build-aux/extract-ofp-fields | 2 +-
+ ovsdb/ovsdb-doc              | 4 ++--
+ ovsdb/ovsdb-idlc.in          | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
+index 425a85f..61e752b 100755
+--- a/build-aux/extract-ofp-fields
++++ b/build-aux/extract-ofp-fields
+@@ -784,7 +784,7 @@ if __name__ == "__main__":
+     try:
+         options, args = getopt.gnu_getopt(sys.argv[1:], 'h',
+                                           ['help', 'ovs-version='])
+-    except getopt.GetoptError, geo:
++    except getopt.GetoptError as geo:
+         sys.stderr.write("%s: %s\n" % (argv0, geo.msg))
+         sys.exit(1)
+ 
+diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
+index b34fb11..918e88a 100755
+--- a/ovsdb/ovsdb-doc
++++ b/ovsdb/ovsdb-doc
+@@ -278,7 +278,7 @@ if __name__ == "__main__":
+             options, args = getopt.gnu_getopt(sys.argv[1:], 'hV',
+                                               ['er-diagram=',
+                                                'version=', 'help'])
+-        except getopt.GetoptError, geo:
++        except getopt.GetoptError as geo:
+             sys.stderr.write("%s: %s\n" % (argv0, geo.msg))
+             sys.exit(1)
+ 
+@@ -306,7 +306,7 @@ if __name__ == "__main__":
+             if len(line):
+                 print(line)
+ 
+-    except error.Error, e:
++    except error.Error as e:
+         sys.stderr.write("%s: %s\n" % (argv0, e.msg))
+         sys.exit(1)
+ 
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 1064448..8b85f0d 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -1098,7 +1098,7 @@ if __name__ == "__main__":
+                                               ['directory',
+                                                'help',
+                                                'version'])
+-        except getopt.GetoptError, geo:
++        except getopt.GetoptError as geo:
+             sys.stderr.write("%s: %s\n" % (argv0, geo.msg))
+             sys.exit(1)
+ 
+@@ -1136,7 +1136,7 @@ if __name__ == "__main__":
+             sys.exit(1)
+ 
+         func(*args[1:])
+-    except ovs.db.error.Error, e:
++    except ovs.db.error.Error as e:
+         sys.stderr.write("%s: %s\n" % (argv0, e))
+         sys.exit(1)
+ 
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch b/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
new file mode 100644
index 000000000000..a85980ed3296
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
@@ -0,0 +1,33 @@
+From 9cbae86be03756df76560c15720756f9ac088144 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 3/8] Python3 compatibility: execfile to exec
+
+Commit a4d10a7ca937d73873f6f98619d88682e69f5dbe from
+https://github.com/openvswitch/ovs.git
+
+Allow compability with python3 and python2 by changing execfile() to
+exec().
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ ovsdb/ovsdb-idlc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 8b85f0d..3fa1a0f 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -17,7 +17,7 @@ def parseSchema(filename):
+ 
+ def annotateSchema(schemaFile, annotationFile):
+     schemaJson = ovs.json.from_file(schemaFile)
+-    execfile(annotationFile, globals(), {"s": schemaJson})
++    exec(compile(open(annotationFile, "rb").read(), annotationFile, 'exec'), globals(), {"s": schemaJson})
+     ovs.json.to_stream(schemaJson, sys.stdout)
+     sys.stdout.write('\n')
+ 
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch b/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
new file mode 100644
index 000000000000..ddc86db2a103
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
@@ -0,0 +1,102 @@
+From 0f318e472d9897d99395adcfb17cbeaff05677ba Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 4/8] Python3 compatibility: iteritems to items
+
+Commit 4ab665623cbb4c6506e48b82e0c9fe8585f42e13 from
+https://github.com/openvswitch/ovs.git
+
+Allow compability with python3 and python2 by changing iteritems() to
+items().
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ build-aux/extract-ofp-actions | 2 +-
+ build-aux/extract-ofp-errors  | 2 +-
+ build-aux/extract-ofp-fields  | 2 +-
+ ovsdb/ovsdb-idlc.in           | 8 ++++----
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
+index 874e6b4..c11297c 100755
+--- a/build-aux/extract-ofp-actions
++++ b/build-aux/extract-ofp-actions
+@@ -13,7 +13,7 @@ version_map = {"1.0": 0x01,
+                "1.3": 0x04,
+                "1.4": 0x05,
+                "1.5": 0x06}
+-version_reverse_map = dict((v, k) for (k, v) in version_map.iteritems())
++version_reverse_map = dict((v, k) for (k, v) in version_map.items())
+ 
+ # Map from vendor name to the length of the action header.
+ vendor_map = {"OF": (0x00000000,  4),
+diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
+index 336a240..71ae0bd 100755
+--- a/build-aux/extract-ofp-errors
++++ b/build-aux/extract-ofp-errors
+@@ -14,7 +14,7 @@ version_map = {"1.0": 0x01,
+                "1.4": 0x05,
+                "1.5": 0x06,
+                "1.6": 0x07}
+-version_reverse_map = dict((v, k) for (k, v) in version_map.iteritems())
++version_reverse_map = dict((v, k) for (k, v) in version_map.items())
+ 
+ token = None
+ line = ""
+diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
+index 61e752b..ef997dd 100755
+--- a/build-aux/extract-ofp-fields
++++ b/build-aux/extract-ofp-fields
+@@ -16,7 +16,7 @@ VERSION = {"1.0": 0x01,
+            "1.3": 0x04,
+            "1.4": 0x05,
+            "1.5": 0x06}
+-VERSION_REVERSE = dict((v,k) for k, v in VERSION.iteritems())
++VERSION_REVERSE = dict((v,k) for k, v in VERSION.items())
+ 
+ TYPES = {"u8":       (1,   False),
+          "be16":     (2,   False),
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 3fa1a0f..615548f 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -138,7 +138,7 @@ def printCIDLHeader(schemaFile):
+ #include "smap.h"
+ #include "uuid.h"''' % {'prefix': prefix.upper()})
+ 
+-    for tableName, table in sorted(schema.tables.iteritems()):
++    for tableName, table in sorted(schema.tables.items()):
+         structName = "%s%s" % (prefix, tableName.lower())
+ 
+         print("")
+@@ -300,7 +300,7 @@ def printCIDLSource(schemaFile):
+ ''' % schema.idlHeader)
+ 
+     # Cast functions.
+-    for tableName, table in sorted(schema.tables.iteritems()):
++    for tableName, table in sorted(schema.tables.items()):
+         structName = "%s%s" % (prefix, tableName.lower())
+         print('''
+ static struct %(s)s *
+@@ -311,7 +311,7 @@ static struct %(s)s *
+ ''' % {'s': structName})
+ 
+ 
+-    for tableName, table in sorted(schema.tables.iteritems()):
++    for tableName, table in sorted(schema.tables.items()):
+         structName = "%s%s" % (prefix, tableName.lower())
+         print("")
+         print("/* %s table. */" % (tableName))
+@@ -1025,7 +1025,7 @@ void
+     # Table classes.
+     print("")
+     print("struct ovsdb_idl_table_class %stable_classes[%sN_TABLES] = {" % (prefix, prefix.upper()))
+-    for tableName, table in sorted(schema.tables.iteritems()):
++    for tableName, table in sorted(schema.tables.items()):
+         structName = "%s%s" % (prefix, tableName.lower())
+         if table.is_root:
+             is_root = "true"
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch b/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
new file mode 100644
index 000000000000..717a97dbee81
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
@@ -0,0 +1,51 @@
+From bc29f98f0137fa1083a4cacf832d52f740d150a8 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 5/8] Python3 compatibility: fix integer problems
+
+Commit fa145f1a53943243f94a32ce98525db8494b0052 from
+https://github.com/openvswitch/ovs.git
+
+In python3 maxint is not defined, but maxsize is defined in both
+python2 and python3.
+
+The put_text() will not automatically use a value which came in as
+float due to a pior math function and python3 will throw an exception.
+The simple answer is to convert it with int() and move on.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ ovsdb/ovsdb-idlc.in   | 2 +-
+ python/build/nroff.py | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 615548f..7cbcbf5 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -358,7 +358,7 @@ static void
+                     print("        %s" % type.value.initCDefault(valueVar, type.n_min == 0))
+                 print("    }")
+             else:
+-                if type.n_max != sys.maxint:
++                if type.n_max != sys.maxsize:
+                     print("    size_t n = MIN(%d, datum->n);" % type.n_max)
+                     nMax = "n"
+                 else:
+diff --git a/python/build/nroff.py b/python/build/nroff.py
+index c23837f..401f699 100644
+--- a/python/build/nroff.py
++++ b/python/build/nroff.py
+@@ -148,6 +148,8 @@ def fatal(msg):
+ 
+ 
+ def put_text(text, x, y, s):
++    x = int(x)
++    y = int(y)
+     extend = x + len(s) - len(text[y])
+     if extend > 0:
+         text[y] += ' ' * extend
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch b/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
new file mode 100644
index 000000000000..54905cd0a785
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
@@ -0,0 +1,56 @@
+From 3a9fcf1c8f60c160c282c9755ee1c7f9f7e113c3 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 6/8] Python3 compatibility: math error compatibility
+
+Commit 3fa5aa4294377e0f35267936d0c5caea3e61db48 from
+https://github.com/openvswitch/ovs.git
+
+The way math is handled with typing is completely different in python3.
+
+% python2<<EOF
+x=10
+y=8
+print((x + (y - 1)) / y * y)
+EOF
+16
+
+python3<<EOF
+x=10
+y=8
+print((x + (y - 1)) / y * y)
+EOF
+17.0
+
+So we need to force an integer for the round function as follows and
+maintain compatibility with python2.
+
+python3<<EOF
+x=10
+y=8
+print(int((x + (y - 1)) / y) * y)
+EOF
+16
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ build-aux/extract-ofp-actions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
+index c11297c..bd7131f 100755
+--- a/build-aux/extract-ofp-actions
++++ b/build-aux/extract-ofp-actions
+@@ -35,7 +35,7 @@ line = ""
+ arg_structs = set()
+ 
+ def round_up(x, y):
+-    return (x + (y - 1)) / y * y
++    return int((x + (y - 1)) / y) * y
+ 
+ def open_file(fn):
+     global file_name
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch b/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
new file mode 100644
index 000000000000..faa32b73b783
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
@@ -0,0 +1,51 @@
+From 2fe58f87b00d0ec24d6997930d0bcdb130c84396 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Jun 2017 20:33:23 -0700
+Subject: [PATCH 7/8] Python3 compatibility: unicode to str
+
+Commit 7430959d4ad17db89b8387c3aef58c8b230cad10 from
+https://github.com/openvswitch/ovs.git
+
+When transitioning from python2 to python3 the following type class
+changes occured:
+
+python2 -> python3
+unicode -> str
+str -> bytes
+
+That means we have to check the python version and do the right type
+check python3 will throw an error when it tries to use the unicode
+type because it doesn't exist.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ ovsdb/ovsdb-doc | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
+index 918e88a..406c293 100755
+--- a/ovsdb/ovsdb-doc
++++ b/ovsdb/ovsdb-doc
+@@ -65,9 +65,15 @@ def columnGroupToNroff(table, groupXml, documented_columns):
+                 if node.hasAttribute('type'):
+                     type_string = node.attributes['type'].nodeValue
+                     type_json = ovs.json.from_string(str(type_string))
+-                    if type(type_json) in (str, unicode):
+-                        raise error.Error("%s %s:%s has invalid 'type': %s" 
+-                                          % (table.name, name, key, type_json))
++                    # py2 -> py3 means str -> bytes and unicode -> str
++                    try:
++                        if type(type_json) in (str, unicode):
++                            raise error.Error("%s %s:%s has invalid 'type': %s" 
++                                              % (table.name, name, key, type_json))
++                    except:
++                        if type(type_json) in (bytes, str):
++                            raise error.Error("%s %s:%s has invalid 'type': %s" 
++                                              % (table.name, name, key, type_json))
+                     type_ = ovs.db.types.BaseType.from_json(type_json)
+                 else:
+                     type_ = column.type.value
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch b/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
new file mode 100644
index 000000000000..d2c2be7cf352
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
@@ -0,0 +1,28 @@
+From a3289add8368e0c970ae1c1c84f5df1f817ed43c Mon Sep 17 00:00:00 2001
+From: Ben Pfaff <blp@ovn.org>
+Date: Thu, 6 Jul 2017 14:01:27 -0700
+Subject: [PATCH 8/8] AUTHORS: Add Jason Wessel.
+
+Commit a91c4cfaf863718bc94fb9c88939bd0b0385a6fe from
+https://github.com/openvswitch/ovs.git
+
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ AUTHORS.rst | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/AUTHORS.rst b/AUTHORS.rst
+index 63e6a8d..d0dc70d 100644
+--- a/AUTHORS.rst
++++ b/AUTHORS.rst
+@@ -156,6 +156,7 @@ Jan Scheurich                   jan.scheurich@ericsson.com
+ Jan Vansteenkiste               jan@vstone.eu
+ Jarno Rajahalme                 jarno@ovn.org
+ Jason Kölker                    jason@koelker.net
++Jason Wessel                    jason.wessel@windriver.com
+ Jasper Capel                    jasper@capel.tv
+ Jean Tourrilhes                 jt@hpl.hp.com
+ Jeremy Stribling                strib@nicira.com
+-- 
+2.5.0
+
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 0e2e67f65b01..9d7f0f3494ef 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -34,7 +34,6 @@ SRC_URI = "\
 	"
 
 EXTRA_OECONF += "\
-	PYTHON=python \
 	PYTHON3=python3 \
 	PERL=${bindir}/perl \
 	"
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 39726075953e..a3c586b75200 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -33,6 +33,19 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            "
 
+# Temporarily backport patches to better support py3. These have been
+# merged upstream but are not part of v2.7.1.
+SRC_URI += " \
+           file://0001-Python3-compatibility-Convert-print-statements.patch \
+           file://0002-Python3-compatibility-exception-cleanup.patch \
+           file://0003-Python3-compatibility-execfile-to-exec.patch \
+           file://0004-Python3-compatibility-iteritems-to-items.patch \
+           file://0005-Python3-compatibility-fix-integer-problems.patch \
+           file://0006-Python3-compatibility-math-error-compatibility.patch \
+           file://0007-Python3-compatibility-unicode-to-str.patch \
+           file://0008-AUTHORS-Add-Jason-Wessel.patch \
+"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
 
 PACKAGECONFIG ?= ""
-- 
2.4.0.53.g8440f74


