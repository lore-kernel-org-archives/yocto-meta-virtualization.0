Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3473E00B6C; Fri, 12 Jul 2019 21:33:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00ADFE0096F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jul 2019 21:33:22 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6D4XHON025707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2019 21:33:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 21:33:04 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Sat, 13 Jul 2019 12:33:03 +0800
Message-ID: <1562992383-136624-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] libvirt: libvirtd: Facilitate using tls connection mode
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
X-List-Received-Date: Sat, 13 Jul 2019 04:33:25 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

tls is the default network connection mode of libvirtd upstream, though we use
tcp mode as default.

tls requires necessary keys and certificates of certificate authority, server
and client to be properly generated and deployed. Otherwise servers and clients
cannot be connected.

This patch,
 - integrates sample keys and certificats of certificate authority, server and
   client for users to be able to use tls mode out of box.
 - sets default server IP address to 127.0.0.1 for users to use local client out
   of box.
 - integrates certtool and provides gnutls-help.py for users to generate keys
   and certificates on targets in their own ways.
 - adds a PACKAGECONFIG option "gnutls" to control all of the above integration
   but disables it to keep the same default behavior as before.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2:
 - Rebase on 5.5.0
 - Add license header and copyright
 - Python3nize gnutls-helper
 - Simplify addtion to FILES with wildcard

 recipes-extended/libvirt/README                   |  26 +++++
 recipes-extended/libvirt/libvirt/gnutls-helper.py | 136 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_5.5.0.bb         |  28 ++++-
 3 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/libvirt/README
 create mode 100755 recipes-extended/libvirt/libvirt/gnutls-helper.py

diff --git a/recipes-extended/libvirt/README b/recipes-extended/libvirt/README
new file mode 100644
index 0000000..af4fd17
--- /dev/null
+++ b/recipes-extended/libvirt/README
@@ -0,0 +1,26 @@
+libvirt default connection mode between client(where for example virsh runs) and
+server(where libvirtd runs) is tls which requires keys and certificates for
+certificate authority, client and server to be properly generated and deployed.
+Otherwise, servers and clients cannot be connected.
+
+recipes-extended/libvirt/libvirt/gnutls-help.py is provided to help generate
+required keys and certificates.
+
+Usage:
+gnutls-help.py [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info>
+If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.
+
+!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+!! "ip_address" field of server.info must be IP address of the server. !!
+!! For more details, please refer to:                                  !!
+!! https://libvirt.org/remote.html#Remote_certificates                 !!
+!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+
+Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cacert.pem
+Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverkey.pem
+Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
+Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientkey.pem
+Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
+
+For more details please refer to libvirt official document,
+https://libvirt.org/remote.html#Remote_certificates
diff --git a/recipes-extended/libvirt/libvirt/gnutls-helper.py b/recipes-extended/libvirt/libvirt/gnutls-helper.py
new file mode 100755
index 0000000..b994946
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/gnutls-helper.py
@@ -0,0 +1,136 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2019 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os, sys, getopt
+
+banner = \
+'''\
+!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+!! "ip_address" field of server.info must be IP address of the server. !!
+!! For more details, please refer to:                                  !!
+!! https://libvirt.org/remote.html#Remote_certificates                 !!
+!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+
+Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cacert.pem
+Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverkey.pem
+Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
+Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientkey.pem
+Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
+'''
+
+if os.system('which certtool > /dev/null 2>&1') != 0:
+    print('certtool is not available. It is provided by \n\
+gnutls-bin on Yocto like Linux or \n\
+gnutls-bin on Debian like distribution or \n\
+gnutls-utils on Redhat like distribution.')
+    sys.exit()
+
+cainfo = ""
+serverinfo = ""
+clientinfo = ""
+yes = 0
+
+try:
+    opts, args = getopt.getopt(sys.argv[1:], "ha:b:c:y", ["help", "ca-info=", "server-info=", "client-info=", "yes"])
+except getopt.GetoptError:
+    print('Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0]))
+    print('If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.')
+    sys.exit(2)
+for opt, arg in opts:
+    if opt in ("-h", "--help"):
+        print('Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0]))
+        print('If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.\n')
+        print(banner)
+        sys.exit()
+    elif opt in ("-a", "--ca-info"):
+        cainfo = arg
+    elif opt in ("-b", "--server-info"):
+        serverinfo = arg
+    elif opt in ("-c", "--client-info"):
+        clientinfo = arg
+    elif opt in ("-y", "--yes"):
+        yes = 1
+
+cainfodefault = \
+'''cn = CA
+ca
+cert_signing_key
+'''
+
+serverinfodefault = \
+'''organization = Organization
+cn = Server
+dns_name = DNS Name
+ip_address = 127.0.0.1
+tls_www_server
+encryption_key
+signing_key
+'''
+
+clientinfodefault = \
+'''country = Country
+state = State
+locality = Locality
+organization = Organization
+cn = Client
+tls_www_client
+encryption_key
+signing_key
+'''
+
+if not cainfo:
+    if yes == 0:
+        opt = input('{}\nca.info not provided by -a, the above will be used [y/n]?'.format(cainfodefault))
+        if opt != 'y':
+            exit()
+    cainfo = "ca.info"
+    with open(cainfo, mode='w') as f:
+        f.write(cainfodefault)
+
+if not serverinfo:
+    if yes == 0:
+        opt = input('{}\nserver.info not provided by -b, the above will be used [y/n]?'.format(serverinfodefault))
+        if opt != 'y':
+            exit()
+    serverinfo = "server.info"
+    with open(serverinfo, mode='w') as f:
+        f.write(serverinfodefault)
+
+if not clientinfo:
+    if yes == 0:
+        opt = input('{}\nclient.info not provided by -c, the above will be used [y/n]?'.format(clientinfodefault))
+        if opt != 'y':
+            sys.exit()
+    clientinfo = "client.info"
+    with open(clientinfo, mode='w') as f:
+        f.write(clientinfodefault)
+
+if os.system("certtool --generate-privkey > cakey.pem") != 0:
+    print('ca private key failed.')
+    sys.exit()
+
+if os.system("certtool --generate-self-signed --load-privkey cakey.pem --template {} --outfile cacert.pem".format(cainfo)) != 0:
+    print('ca cert failed.')
+    sys.exit()
+
+if os.system("certtool --generate-privkey > serverkey.pem") != 0:
+    print('server private key failed.')
+    sys.exit()
+
+if os.system("certtool --generate-certificate --load-privkey serverkey.pem --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template {} --outfile servercert.pem".format(serverinfo)) != 0:
+    print('server cert failed.')
+    sys.exit()
+
+if os.system("certtool --generate-privkey > clientkey.pem") != 0:
+    print('client private key failed.')
+    sys.exit()
+
+if os.system("certtool --generate-certificate --load-privkey clientkey.pem --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template {} --outfile clientcert.pem".format(clientinfo)) != 0:
+    print('client cert failed.')
+    sys.exit()
+
+print(banner)
diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
index 222654a..26800b7 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
@@ -8,7 +8,8 @@ SECTION = "console/tools"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
-	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)}"
+	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
+	   ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
 
 # libvirt-guests.sh needs gettext.sh
 #
@@ -36,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
            file://hook_support.py \
+           file://gnutls-helper.py \
           "
 
 SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
@@ -119,6 +121,7 @@ FILES_${PN}-libvirtd = " \
 	${sbindir}/libvirtd \
 	${systemd_unitdir}/system/* \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
         "
 
 FILES_${PN}-virsh = " \
@@ -198,6 +201,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
 
 # enable,disable,depends,rdepends
 #
+PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
 PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
@@ -310,6 +314,28 @@ do_install_append() {
 	chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
 	echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+
+	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
+	    # Generate sample keys and certificates.
+	    cd ${WORKDIR}
+	    ${WORKDIR}/gnutls-helper.py -y
+
+	    # Deploy all sample keys and certificates of CA, server and client
+	    # to target so that libvirtd is able to boot successfully and local
+	    # connection via 127.0.0.1 is available out of box.
+	    install -d ${D}/etc/pki/CA
+	    install -d ${D}/etc/pki/libvirt/private
+	    install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
+	    install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
+	    install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
+	    install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
+	    install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
+	    install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
+	    install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
+
+	    # Force the connection to be tls.
+	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
+	fi
 }
 
 EXTRA_OECONF += " \
-- 
2.7.4


