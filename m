Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.35113.1599455875883211327
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 06 Sep 2020 22:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0875HYdR001383
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 6 Sep 2020 22:17:45 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Sep 2020
 22:17:23 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] dhcp: remove bbappend file
Date: Sun, 6 Sep 2020 22:17:23 -0700
Message-ID: <20200907051723.80278-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

dhcp has been removed, thus removing its bbappend file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-connectivity/dhcp/dhcp_%.bbappend     |  1 -
 .../dhcp/dhcp_virtualization.inc              | 16 ----
 .../dhcp/files/dhclient-exit-hooks            | 95 -------------------
 3 files changed, 112 deletions(-)
 delete mode 100644 recipes-connectivity/dhcp/dhcp_%.bbappend
 delete mode 100644 recipes-connectivity/dhcp/dhcp_virtualization.inc
 delete mode 100644 recipes-connectivity/dhcp/files/dhclient-exit-hooks

diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
deleted file mode 100644
index 617caccb..00000000
--- a/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-connectivity/dhcp/dhcp_virtualization.inc b/recipes-connectivity/dhcp/dhcp_virtualization.inc
deleted file mode 100644
index 7466056c..00000000
--- a/recipes-connectivity/dhcp/dhcp_virtualization.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://dhclient-exit-hooks \
-           "
-
-do_install_append () {
-	install -m 0644 ${WORKDIR}/dhclient-exit-hooks ${D}${sysconfdir}/dhcp/dhclient-exit-hooks
-	sed 's%/etc/dhclient-exit-hooks%/etc/dhcp/dhclient-exit-hooks%g' -i ${D}${base_sbindir}/dhclient-script
-
-	sed 's%request .*%\noption classless-static-routes code 121 = array of unsigned integer 8;\n\n&%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
-	sed 's%netbios-name-servers,.*netbios-scope;%netbios-name-servers, netbios-scope, classless-static-routes;\n%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
-
-}
-
-FILES_${PN}-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
-                     "
diff --git a/recipes-connectivity/dhcp/files/dhclient-exit-hooks b/recipes-connectivity/dhcp/files/dhclient-exit-hooks
deleted file mode 100644
index 41bcb084..00000000
--- a/recipes-connectivity/dhcp/files/dhclient-exit-hooks
+++ /dev/null
@@ -1,95 +0,0 @@
-#!/bin/bash
-#
-# /etc/dhcp/dhclient-exit-hooks
-#
-# This file is sourced by /sbin/dhclient-script.
-#
-# dhcp option 121 is defined in RFC3442. The following is the link. 
-# http://www.ietf.org/rfc/rfc3442.txt
-#
-# The code for this option is 121, and its minimum length is 5 bytes.
-# This option can contain one or more static routes, each of which
-# consists of a destination descriptor and the IP address of the router
-# that should be used to reach that destination.
-#
-#    Code Len Destination 1    Router 1
-#   +-----+---+----+-----+----+----+----+----+----+
-#   | 121 | n | d1 | ... | dN | r1 | r2 | r3 | r4 |
-#   +-----+---+----+-----+----+----+----+----+----+
-#
-#    Destination 2       Router 2
-#   +----+-----+----+----+----+----+----+
-#   | d1 | ... | dN | r1 | r2 | r3 | r4 |
-#   +----+-----+----+----+----+----+----+
-#
-# In the above example, two static routes are specified.
-#
-# The following table contains some examples of how various subnet
-# number/mask combinations can be encoded:
-#
-#   Subnet number   Subnet mask      Destination descriptor
-#   0               0                0
-#   10.0.0.0        255.0.0.0        8.10
-#   10.0.0.0        255.255.255.0    24.10.0.0
-#   10.17.0.0       255.255.0.0      16.10.17
-#   10.27.129.0     255.255.255.0    24.10.27.129
-#   10.229.0.128    255.255.255.128  25.10.229.0.128
-#   10.198.122.47   255.255.255.255  32.10.198.122.47
-#
-# For metadata service, the following is a valid route from nova-api that
-# the VM instance can uses to retrieve metadata.
-#
-#   32 169 254 169 254 128 224 149 201
-#
-# In the above example, mask length of destination descriptor is always 32,
-# destination is always "169.254.169.254", and the gateway is a valid IP address.
-#
-# The add_routes function takes an array of unsigned integer 8, separated by spaces,
-# parse them, and added each of the routes into routing table.
-#
-
-function add_routes() {
-while [ $# -ne 0 ]; do
-  mask=$1
-  shift
- 
-  # Parse the arguments into a CIDR net/mask string
-  if [ $mask -eq 32 ]; then
-    destination="-host $1.$2.$3.$4"
-    shift; shift; shift; shift
-  elif [ $mask -gt 24 ]; then
-    destination="-net $1.$2.$3.$4/$mask"
-    shift; shift; shift; shift
-  elif [ $mask -gt 16 ]; then
-    destination="-net $1.$2.$3.0/$mask"
-    shift; shift; shift
-  elif [ $mask -gt 8 ]; then
-    destination="-net $1.$2.0.0/$mask"
-    shift; shift
-  #Add the default route
-  elif [ $mask -eq 0 ]; then
-    destination="default"
-  else
-    destination="-net $1.0.0.0/$mask"
-    shift
-  fi
- 
-  # Read the gateway
-  gateway="$1.$2.$3.$4"
-  shift; shift; shift; shift
-
-  # Add route into routing table
-  route add $destination gw $gateway
-
-  # Print it out if the route is added successfully
-  if [ $? = 0 ]; then
-    echo "Added route \"$destination gw $gateway\""
-  fi
-done
-}
-
-# Call add_routes to add routes
-if [ "x$new_classless_static_routes" != x ]; then
-  add_routes $new_classless_static_routes
-fi
-
-- 
2.21.0

