Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA81C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 14:18:34 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7769.1648736313445027595
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22VEIUNj007523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 07:18:31 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 31 Mar 2022 07:18:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 31 Mar 2022 07:18:30 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 31 Mar 2022 07:18:30 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: upgrade 7.2.0 -> 8.1.0
Date: Thu, 31 Mar 2022 10:18:29 -0400
Message-ID: <20220331141829.17208-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 22VEIUNj007523
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 14:18:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7118

Dropped patches which are part of the new version:
	0001-docs-Fix-template-matching-in-page.xsl.patch
	0001-security-fix-SELinux-label-generation-logic.patch
	0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
	0002-meson-Fix-compatibility-with-Meson-0.58.patch

Dropped the obsolete md5checksum.

From upstream libvirt, the commit:
	8eb4461645 remove sysconfig files
removes all sysconfig files. Add the former libvirtd
sysconfig file that starts libvirtd in the right mode.
Since the sysconfig file has already been sed'ed,
remove the sed line from the install rule.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc   |  4 +-
 ...cs-Fix-template-matching-in-page.xsl.patch | 64 -------------------
 ...y-fix-SELinux-label-generation-logic.patch | 56 ----------------
 ...nlock-object-on-ACL-fail-in-storageP.patch | 40 ------------
 ...on-Fix-compatibility-with-Meson-0.58.patch | 48 --------------
 recipes-extended/libvirt/libvirt/libvirtd     | 22 +++++++
 .../{libvirt_7.2.0.bb =3D> libvirt_8.1.0.bb}    | 19 +++---
 7 files changed, 34 insertions(+), 219 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-docs-Fix-templa=
te-matching-in-page.xsl.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-security-fix-SE=
Linux-label-generation-logic.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-storage_driver-=
Unlock-object-on-ACL-fail-in-storageP.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0002-meson-Fix-compa=
tibility-with-Meson-0.58.patch
 create mode 100644 recipes-extended/libvirt/libvirt/libvirtd
 rename recipes-extended/libvirt/{libvirt_7.2.0.bb =3D> libvirt_8.1.0.bb}=
 (94%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extend=
ed/libvirt/libvirt-python.inc
index a48aaea5..6f963fb8 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,8 +17,8 @@ FILES:${PN}-python =3D "${bindir}/* ${libdir}/* ${libdi=
r}/${PYTHON_DIR}/*"
=20
 SRC_URI +=3D "http://libvirt.org/sources/python/libvirt-python-${PV}.tar=
.gz;name=3Dlibvirt_python"
=20
-SRC_URI[libvirt_python.md5sum] =3D "19bf22414a43d358581b9259b52047a7"
-SRC_URI[libvirt_python.sha256sum] =3D "c0c3bac54c55622e17927b09cd9843869=
600d71842fb072c99491fe2608dcee7"
+SRC_URI[libvirt_python.md5sum] =3D "dbb1ab179303700aefa20f831b645ee2"
+SRC_URI[libvirt_python.sha256sum] =3D "a21ecfab6d29ac1bdd1bfd4aa3ef58447=
f9f70919aefecd03774613f65914e43"
=20
 export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS =3D "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matc=
hing-in-page.xsl.patch b/recipes-extended/libvirt/libvirt/0001-docs-Fix-t=
emplate-matching-in-page.xsl.patch
deleted file mode 100644
index 9dd650ee..00000000
--- a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in=
-page.xsl.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 54814c87f3706cc8eb894634ebef0f9cf7dabae6 Mon Sep 17 00:00:00 2001
-From: Martin Kletzander <mkletzan@redhat.com>
-Date: Mon, 21 Feb 2022 09:26:13 +0100
-Subject: [PATCH] docs: Fix template matching in page.xsl
-
-Our last default template had a match of "node()" which incidentally mat=
ched
-everything, including text nodes.  Since this has the same priority acco=
rding to
-the XSLT spec, section 5.5:
-
-  https://www.w3.org/TR/1999/REC-xslt-19991116#conflict
-
-this is an error.  Also according to the same spec section, the XSLT pro=
cessor
-may signal the error or pick the last rule.
-
-This was uncovered with libxslt 1.1.35 which contains the following comm=
it:
-
-  https://gitlab.gnome.org/GNOME/libxslt/-/commit/b0074eeca3c6b21b4da14f=
df712b853900c51635
-
-which makes the build fail with:
-
-  runtime error: file ../docs/page.xsl line 223 element element
-  xsl:element: The effective name '' is not a valid QName.
-
-because our last rule also matches text nodes and we are trying to extra=
ct the
-node name out of them.
-
-To fix this we change the match to "*" which only matches elements and n=
ot all
-the nodes, and to avoid any possible errors with different XSLT processo=
rs we
-also bump the priority of the match=3D"text()" rule a little higher, jus=
t in case
-someone needs to use an XSLT processor that chooses signalling the error=
 instead
-of the optional recovery.
-
-https://bugs.gentoo.org/833586
-
-Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
----
- docs/page.xsl | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/docs/page.xsl b/docs/page.xsl
-index fd67918d3b..72a6fa0842 100644
---- a/docs/page.xsl
-+++ b/docs/page.xsl
-@@ -215,11 +215,11 @@
-     </xsl:element>
-   </xsl:template>
-=20
--  <xsl:template match=3D"text()" mode=3D"copy">
-+  <xsl:template match=3D"text()" mode=3D"copy" priority=3D"0">
-     <xsl:value-of select=3D"."/>
-   </xsl:template>
-=20
--  <xsl:template match=3D"node()" mode=3D"copy">
-+  <xsl:template match=3D"*" mode=3D"copy">
-     <xsl:element name=3D"{name()}">
-       <xsl:copy-of select=3D"./@*"/>
-       <xsl:apply-templates mode=3D"copy" />
---=20
-2.33.0
-
diff --git a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-l=
abel-generation-logic.patch b/recipes-extended/libvirt/libvirt/0001-secur=
ity-fix-SELinux-label-generation-logic.patch
deleted file mode 100644
index 2753503d..00000000
--- a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-ge=
neration-logic.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
-Date: Mon, 28 Jun 2021 13:09:04 +0100
-Subject: [PATCH] security: fix SELinux label generation logic
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-A process can access a file if the set of MCS categories
-for the file is equal-to *or* a subset-of, the set of
-MCS categories for the process.
-
-If there are two VMs:
-
-  a) svirt_t:s0:c117
-  b) svirt_t:s0:c117,c720
-
-Then VM (b) is able to access files labelled for VM (a).
-
-IOW, we must discard case where the categories are equal
-because that is a subset of many other valid category pairs.
-
-Upstream-status: Backport
-
-Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
-CVE-2021-3631
-Reviewed-by: Peter Krempa <pkrempa@redhat.com>
-Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
----
- src/security/security_selinux.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/security/security_selinux.c b/src/security/security_sel=
inux.c
-index b50f4463cc..0c2cf1d1c7 100644
---- a/src/security/security_selinux.c
-+++ b/src/security/security_selinux.c
-@@ -383,7 +383,15 @@ virSecuritySELinuxMCSFind(virSecurityManager *mgr,
-         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin)=
;
-=20
-         if (c1 =3D=3D c2) {
--            mcs =3D g_strdup_printf("%s:c%d", sens, catMin + c1);
-+            /*
-+             * A process can access a file if the set of MCS categories
-+             * for the file is equal-to *or* a subset-of, the set of
-+             * MCS categories for the process.
-+             *
-+             * IOW, we must discard case where the categories are equal
-+             * because that is a subset of other category pairs.
-+             */
-+            continue;
-         } else {
-             if (c1 > c2) {
-                 int t =3D c1;
---=20
-2.17.1
-
diff --git a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-=
object-on-ACL-fail-in-storageP.patch b/recipes-extended/libvirt/libvirt/0=
001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
deleted file mode 100644
index 608322d9..00000000
--- a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-=
on-ACL-fail-in-storageP.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d3e20e186ed531e196bb1529430f39b0c917e6dc Mon Sep 17 00:00:00 2001
-From: Peter Krempa <pkrempa@redhat.com>
-Date: Wed, 21 Jul 2021 11:22:25 +0200
-Subject: [PATCH] storage_driver: Unlock object on ACL fail in
- storagePoolLookupByTargetPath
-
-'virStoragePoolObjListSearch' returns a locked and refed object, thus we
-must release it on ACL permission failure.
-
-Fixes: 7aa0e8c0cb8
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D1984318
-Signed-off-by: Peter Krempa <pkrempa@redhat.com>
-Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
-
-Upstream-status: Backport
-CVE-2021-3667 [https://bugzilla.redhat.com/show_bug.cgi?id=3D1986094]
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
----
- src/storage/storage_driver.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/storage/storage_driver.c b/src/storage/storage_driver.c
-index ecb5b86b4f..de66f1f9e5 100644
---- a/src/storage/storage_driver.c
-+++ b/src/storage/storage_driver.c
-@@ -1739,8 +1739,10 @@ storagePoolLookupByTargetPath(virConnectPtr conn,
-                                            storagePoolLookupByTargetPat=
hCallback,
-                                            cleanpath))) {
-         def =3D virStoragePoolObjGetDef(obj);
--        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0)
-+        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0) {
-+            virStoragePoolObjEndAPI(&obj);
-             return NULL;
-+        }
-=20
-         pool =3D virGetStoragePool(conn, def->name, def->uuid, NULL, NU=
LL);
-         virStoragePoolObjEndAPI(&obj);
---=20
-2.27.0
-
diff --git a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibilit=
y-with-Meson-0.58.patch b/recipes-extended/libvirt/libvirt/0002-meson-Fix=
-compatibility-with-Meson-0.58.patch
deleted file mode 100644
index 3201eede..00000000
--- a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-=
Meson-0.58.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c607266619c5ab78ad5d4179b3ea93cfb6348391 Mon Sep 17 00:00:00 2001
-From: Andrea Bolognani <abologna@redhat.com>
-Date: Mon, 3 May 2021 09:06:34 +0200
-Subject: [PATCH] meson: Fix compatibility with Meson 0.58
-
-Builds failed with
-
-  tests/meson.build:690:0: ERROR: List item must be one
-  of <class 'str'>, not <class 'list'>
-
-before this change.
-
-https://gitlab.com/libvirt/libvirt/-/issues/158
-
-Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/c=
607266619c5ab78ad5d4179b3ea93cfb6348391]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Andrea Bolognani <abologna@redhat.com>
-Reviewed-by: Peter Krempa <pkrempa@redhat.com>
-Reviewed-by: Pavel Hrdina <phrdina@redhat.com>
----
- tests/meson.build | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 05c3e90195..9900983d0c 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -687,12 +687,12 @@ foreach name : test_scripts
-   test(name, script, env: tests_env)
- endforeach
-=20
-+testenv =3D runutf8
-+testenv +=3D 'VIR_TEST_FILE_ACCESS=3D1'
-+
- add_test_setup(
-   'access',
--  env: [
--    'VIR_TEST_FILE_ACCESS=3D1',
--    runutf8,
--  ],
-+  env: testenv,
-   exe_wrapper: [ python3_prog, check_file_access_prog.path() ],
- )
-=20
---=20
-GitLab
-
diff --git a/recipes-extended/libvirt/libvirt/libvirtd b/recipes-extended=
/libvirt/libvirt/libvirtd
new file mode 100644
index 00000000..455b4395
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/libvirtd
@@ -0,0 +1,22 @@
+# Customizations for the libvirtd.service systemd unit
+
+# Default behaviour is for libvirtd.service to start on boot
+# so that VM autostart can be performed. We then want it to
+# shutdown again if nothing was started and rely on systemd
+# socket activation to start it again when some client app
+# connects.
+LIBVIRTD_ARGS=3D"--timeout 120"
+
+# If systemd socket activation is disabled, then the following
+# can be used to listen on TCP/TLS sockets
+#LIBVIRTD_ARGS=3D"--listen"
+LIBVIRTD_ARGS=3D"--listen --daemon"
+
+# Override the QEMU/SDL default audio driver probing when
+# starting virtual machines using SDL graphics
+#
+# NB these have no effect for VMs using VNC, unless vnc_allow_host_audio
+# is enabled in /etc/libvirt/qemu.conf
+#QEMU_AUDIO_DRV=3Dsdl
+#
+#SDL_AUDIODRIVER=3Dpulse
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended=
/libvirt/libvirt_8.1.0.bb
similarity index 94%
rename from recipes-extended/libvirt/libvirt_7.2.0.bb
rename to recipes-extended/libvirt/libvirt_8.1.0.bb
index 1fc55b8d..f4c0722a 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -23,19 +23,15 @@ RDEPENDS:libvirt-libvirtd:append:x86 =3D " dmidecode"
 RCONFLICTS:${PN}_libvirtd =3D "connman"
=20
 SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibv=
irt \
+           file://libvirtd \
            file://libvirtd.sh \
            file://libvirtd.conf \
            file://dnsmasq.conf \
            file://hook_support.py \
            file://gnutls-helper.py \
-           file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
-           file://0001-security-fix-SELinux-label-generation-logic.patch=
 \
-           file://0001-storage_driver-Unlock-object-on-ACL-fail-in-stora=
geP.patch \
-           file://0001-docs-Fix-template-matching-in-page.xsl.patch \
           "
=20
-SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
-SRC_URI[libvirt.sha256sum] =3D "01f459d0c7ba5009622a628dba1a026200e8f4a2=
99fea783b936a71d7e0ed1d0"
+SRC_URI[libvirt.sha256sum] =3D "3c6c43becffeb34a3f397c616206aa69a893ff8b=
f5e8208393c84e8e75352934"
=20
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
 USERADD_PACKAGES =3D "${PN}"
@@ -160,7 +156,7 @@ PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddi=
sabled,fuse,"
 PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
 PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libca=
p-ng,"
 PACKAGECONFIG[wireshark] =3D "-Dwireshark_dissector=3Denabled,-Dwireshar=
k_dissector=3Ddisabled,wireshark libwsutil,"
-PACKAGECONFIG[apparmor_profiles] =3D "-Dapparmor_profiles=3Dtrue, -Dappa=
rmor_profiles=3Dfalse,"
+PACKAGECONFIG[apparmor_profiles] =3D "-Dapparmor_profiles=3Denabled, -Da=
pparmor_profiles=3Ddisabled,"
 PACKAGECONFIG[firewalld] =3D "-Dfirewalld=3Denabled, -Dfirewalld=3Ddisab=
led,"
 PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled, -Dlibpcap=3Ddisabled,li=
bpcap,libpcap"
 PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
@@ -211,8 +207,8 @@ do_install:append() {
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib=
/systemd
             fi
=20
-	    # This variable is used by libvirtd.service to start libvirtd in th=
e right mode
-	    sed -i '/#LIBVIRTD_ARGS=3D"--listen"/a LIBVIRTD_ARGS=3D"--listen --=
daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
+            mkdir -p ${D}/${sysconfdir}/sysconfig
+            install -m 0644 ${WORKDIR}/libvirtd ${D}/${sysconfdir}/sysco=
nfig
=20
 	    # We can't use 'notify' when we don't support 'sd_notify' dbus capa=
bilities.
 	    sed -i -e 's/Type=3Dnotify/Type=3Dforking/' \
@@ -307,6 +303,11 @@ do_install:append() {
=20
 	# virt-login-shell needs to run with setuid permission
 	chmod 4755 ${D}${bindir}/virt-login-shell
+
+        # remove unsupported migration config file
+        # migration process is described here:
+        # https://wiki.qemu.org/Features/PostCopyLiveMigration
+        rm ${D}/usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
 }
=20
 EXTRA_OEMESON +=3D " \
--=20
2.33.0


