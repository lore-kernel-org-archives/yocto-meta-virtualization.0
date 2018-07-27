Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9C1CE0049F; Fri, 27 Jul 2018 12:45:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 607EAE0049F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jul 2018 12:45:41 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6RJjec8005293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jul 2018 12:45:40 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 27 Jul 2018 12:45:39 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 27 Jul 2018 12:45:39 -0700
Message-ID: <20180727194539.88054-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][PATCH 1/1] libvirt: use relative path to local .m4 files
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
X-List-Received-Date: Fri, 27 Jul 2018 19:45:41 -0000
Content-Type: text/plain

If our project is in a directory with a pathname of longer than
about 125 characters, configuration will fail with an "Argument
list too long" error.  This patch uses the technique that was applied
to the coreutils recipe.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index e6dac5d..194f049 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -42,6 +42,12 @@ SRC_URI[libvirt.sha256sum] = "a531e22c8b985ecb2d1223b913fd6ec0f1800e3ebe02351924
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
+# Override the default set in autotools.bbclass so that we will use relative pathnames
+# to our local m4 files.  This prevents an "Argument list too long" error during configuration
+# if our project is in a directory with an absolute pathname of more than about 125 characters.
+#
+acpaths = "-I ./m4"
+
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
 ac_cv_path_AUGPARSE=/usr/bin/augparse \
-- 
2.7.4


