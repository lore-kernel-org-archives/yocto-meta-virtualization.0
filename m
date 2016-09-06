Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAD0CE00D44; Tue,  6 Sep 2016 09:35:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DFBAE00D35
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Sep 2016 09:35:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u86GZNeO007770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 6 Sep 2016 09:35:29 -0700
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 6 Sep 2016 09:35:27 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Sep 2016 11:33:20 -0500
Message-ID: <1473179600-29301-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] go-distribution-digest: Fix do_package failure
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
X-List-Received-Date: Tue, 06 Sep 2016 16:35:35 -0000
Content-Type: text/plain

The rule in the recipe which deletes all but LICENSE and the digest
directory is broken depending on what ascii table bash uses by
default for matching, specifically:

    rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*

The "A-K" piece will actually match both upper and lower case when the
acsii because the ascii value is checked as being between two numbers:
   0x41=a, 0x42=A,0x43=b...0x48=D

This is contray to what you would typically think should work with the
lower and uppers separated into two contiguous spaces.  To fix this,
instead of using the "rm" logic, we can copy the components we need
instead.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go/go-distribution-digest_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes-devtools/go/go-distribution-digest_git.bb b/recipes-devtools/go/go-distribution-digest_git.bb
index 31d724c..2a803da 100644
--- a/recipes-devtools/go/go-distribution-digest_git.bb
+++ b/recipes-devtools/go/go-distribution-digest_git.bb
@@ -13,15 +13,13 @@ SRCREV = "d957768537c5af40e4f4cd96871f7b2bde9e2923"
 
 S = "${WORKDIR}/git"
 
-do_unpackpost() {
-	rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*
+# NO-OP the do compile rule because this recipe is source only.
+do_compile() {
 }
 
-addtask unpackpost after do_unpack before do_patch
-
 do_install() {
 	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/LICENSE ${S}/digest ${D}${prefix}/local/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
-- 
1.9.1


