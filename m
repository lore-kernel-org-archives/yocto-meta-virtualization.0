Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00041E009E2; Mon, 11 May 2015 19:09:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 746A9E00477
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 May 2015 19:09:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C29QGE017962
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 May 2015 19:09:26 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 11 May 2015 19:09:25 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 12 May 2015 10:09:22 +0800
Message-ID: <1431396562-12021-3-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1431396562-12021-1-git-send-email-jackie.huang@windriver.com>
References: <1431396562-12021-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python-django: fix the incorrect checksum
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
X-List-Received-Date: Tue, 12 May 2015 02:09:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-django_1.7.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb b/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
index 36302fd..7913025 100644
--- a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
@@ -2,16 +2,15 @@ DESCRIPTION = "A high-level Python Web framework"
 HOMEPAGE = "http://www.djangoproject.com/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-PR = "r1"
 SRCNAME = "Django"
 
 SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "e33355ee4bb2cbb4ab3954d3dff5eddd"
-SRC_URI[sha256sum] = "6ae69c1dfbfc9d0c44ae80e2fbe48e59bbbbb70e8df66ad2b7029bd39947d71d"
+SRC_URI[md5sum] = "e76c70a5dd7d56a511974b28ab38df20"
+SRC_URI[sha256sum] = "1c391f9349c97df503dac3461599f24235e4d04393498e6060e74dd2721460bc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


