Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2132E00D86; Thu, 25 Jul 2019 22:36:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBB82E00C87
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 22:36:26 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q5aPTF013386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 22:36:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 25 Jul 2019 22:36:12 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Fri, 26 Jul 2019 13:36:11 +0800
Message-ID: <1564119371-297091-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] python-dateutil: Remove the bbappend
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
X-List-Received-Date: Fri, 26 Jul 2019 05:36:28 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

The current bbappend only has below logic:
CLEANBROKEN = "1"

For python-dateutil, the distutils class is about to
do a clean via "setup.py clean" as below logic in distutils
class without CLEANBROKE = "1":
distutils_do_configure() {
        if [ "${CLEANBROKEN}" != "1" ] ; then
                NO_FETCH_BUILD=1 \
                ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean ${DISTUTILS_BUILD_ARGS}
        fi
}

But it works for python-dateutil, no need to set
CLEANBROKEN, so remove this bbappend.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 recipes-devtools/python/python-dateutil_%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 recipes-devtools/python/python-dateutil_%.bbappend

diff --git a/recipes-devtools/python/python-dateutil_%.bbappend b/recipes-devtools/python/python-dateutil_%.bbappend
deleted file mode 100644
index 68409e5..0000000
--- a/recipes-devtools/python/python-dateutil_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-CLEANBROKEN = "1"
-- 
2.7.4


