Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E834E00A93; Mon, 30 Sep 2019 08:46:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 390D6E00790
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2019 08:46:07 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8UFk5SQ021717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2019 08:46:06 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 30 Sep 2019 08:46:05 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 30 Sep 2019 11:45:58 -0400
Message-ID: <20190930154558.31698-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libvirt: fixup multiple shlib providers
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
X-List-Received-Date: Mon, 30 Sep 2019 15:46:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Build libvirt results in the follow warning:
ERROR: libvirt-5.5.0-r0 do_package: libvirt-ptest: Multiple shlib providers for libvirt-admin.so.0: libvirt, libvirt-ptest
(used by files: ./tmp/work/aarch64-overc-linux/libvirt/5.5.0-r0/packages-split/libvirt-ptest/usr/lib/libvirt/ptest/tools/virt-admin)
ERROR: libvirt-5.5.0-r0 do_package: libvirt: Multiple shlib providers for libvirt-admin.so.0: libvirt, libvirt-ptest
(used by files: ./tmp/work/aarch64-overc-linux/libvirt/5.5.0-r0/packages-split/libvirt/usr/bin/virt-admin)

This is caused by the introduction of a shlib provider check added to
openembedded-core (commit 61c413690034 [package: Multiple
shlib_providers for the same file should error]). You can see the
issue and solution discussed more here
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4628

Since the ptest version of the shared library will only be used by the
ptest package so we can use PRIVATE_LIBS to have the shlib providers
list.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
index de936c4..53f4b3e 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
@@ -357,6 +357,8 @@ EXTRA_OECONF += " \
 
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
 
+PRIVATE_LIBS_${PN}-ptest_append = "libvirt-admin.so.0"
+
 do_compile_ptest() {
 	oe_runmake -C tests buildtest-TESTS
 }
-- 
2.21.0


