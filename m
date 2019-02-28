Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 571E2E00C1B; Wed, 27 Feb 2019 17:09:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0024E007B3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 17:09:04 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S194Oq011017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 17:09:04 -0800 (PST)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 17:09:03 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 28 Feb 2019 09:28:08 +0800
Message-ID: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] criu: fix host gcc can't recognized option -fmacro-prefix-map
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
X-List-Received-Date: Thu, 28 Feb 2019 01:09:05 -0000
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
 recipes-containers/criu/criu_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 45195ea..123f6a3 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -54,6 +54,7 @@ export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
 
 export BUILD_SYS
 export HOST_SYS
+export HOSTCFLAGS = "${BUILD_CFLAGS}"
 
 inherit setuptools
 
-- 
2.7.4


