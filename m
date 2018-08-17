Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D73B3E0086B; Fri, 17 Aug 2018 13:43:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DA21E00828
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Aug 2018 13:43:36 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7HKhZob018487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Aug 2018 13:43:35 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 17 Aug 2018 13:43:34 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 17 Aug 2018 16:43:27 -0400
Message-ID: <1534538608-15231-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libvirt: fixup ptest to prevent attempts to build tests on the target
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
X-List-Received-Date: Fri, 17 Aug 2018 20:43:36 -0000
Content-Type: text/plain

Oddly something seems to have changed since I did the uprev of libvirt
to v4.3.0. Previously using the 'run-ptests' script would only run the
tests and not attempt to build them first. In preparation for the
uprev to v4.5.0 I attempted to run the tests and found that they would
fail to run and instead the tests were attempting to be built. I
suspect this change is caused by an uprev of autotools and the
handling of the 'TESTS' built-in.

To prevent this we are explicitly using the '--with-test-suite'
configure option and this return the previously observed behavior,
where the tests are simply run and not built.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index 194f049..bb4a256 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -290,6 +290,7 @@ do_install_append() {
 
 EXTRA_OECONF += " \
     --with-init-script=systemd \
+    --with-test-suite \
     "
 
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
-- 
2.7.4


