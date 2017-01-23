Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21943E00823; Mon, 23 Jan 2017 13:40:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_SPAM
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [192.103.53.11 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDC8BE007CE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:45 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0NLejRA002247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:45 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:40:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:40:40 -0500
Message-ID: <1485207640-8893-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-oslo.service: correct PV
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
X-List-Received-Date: Mon, 23 Jan 2017 21:40:47 -0000
Content-Type: text/plain

Mistakenly had 0.16.0 instead of 1.16.0.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-oslo.service_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
index a1e5e1a..f754444 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "0.16.0"
+PV = "1.16.0"
 SRCREV = "e11a2880777249674664ec330004fda5e605ac73"
 
 SRCNAME = "oslo.service"
-- 
2.7.4


