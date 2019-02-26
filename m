Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EBC6E00D01; Tue, 26 Feb 2019 00:49:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DB1FE00CEE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 00:49:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1Q8n37t006353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 00:49:03 -0800 (PST)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 26 Feb 2019 00:49:02 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 26 Feb 2019 17:08:01 +0800
Message-ID: <1551172081-8808-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] criu: fix host gcc can't recognized option -fmacro-prefix-map
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
X-List-Received-Date: Tue, 26 Feb 2019 08:49:07 -0000
Content-Type: text/plain

Generally, our host gcc version below 8.0, but cross toolchain in yocto
above 8.0, now 8.3, the option "macro-prefix-map" coming from 8.0, so if
the host gcc below 8.0, it can't unrecognized the option "macro-prefix-map".

In criu source code, the HOSTCFLAGS coming from CFLAGS:
    https://github.com/checkpoint-restore/criu/blob/criu-dev/Makefile#L17
In yocto project, the CFLAGS coming from the cross toolchain, containing
the "-fmacro-prefix-map" default, so we should use the BUILD_CFLAGS, it
contains the flags that used for host building.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 45195ea..01c3b94 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -55,6 +55,9 @@ export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
 export BUILD_SYS
 export HOST_SYS
 
+HOSTCFLAGS = "${BUILD_CFLAGS}"
+export HOSTCFLAGS
+
 inherit setuptools
 
 PACKAGECONFIG ??= ""
-- 
2.7.4


