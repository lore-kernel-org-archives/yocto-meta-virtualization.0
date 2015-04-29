Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D52F9E00A31; Tue, 28 Apr 2015 20:09:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95ED7E009D8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39Mk4009394
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:22 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:22 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:34 +0800
Message-ID: <1abe5c4c9971253ffdae9e0bf4ce80676293e85b.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 24/55] python-oslo.i18n: upgrade to 1.6.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-oslo.i18n_1.4.0.bb => python-oslo.i18n_1.6.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.4.0.bb => python-oslo.i18n_1.6.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
index fa710d0..fee2948 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
 
 SRCNAME = "oslo.i18n"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "afd0a3394785b1b37959c1384129a554"
-SRC_URI[sha256sum] = "a3d64e8d2b4235a457da2c6269d8c97e867a90ba7d938fe0ed3cfc792c8c87bb"
+SRC_URI[md5sum] = "c109e20b99bb0ec8d85a583bf503e6a5"
+SRC_URI[sha256sum] = "29be916f3f4c79cca76d57e604a187b3020354a2ca89d486647b79d8a9adbb9e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


