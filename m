Return-Path: <Fupan.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0751EE003E1; Wed,  4 Jan 2017 17:26:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7654E003C1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 17:26:17 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v051QGnN029791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Jan 2017 17:26:16 -0800
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 4 Jan 2017 17:26:15 -0800
From: <fupan.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Jan 2017 17:26:15 -0800
Message-ID: <20170105012615.68784-1-fupan.li@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] lxc: add rdepends to initscripts
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
X-List-Received-Date: Thu, 05 Jan 2017 01:26:21 -0000
Content-Type: text/plain

From: fli <fupan.li@windriver.com>

lxc's postinst will run populate-volatile.sh scripts,
which is provided by initscripts package, thus it's better
to add this rdepends.

Signed-off-by: fli <fupan.li@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 53068a8..26c9e1d 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -10,6 +10,7 @@ RDEPENDS_${PN} = " \
 		libcap-bin \
 		bridge-utils \
 		dnsmasq \
+		initscripts \
 		perl-module-strict \
 		perl-module-getopt-long \
 		perl-module-vars \
-- 
2.9.3


