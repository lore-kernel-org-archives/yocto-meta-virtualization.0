Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A2C1E00A9A; Tue, 28 Apr 2015 20:10:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42EABE009E5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39gdb000076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:43 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:42 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:52 +0800
Message-ID: <2756dace6c1437f71eef489a96f9f0d8d15e6a91.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 42/55] python-tempita: upgrade to 0.5.3dev
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-tempita_0.5.1.bb => python-tempita_0.5.3dev.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tempita_0.5.1.bb => python-tempita_0.5.3dev.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-tempita_0.5.1.bb b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-tempita_0.5.1.bb
rename to meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
index 63d5dd1..6059ff0 100644
--- a/meta-openstack/recipes-devtools/python/python-tempita_0.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A very small text templating language"
 HOMEPAGE = "http://pythonpaste.org/tempita/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=29;endline=29;md5=76f61a7d8ab2ed53293639c86c95ad4b"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=33;endline=33;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-PR = "r0"
 SRCNAME = "Tempita"
 
 SRC_URI = "https://pypi.python.org/packages/source/T/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f75bdfeabd2f3755f1ff32d582a574a4"
-SRC_URI[sha256sum] = "0ebe6938ca7401db79bac279849fffcb5752029150bcb6f3c3edbe7aa9a077d8"
+SRC_URI[md5sum] = "365c3b4f36435e2178902d5619301140"
+SRC_URI[sha256sum] = "38392bb708a10128419f75fa9120a6d2c8d137013b353968e5008a77a5c7a2ca"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


