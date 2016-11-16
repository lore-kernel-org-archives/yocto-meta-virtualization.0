Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D96B1E00C3E; Wed, 16 Nov 2016 11:56:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 893B5E00712
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Nov 2016 11:56:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAGJuVIb007731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Nov 2016 11:56:31 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 11:56:30 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Wed, 16 Nov 2016 14:56:29 -0500
Message-ID: <1479326189-19985-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] libvirt: add 'wireshark' packageconfig
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
X-List-Received-Date: Wed, 16 Nov 2016 19:56:37 -0000
Content-Type: text/plain

libvirt by default has '--with-wireshark-dissector' set to
'check'. Therefor if wireshark is built before vs after libvirt this
will result in a potentially unexpected difference in how libvirt is
configured. Additionally the build of libvirt with wireshark
capabilities enabled is currently broken and thus if attempted will
result in the error:

fatal error: ws_symbol_export.h: No such file or directory

To prevent the random configuration of libvirt with respect to
wireshark we add a new packageconfig for wireshark.

NOTE that the wireshark recipe is currently incomplete so this new
packageconfig will result in a build failure if used, until wireshark
is updated to build libwsutil.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index fad5632..c848c99 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -208,6 +208,7 @@ PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
 PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
+PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-dissector,wireshark libwsutil,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
2.7.4


