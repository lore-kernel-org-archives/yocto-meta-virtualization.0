Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14139E00C28; Thu,  3 Jan 2019 13:23:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52BA6E00C10
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Jan 2019 13:23:12 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x03LMpij005082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 3 Jan 2019 13:23:01 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 3 Jan 2019 13:22:40 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 3 Jan 2019 16:22:36 -0500
Message-ID: <1546550556-25294-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: uprev from 3.0.3 to 3.1.0
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
X-List-Received-Date: Thu, 03 Jan 2019 21:23:13 -0000
Content-Type: text/plain

Minor updates and fixes. Improved ptest results per below.

    root@cube-essential:/usr/lib64/lxc/ptest# ./run-ptest
    ### Starting LXC ptest ###
    FAIL: lxc-test-api-reboot
    SKIPPED: lxc-test-apparmor
    PASS: lxc-test-attach
    PASS: lxc-test-automount
    PASS: lxc-test-autostart
    PASS: lxc-test-basic
    PASS: lxc-test-cgpath
    PASS: lxc-test-cloneconfig
    PASS: lxc-test-clonetest
    PASS: lxc-test-concurrent
    PASS: lxc-test-config-jump-table
    PASS: lxc-test-console
    PASS: lxc-test-console-log
    PASS: lxc-test-containertests
    PASS: lxc-test-createconfig
    PASS: lxc-test-createtest
    PASS: lxc-test-criu-check-feature
    PASS: lxc-test-destroytest
    PASS: lxc-test-device-add-remove
    PASS: lxc-test-get_item
    PASS: lxc-test-getkeys
    PASS: lxc-test-list
    PASS: lxc-test-locktests
    PASS: lxc-test-lxcpath
    PASS: lxc-test-may-control
    PASS: lxc-test-mount-injection
    PASS: lxc-test-no-new-privs
    PASS: lxc-test-parse-config-file
    PASS: lxc-test-raw-clone
    PASS: lxc-test-reboot
    PASS: lxc-test-rootfs
    PASS: lxc-test-saveconfig
    PASS: lxc-test-share-ns
    PASS: lxc-test-shortlived
    SKIPPED: lxc-test-shutdowntest
    PASS: lxc-test-snapshot
    PASS: lxc-test-startone
    SKIPPED: lxc-test-state-server
    PASS: lxc-test-utils

    Results:
        PASSED = 35
        FAILED = 1
        SKIPPED = 3
        (for details check individual test log in ./logs directory)

    ### LXC ptest complete ###

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/{lxc_3.0.3.bb => lxc_3.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_3.0.3.bb => lxc_3.1.0.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_3.0.3.bb b/recipes-containers/lxc/lxc_3.1.0.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_3.0.3.bb
rename to recipes-containers/lxc/lxc_3.1.0.bb
index f3924e4..9dba76b 100644
--- a/recipes-containers/lxc/lxc_3.0.3.bb
+++ b/recipes-containers/lxc/lxc_3.1.0.bb
@@ -48,8 +48,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "0aa1a982f7dfa4c7b8ce87b7047b0b6e"
-SRC_URI[sha256sum] = "620cb832cc02c63bf4d330657bf6176544e145da281ee384a34d689635a19841"
+SRC_URI[md5sum] = "e83e302a801494276f3772e687a3b8b0"
+SRC_URI[sha256sum] = "4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.7.4


