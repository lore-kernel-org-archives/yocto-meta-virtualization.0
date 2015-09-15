Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7647E00D4B; Tue, 15 Sep 2015 06:45:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD01DE00B7D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:45:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FDjaAr000520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:45:36 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 06:45:36 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 15 Sep 2015 09:45:34 -0400
Message-ID: <1442324736-15011-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 1/3] dnsmasq: move bbappend to use a wilcard
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
X-List-Received-Date: Tue, 15 Sep 2015 13:45:40 -0000
Content-Type: text/plain

To facilitate future support and to simplify using meta-cloud-services
with other branches we prefer to use a wildcard. In making this move
the content of the bbappend has been audited and most of the content
is now no longer needed (it is found in dnsmasq.inc for some time now)
and so we are removing these parts.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../dnsmasq/{dnsmasq_2.72.bbappend => dnsmasq_2.%.bbappend}          | 5 -----
 1 file changed, 5 deletions(-)
 rename meta-openstack/recipes-support/dnsmasq/{dnsmasq_2.72.bbappend => dnsmasq_2.%.bbappend} (51%)

diff --git a/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend b/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
similarity index 51%
rename from meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend
rename to meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
index 52eab54..0c979fe 100644
--- a/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend
+++ b/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
@@ -1,9 +1,4 @@
 do_install_append() {
-    cd ${S}/contrib/wrt
-    oe_runmake
-
-    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
-
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 }
-- 
2.1.4


