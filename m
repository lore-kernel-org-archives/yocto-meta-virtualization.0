Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5659FE0095C; Mon,  3 Sep 2018 19:58:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51362E00805
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Sep 2018 19:58:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w842w8WG019406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Sep 2018 19:58:09 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 19:58:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 4 Sep 2018 10:47:49 +0800
Message-ID: <1536029271-11750-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
References: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] nagios-plugins: add recipe with latest stable version 2.2.1
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
X-List-Received-Date: Tue, 04 Sep 2018 02:58:11 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-plugins_2.2.1.bb | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-plugins_2.2.1.bb

diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
new file mode 100644
index 0000000..0793365
--- /dev/null
+++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
@@ -0,0 +1,73 @@
+require nagios-common.inc
+
+DESCRIPTION = "A host/service/network monitoring and management system plugins"
+HOMEPAGE = "http://www.nagios-plugins.org"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "fb521d5c05897f165b0b1862c1e5cb27"
+SRC_URI[sha256sum] = "647c0ba4583d891c965fc29b77c4ccfeccc21f409fdf259cb8af52cb39c21e18"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit autotools gettext
+
+EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_HOST} \
+                 --with-nagios-user=${NAGIOS_USER} \
+                 --with-nagios-group=${NAGIOS_GROUP} \
+                 --without-apt-get-command \
+                 --with-trusted-path=/bin:/sbin:/usr/bin:/usr/sbin \
+                 ac_cv_path_PERL=${bindir}/perl \
+"
+
+# IPv6
+PACKAGECONFIG[ipv6] = "--with-ipv6,--without-ipv6,,"
+
+# Enable check_ldaps, check_http --ssl, check_tcp --ssl
+PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_DIR_HOST},--without-openssl,openssl,libssl"
+
+# Enable check_ldaps
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+
+# Enable check_smtp --starttls
+PACKAGECONFIG[gnutls] = "--with-gnutls=${STAGING_DIR_HOST},--without-gnutls,gnutls,gnutls"
+
+# Enable check_pgsql
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_HOST},--without-pgsql,postgresql,libpq"
+
+# Enable check_mysql, check_mysql_query
+PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_HOST},--without-mysql,mysql5,libmysqlclient"
+
+# Enable check_snmp
+PACKAGECONFIG[snmp] = "\
+    --with-snmpget-command=${bindir}/snmpget --with-snmpgetnext-command=${bindir}/snmpgetnext, \
+    --without-snmpget-command --without-snmpgetnext-command, \
+    , net-snmp-utils \
+"
+
+PACKAGECONFIG ??= "ssl gnutls"
+
+do_configure() {
+    oe_runconf || die "make failed"
+}
+
+do_install_append() {
+     sed -i '1s,#! /usr/bin/perl -w.*,#! ${bindir}/env perl,' ${D}${libdir}/nagios/plugins/*
+}
+
+RDEPENDS_${PN} += "\
+    iputils \
+    nagios-base \
+    perl \
+    bash \
+"
+
+FILES_${PN} += "${datadir} \
+                ${NAGIOS_PLUGIN_DIR} \
+"
-- 
2.7.4


