Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2256E009C2; Mon, 13 Aug 2018 21:42:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6245E00948
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 21:42:22 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7E4gMaG009897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 21:42:22 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 21:42:15 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 14 Aug 2018 12:52:47 +0800
Message-ID: <1534222367-14053-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: add runtime depends for util-linux-getopt
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
X-List-Received-Date: Tue, 14 Aug 2018 04:42:24 -0000
Content-Type: text/plain

When runing:

    lxc-create -t download -n test

The system reports that the getopt command can't find. This is because
the lxc-download template depends on getopt command. So add the runtime
depends on util-linux-getopt for lxc.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-containers/lxc/lxc_3.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_3.0.1.bb b/recipes-containers/lxc/lxc_3.0.1.bb
index a77dd09..d4bfd92 100644
--- a/recipes-containers/lxc/lxc_3.0.1.bb
+++ b/recipes-containers/lxc/lxc_3.0.1.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = " \
 		gnutls \
 		nettle \
 		util-linux-mountpoint \
+		util-linux-getopt \
 "
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
-- 
2.7.4


