Return-Path: <Dmitry_Eremin@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17BA4E009AD; Thu,  9 Apr 2015 13:01:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0553FE009A4
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 13:01:50 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIe6-0000eb-LN from Dmitry_Eremin@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Thu, 09 Apr 2015 13:01:50 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:01:49 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 9 Apr 2015 23:01:46 +0300
Message-ID: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/3] libvirt: correct libcap-ng options
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
X-List-Received-Date: Thu, 09 Apr 2015 20:01:55 -0000
Content-Type: text/plain

Fix the following warning by passing correct option to configure script:

WARNING: QA Issue: libvirt: configure was passed unrecognised options:
--with-capnp [unknown-configure-option]

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-extended/libvirt/libvirt_1.2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.12.bb b/recipes-extended/libvirt/libvirt_1.2.12.bb
index dca2d1b..2e0dfea 100644
--- a/recipes-extended/libvirt/libvirt_1.2.12.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.12.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iprou
 PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
 PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[libcap-ng] = "--with-capnp,--without-capng,libcap-ng,"
+PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
2.1.4


