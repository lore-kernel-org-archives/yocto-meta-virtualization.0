Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37E5BE00405; Mon, 30 Jan 2017 09:07:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEF6CE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 09:07:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0UH7uw7007501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 09:07:56 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 09:07:55 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 30 Jan 2017 12:07:50 -0500
Message-ID: <1485796070-30279-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-netaddr: switch to setuptools
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
X-List-Received-Date: Mon, 30 Jan 2017 17:07:59 -0000
Content-Type: text/plain

The uprev done in commit 0f9fb18e1883 didn't take into account that
upstream moved to use setuptools (see upstream commit a8509c0c7c4c
[cleaned up of older conventions and switched to setuptools]). Switch
to setup tools to match this upstream change. This will fix errors
seen when attempting to 'import netaddr'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
index 8284d20..d3d83a1 100644
--- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c77
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
-- 
2.7.4


