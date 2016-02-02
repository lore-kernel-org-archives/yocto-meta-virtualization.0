Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90A32E00B66; Tue,  2 Feb 2016 04:37:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01BEDE00AD8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 04:37:03 -0800 (PST)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12BfKup011780 for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Feb 2016 05:41:20 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020205411991-550096 ;
	Tue, 2 Feb 2016 05:41:19 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 2 Feb 2016 13:40:55 +0200
Message-Id: <f0e2348100030c27e00abd70daa9085728d22224.1454413132.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
References: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 05:41:20 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 05:41:20 AM,
	Serialize complete at 02/02/2016 05:41:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_08:, , signatures=0
Subject: [meta-cloud-services][PATCH 5/6] openldap.bbappend: update 2.4.39 -> 2.4.%
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
X-List-Received-Date: Tue, 02 Feb 2016 12:37:05 -0000

meta-oe has updated to 2.4.43. Use a wilcard for minor numbers because
they change very rapidly.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../openldap/openldap_2.4.%.bbappend               | 73 ++++++++++++++++++++++
 .../openldap/openldap_2.4.39.bbappend              | 73 ----------------------
 2 files changed, 73 insertions(+), 73 deletions(-)
 create mode 100644 meta-openstack/recipes-support/openldap/openldap_2.4.%.bbappend
 delete mode 100644 meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend

diff --git a/meta-openstack/recipes-support/openldap/openldap_2.4.%.bbappend b/meta-openstack/recipes-support/openldap/openldap_2.4.%.bbappend
new file mode 100644
index 0000000..63f6064
--- /dev/null
+++ b/meta-openstack/recipes-support/openldap/openldap_2.4.%.bbappend
@@ -0,0 +1,73 @@
+DEPEND_${PN} += "cyrus-sasl" 
+RDEPEND_${PN} += "libsasl2-modules"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+SRC_URI += "file://initscript"
+SRC_URI += "file://ops-base.ldif"
+
+LDAP_DN ?= "dc=my-domain,dc=com"
+LDAP_DATADIR ?= "/etc/openldap-data/"
+
+OPENLDAP_LIBEXECDIR = "${libexecdir}"
+
+EXTRA_OECONF += "--libexecdir=${OPENLDAP_LIBEXECDIR}"
+
+do_install_append() {
+    install -D -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/openldap
+    sed -i -e 's/%DEFAULT_DN%/${LDAP_DN}/g' ${D}${sysconfdir}/init.d/openldap
+    sed -i -e 's#%LDAP_DATADIR%#${LDAP_DATADIR}#g' ${D}${sysconfdir}/init.d/openldap
+    # Base openldat bb installs slapd under ${sbin}
+    sed -i -e 's#%LIBEXEC%#${sbindir}#g' ${D}${sysconfdir}/init.d/openldap
+
+    # This is duplicated in /etc/openldap and is for slapd
+    rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
+    rm -rf "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+
+    # remove symlinks for backends, recreating in postinstall
+    rm -f ${D}/${OPENLDAP_LIBEXECDIR}/openldap/*.so
+
+    sed -i -e '/^include\s*/a \
+include         /etc/openldap/schema/cosine.schema \
+include         /etc/openldap/schema/nis.schema \
+include         /etc/openldap/schema/inetorgperson.schema \
+include         /etc/openldap/schema/misc.schema' \
+	${D}/etc/openldap/slapd.conf
+
+    sed -i -e '/^# Load dynamic backend modules:/a \
+modulepath      ${OPENLDAP_LIBEXECDIR}/openldap \
+moduleload      back_bdb.la' \
+	${D}/etc/openldap/slapd.conf
+
+    sed -i -e 's#^pidfile\s*.*$#pidfile ${LDAP_DATADIR}/slapd.pid#' ${D}/etc/openldap/slapd.conf
+    sed -i -e 's#^argsfile\s*.*$#argsfile ${LDAP_DATADIR}/slapd.args#' ${D}/etc/openldap/slapd.conf
+    sed -i -e 's#^directory\s*.*$#directory ${LDAP_DATADIR}/#' ${D}/etc/openldap/slapd.conf
+
+    sed -i -e 's/dc=my-domain,dc=com/${LDAP_DN}/g' ${D}/etc/openldap/slapd.conf
+
+    # modify access perms for ldap/authentication
+    sed -i -e '$a\
+\
+access to attrs=userPassword \
+        by self write \
+        by anonymous auth \
+        by * none \
+\
+access to * \
+        by self write \
+        by * read' \
+        ${D}/etc/openldap/slapd.conf
+
+    install -D -m 0644 ${WORKDIR}/ops-base.ldif ${D}/etc/openldap/ops-base.ldif
+    sed -i -e 's/dc=my-domain,dc=com/${LDAP_DN}/g' ${D}/etc/openldap/ops-base.ldif
+
+    mkdir ${D}/${LDAP_DATADIR}
+}
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "openldap"
+INITSCRIPT_PARAMS = "defaults"
+
+FILES_${PN} += "${OPENLDAP_LIBEXECDIR}/* ${sysconfdir}/openldap/ops-base.ldif"
+FILES_${PN}-dbg += "${OPENLDAP_LIBEXECDIR}/openldap/.debug ${OPENLDAP_LIBEXECDIR}/.debug"
diff --git a/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend b/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend
deleted file mode 100644
index 63f6064..0000000
--- a/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend
+++ /dev/null
@@ -1,73 +0,0 @@
-DEPEND_${PN} += "cyrus-sasl" 
-RDEPEND_${PN} += "libsasl2-modules"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-SRC_URI += "file://initscript"
-SRC_URI += "file://ops-base.ldif"
-
-LDAP_DN ?= "dc=my-domain,dc=com"
-LDAP_DATADIR ?= "/etc/openldap-data/"
-
-OPENLDAP_LIBEXECDIR = "${libexecdir}"
-
-EXTRA_OECONF += "--libexecdir=${OPENLDAP_LIBEXECDIR}"
-
-do_install_append() {
-    install -D -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/openldap
-    sed -i -e 's/%DEFAULT_DN%/${LDAP_DN}/g' ${D}${sysconfdir}/init.d/openldap
-    sed -i -e 's#%LDAP_DATADIR%#${LDAP_DATADIR}#g' ${D}${sysconfdir}/init.d/openldap
-    # Base openldat bb installs slapd under ${sbin}
-    sed -i -e 's#%LIBEXEC%#${sbindir}#g' ${D}${sysconfdir}/init.d/openldap
-
-    # This is duplicated in /etc/openldap and is for slapd
-    rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
-    rm -rf "${D}${localstatedir}/run"
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-
-    # remove symlinks for backends, recreating in postinstall
-    rm -f ${D}/${OPENLDAP_LIBEXECDIR}/openldap/*.so
-
-    sed -i -e '/^include\s*/a \
-include         /etc/openldap/schema/cosine.schema \
-include         /etc/openldap/schema/nis.schema \
-include         /etc/openldap/schema/inetorgperson.schema \
-include         /etc/openldap/schema/misc.schema' \
-	${D}/etc/openldap/slapd.conf
-
-    sed -i -e '/^# Load dynamic backend modules:/a \
-modulepath      ${OPENLDAP_LIBEXECDIR}/openldap \
-moduleload      back_bdb.la' \
-	${D}/etc/openldap/slapd.conf
-
-    sed -i -e 's#^pidfile\s*.*$#pidfile ${LDAP_DATADIR}/slapd.pid#' ${D}/etc/openldap/slapd.conf
-    sed -i -e 's#^argsfile\s*.*$#argsfile ${LDAP_DATADIR}/slapd.args#' ${D}/etc/openldap/slapd.conf
-    sed -i -e 's#^directory\s*.*$#directory ${LDAP_DATADIR}/#' ${D}/etc/openldap/slapd.conf
-
-    sed -i -e 's/dc=my-domain,dc=com/${LDAP_DN}/g' ${D}/etc/openldap/slapd.conf
-
-    # modify access perms for ldap/authentication
-    sed -i -e '$a\
-\
-access to attrs=userPassword \
-        by self write \
-        by anonymous auth \
-        by * none \
-\
-access to * \
-        by self write \
-        by * read' \
-        ${D}/etc/openldap/slapd.conf
-
-    install -D -m 0644 ${WORKDIR}/ops-base.ldif ${D}/etc/openldap/ops-base.ldif
-    sed -i -e 's/dc=my-domain,dc=com/${LDAP_DN}/g' ${D}/etc/openldap/ops-base.ldif
-
-    mkdir ${D}/${LDAP_DATADIR}
-}
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "openldap"
-INITSCRIPT_PARAMS = "defaults"
-
-FILES_${PN} += "${OPENLDAP_LIBEXECDIR}/* ${sysconfdir}/openldap/ops-base.ldif"
-FILES_${PN}-dbg += "${OPENLDAP_LIBEXECDIR}/openldap/.debug ${OPENLDAP_LIBEXECDIR}/.debug"
-- 
2.7.0


