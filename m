Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0276BE00ADD; Mon,  4 Jan 2016 07:23:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 780C2E00ADD
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 07:23:43 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 Jan 2016 16:23:41 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 4 Jan 2016 16:23:35 +0100
Message-ID: <1451921019-16491-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
References: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 1/5] python-taskflow: upgrade to 0.7.1 (kilo)
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
X-List-Received-Date: Mon, 04 Jan 2016 15:23:46 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-taskflow_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
index 287a311..376c290 100644
--- a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
@@ -4,14 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-PR = "r0"
-
 SRC_URI = "\
-	git://git.openstack.org/openstack/taskflow.git;branch=master \
+	git://git.openstack.org/openstack/taskflow.git;branch=stable/kilo \
 	"
 
-PV="0.2+git${SRCPV}"
-SRCREV="8800572da240b1f1856898952ce804936dafe49f"
+PV="0.7.1+git${SRCPV}"
+SRCREV="28bece7c7c97199b8d941b16865c3670c323589a"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -30,4 +28,6 @@ RDEPENDS_${PN} += " \
         python-babel \
         python-stevedore \
         python-futures \
+        python-oslo.utils \
+        python-oslo.serialization \
 	"
-- 
2.5.0


