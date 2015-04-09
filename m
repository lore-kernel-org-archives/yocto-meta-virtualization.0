Return-Path: <Dmitry_Eremin@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BBFAE009A1; Thu,  9 Apr 2015 13:01:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05232E009A3
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 13:01:51 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIe7-0000eb-7e from Dmitry_Eremin@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Thu, 09 Apr 2015 13:01:51 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:01:50 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 9 Apr 2015 23:01:47 +0300
Message-ID: <1428609708-15379-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
References: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] lxc: include systemd files into lxc-setup
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

lxc-setup package accumulates all initscripts, so it should also include
systemd service files.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-containers/lxc/lxc_1.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index c9eef75..1c70958 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -72,6 +72,7 @@ RDEPENDS_${PN}-templates += "bash"
 
 FILES_${PN}-setup += "/etc/tmpfiles.d"
 FILES_${PN}-setup += "/lib/systemd/system"
+FILES_${PN}-setup += "/usr/lib/systemd/system"
 FILES_${PN}-setup += "/etc/init.d"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
-- 
2.1.4


