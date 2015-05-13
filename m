Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6998DE00820; Wed, 13 May 2015 00:24:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9175CE004F6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:38 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7ObYU008836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:38 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:37 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:25 +0800
Message-ID: <5f1fd58557e880e36b9b87b0ac4d222eca40b547.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431501591.git.jackie.huang@windriver.com>
References: <cover.1431501591.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] python-routes: add rdepends on python-repoze.lru
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
X-List-Received-Date: Wed, 13 May 2015 07:24:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add the missing rdepends on python-repoze.lru or it will fail with:

  File "/usr/lib64/python2.7/site-packages/routes/mapper.py", line 5, in <module>
    from repoze.lru import LRUCache
  ImportError: No module named repoze.lru

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-routes_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-routes_2.1.bb b/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
index dbf6e17..ad459c7 100644
--- a/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
@@ -15,4 +15,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-
+RDEPENDS_${PN} += "python-repoze.lru"
-- 
1.9.1


