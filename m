Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0D0CE00C1F; Thu, 10 Sep 2015 02:15:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 36882E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 02:15:50 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 10 Sep 2015 11:15:45 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 10 Sep 2015 11:15:45 +0200
Message-ID: <1441876545-29061-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [fido-kilo][PATCH] dhcp: fix QA issue files installed but not shipped
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
X-List-Received-Date: Thu, 10 Sep 2015 09:15:53 -0000
Content-Type: text/plain

The value of FILES set in this bbappend was overriden after
bitbake expanded it from the value set in the recipe.
This patch solves this issue:

WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
ERROR: QA Issue: dhcp: Files/directories were installed but not shipped
  /etc/dhcp/dhclient-exit-hooks [installed-vs-shipped]
WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 recipes-connectivity/dhcp/dhcp_%.bbappend | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
index a23f7c9..2babae9 100644
--- a/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -12,5 +12,6 @@ do_install_append () {
 
 }
 
-FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
-                     "
+FILES_${PN}-client += " \
+	${sysconfdir}/dhcp/dhclient-exit-hooks \
+	"
-- 
1.9.1


