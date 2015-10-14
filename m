Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 266CFE00C36; Tue, 13 Oct 2015 18:06:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD8A4E00A38
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 18:06:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9E16X2t023475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 18:06:33 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 18:06:32 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 13 Oct 2015 21:06:32 -0400
Message-ID: <1444784792-19233-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-cloud-services] dhcp: bbappend to use PN
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
X-List-Received-Date: Wed, 14 Oct 2015 01:06:37 -0000
Content-Type: text/plain

From: Vu Tran <vu.tran@windriver.com>

Fix the following warning:

WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient
${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf
${base_sbindir}/dhclient-systemd-wrapper) replaces original key
FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks).

Signed-off-by: Vu Tran <vu.tran@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/dhcp/dhcp_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
index a23f7c9..7466056 100644
--- a/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -12,5 +12,5 @@ do_install_append () {
 
 }
 
-FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
+FILES_${PN}-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
                      "
-- 
2.1.4


