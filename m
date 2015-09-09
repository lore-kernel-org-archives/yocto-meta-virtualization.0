Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5748EE00CEF; Wed,  9 Sep 2015 06:41:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D2842E00ABE
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Sep 2015 06:41:34 -0700 (PDT)
Received: from iapetus.enea.se (172.16.140.43) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Sep 2015 15:41:33 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 9 Sep 2015 15:41:33 +0200
Message-ID: <1441806093-6926-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [juno/dizzy-juno][PATCH] python-django-appconf: use correct hashes
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
X-List-Received-Date: Wed, 09 Sep 2015 13:41:38 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb b/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
index f406708..4ed2392 100644
--- a/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
@@ -10,8 +10,8 @@ SRCNAME = "django-appconf"
 SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "40494042c3c8bd1e054c884e5ed4bb6c"
-SRC_URI[sha256sum] = "a88ed8fb923a53c70c2c46fbe4508b5f81646b4b01401f1568a821671b33215c"
+SRC_URI[md5sum] = "6971f6c9df6b5213797578fecc1845d7"
+SRC_URI[sha256sum] = "06b64baf26c7a436cbb81464e7a50047aea30db1059dbe6e09dc443efa23ba20"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


