Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C1F7E00FB8; Fri,  2 Oct 2015 06:51:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4AE6AE00F97
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:51:04 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 2 Oct 2015
	15:51:02 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Oct 2015 15:50:53 +0200
Message-ID: <1443793858-17763-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
References: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 1/6] python-jsonpointer: inherit setuptools instead of distutils
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
X-List-Received-Date: Fri, 02 Oct 2015 13:51:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

setup.py for this pkg uses setuptools, not distutils:
"from setuptools import setup"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
index d7b976b..14d38fd 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
@@ -14,4 +14,4 @@ SRC_URI[sha256sum] = "46b2016b5e4f2b5cd2edf07c60ca8fe7dd91204ca848f98964be61b3c4
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
-- 
1.9.1


