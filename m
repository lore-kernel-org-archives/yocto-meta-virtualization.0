Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0122EE00BBD; Tue,  8 Dec 2015 09:34:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7D527E00B97
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:21 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:20 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:27 +0100
Message-ID: <1449596034-8308-16-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 15/42] python-jsonpatch: upgrade 1.9 -> 1.11
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:35 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.9.bb b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-jsonpatch_1.9.bb
rename to meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
index 24c87b0..3d9f058 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
@@ -9,8 +9,8 @@ SRCNAME = "jsonpatch"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5eee76359052a1c289cf61eaf037332d"
-SRC_URI[sha256sum] = "e997076450992aa7af2f4ae6c3e7767d390ddb6746979c74fd2092bb8fbdf5b2"
+SRC_URI[md5sum] = "9f2d0aa31f99cc97089a203c5bed3924"
+SRC_URI[sha256sum] = "22d0bc0f5522a4a03dd9fb4c4cdf7c1f03256546c88be4c61e5ceabd22280e47"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


