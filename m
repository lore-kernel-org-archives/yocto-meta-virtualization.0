Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E87D7E00B31; Tue, 11 Sep 2018 02:48:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 917D9E00A85
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 02:48:11 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8B9mBCH011217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 02:48:11 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Sep 2018 02:48:10 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Sep 2018 17:48:09 +0800
Message-ID: <1536659289-356263-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] lxc: Make named avoid listening on lxc network interface
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
X-List-Received-Date: Tue, 11 Sep 2018 09:48:11 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

lxc-net wants to take care of DNS itself using dnsmasq, while named in
bind does the same thing on all network interfaces by default and causes
the following error.

dnsmasq: failed to create listening socket for 10.0.3.1: Address already in use
Failed to setup lxc-net.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-core/bind/bind_%.bbappend         | 1 +
 recipes-core/bind/bind_virtualization.inc | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 recipes-core/bind/bind_%.bbappend
 create mode 100644 recipes-core/bind/bind_virtualization.inc

diff --git a/recipes-core/bind/bind_%.bbappend b/recipes-core/bind/bind_%.bbappend
new file mode 100644
index 0000000..617cacc
--- /dev/null
+++ b/recipes-core/bind/bind_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
new file mode 100644
index 0000000..b8f0b3f
--- /dev/null
+++ b/recipes-core/bind/bind_virtualization.inc
@@ -0,0 +1,4 @@
+# Tell named not to bother listening on the IP address that lxc handles itself.
+do_install_append() {
+	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc would take care of this address itself\n\tlisten-on { ! 10.0.3.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
+}
-- 
2.7.4


