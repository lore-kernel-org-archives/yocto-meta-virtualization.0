Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADEB7E00C1B; Thu, 26 Nov 2015 07:47:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 15B89E00AF6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:43 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:42 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:21 +0100
Message-ID: <1448552846-24382-9-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 08/13] python-warlock: upgrade to 1.1.0
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb
rename to meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
index babd0f5..49f1390 100644
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://README.md;md5=97b002bcda83d22e7d3fd1427688a6a6"
 
 DEPENDS += "python-jsonschema python-jsonpatch"
 
-PR = "r0"
 SRCNAME = "warlock"
 
 SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a0096d4843da1f939c873460b53c02e0"
-SRC_URI[sha256sum] = "986ccfd647f89c1c8e7ebe40d159e5633818a58754b3ffdf51c4816927977791"
+SRC_URI[md5sum] = "79649fd8096eeb0c175a193f06237676"
+SRC_URI[sha256sum] = "bbfb4279034ccc402723e38d2a2e67cd619988bf4802fda7ba3e8fab15762651"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


