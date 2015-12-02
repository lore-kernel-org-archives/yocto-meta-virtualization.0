Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D59FFE00C4D; Wed,  2 Dec 2015 08:34:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 00B74E00947
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:44 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:43 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:42 +0100
Message-ID: <1449073966-29707-37-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 36/40] python-horizon: upgrade to 2015.1.2
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:26 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-horizon_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index b7c0046..779878d 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -62,10 +62,9 @@ RDEPENDS_${PN} += " python-django \
     python-django-pyscss \
     "
 
-PR = "r3"
 SRCNAME = "horizon"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
     file://horizon.init \
     file://fix_bindir_path.patch \
     file://openstack-dashboard-apache.conf \
@@ -73,8 +72,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://horizon-use-full-package-path-to-test-directories.patch \
     "
 
-SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
-PV = "2015.1.0+git${SRCPV}p1"
+SRCREV = "bccc3dcba65275e099137c8ca37f1077e87120d5"
+PV = "2015.1.2+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d python-dir default_configs openstackchef monitor
-- 
2.1.0


