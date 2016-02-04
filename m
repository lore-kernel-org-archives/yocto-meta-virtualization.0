Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD1D0E00CBD; Wed,  3 Feb 2016 17:43:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82C11E00C86
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:41 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gfLV011639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:41 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:40 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:44 -0500
Message-ID: <1454550104-7065-50-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 49/49] nova: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:24 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../nova-add-migrate.cfg-to-the-MANIFEST.patch     | 24 ----------------------
 .../recipes-devtools/python/python-nova/nova.conf  |  2 +-
 .../recipes-devtools/python/python-nova_git.bb     | 17 ++++++++++-----
 .../python/python-novaclient_git.bb                |  6 ++----
 4 files changed, 15 insertions(+), 34 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-nova/nova-add-migrate.cfg-to-the-MANIFEST.patch

diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova-add-migrate.cfg-to-the-MANIFEST.patch b/meta-openstack/recipes-devtools/python/python-nova/nova-add-migrate.cfg-to-the-MANIFEST.patch
deleted file mode 100644
index 25aa07e..0000000
--- a/meta-openstack/recipes-devtools/python/python-nova/nova-add-migrate.cfg-to-the-MANIFEST.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 019f6c2d838aefa9b625bd7a5eadb031fca735cd Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Mon, 27 Jan 2014 16:06:16 -0500
-Subject: [PATCH] nova: add migrate.cfg to the MANIFEST
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- MANIFEST.in |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-index c978a52dae21..61e522c610d6 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -1,5 +1,6 @@
- include AUTHORS
- include ChangeLog
-+include nova/db/sqlalchemy/migrate_repo/migrate.cfg
- exclude .gitignore
- exclude .gitreview
- 
--- 
-1.7.10.4
-
diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova.conf b/meta-openstack/recipes-devtools/python/python-nova/nova.conf
index fe4d756..1082f11 100644
--- a/meta-openstack/recipes-devtools/python/python-nova/nova.conf
+++ b/meta-openstack/recipes-devtools/python/python-nova/nova.conf
@@ -1,7 +1,7 @@
 [DEFAULT]
 # firewall_driver = nova.virt.libvirt.firewall.IptablesFirewallDriver
 firewall_driver = nova.virt.firewall.NoopFirewallDriver
-compute_driver = libvirt.LibvirtDriver
+compute_driver = nova.virt.libvirt.LibvirtDriver
 default_floating_pool = public
 fixed_range =
 force_dhcp_release = True
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 0bc5d03..fd50173 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -10,8 +10,7 @@ SRCNAME = "nova"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
-           file://nova-add-migrate.cfg-to-the-MANIFEST.patch \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://neutron-api-set-default-binding-vnic_type.patch \
            "
 # restore post stable/juno:
@@ -26,8 +25,8 @@ SRC_URI += "file://nova-all \
             file://nova.conf \
             file://openrc \
            "
-SRCREV = "8397b6464af520903f546ce4c6d51a2eb5b4c8a8"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "6df6ad3ff32f2b1fe2978df1032002548ad8eb66"
+PV = "12.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -312,7 +311,7 @@ RDEPENDS_${PN} = " libvirt \
 		   python-sqlalchemy \
 		   python-sqlalchemy-migrate \
 		   python-stevedore \
-		   python-suds \
+		   python-suds-jurko \
 		   python-neutronclient \
 		   python-routes \
 		   python-webob \
@@ -325,6 +324,14 @@ RDEPENDS_${PN} = " libvirt \
 		   python-sqlparse \
 		   python-netifaces \
 		   python-retrying \
+		   python-debtcollector \
+		   python-ecdsa \
+		   python-wrapt \
+		   python-oslo.versionedobjects \
+		   python-oslo.reports \
+		   python-monotonic \
+		   python-oslo.service \
+		   python-os-brick \
     "
 
 RDEPENDS_${SRCNAME}-common = "${PN} openssl openssl-misc libxml2 libxslt \
diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
index d8d7168..a2775ec 100644
--- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
@@ -4,15 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7cdb54622cacc9bc9b2883091e6dd669"
 
-PR = "r0"
-
 SRC_URI = "\
 	git://github.com/openstack/python-novaclient.git;branch=master \
 	file://nova-api-check.sh \
 	"
 
-PV = "2.23.0+git${SRCPV}"
-SRCREV = "e0f5072907a00d48a183dd8fc91a6cf6038ca279"
+PV = "2.33.0+git${SRCPV}"
+SRCREV = "a5363ae0d60d41feff23f6cca44fcd7aa9fc5b8b"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
-- 
2.1.4


