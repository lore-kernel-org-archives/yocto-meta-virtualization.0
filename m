Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64BFCE00D0D; Wed,  3 Feb 2016 17:43:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C1C0E00CC9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gaNm000419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:37 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:36 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:40 -0500
Message-ID: <1454550104-7065-46-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 45/49] horizon: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:18 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../recipes-devtools/python/python-horizon_git.bb  | 119 +++++++++++----------
 1 file changed, 63 insertions(+), 56 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index cf62d44..2a96190 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -9,72 +9,79 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} += " python-django \
-    python-django-appconf \
-    python-django-compressor \
-    python-django-nose \
-    python-django-openstack-auth \
-    python-netaddr \
-    python-ceilometerclient \
-    python-cinderclient \
-    python-glanceclient \
-    python-heatclient \
-    python-keystoneclient \
-    python-troveclient \
-    python-saharaclient \
-    python-lesscpy \
-    python-novaclient \
-    python-nose-exclude \
-    python-neutronclient \
-    python-pytz \
-    python-pbr \
-    python-six \
-    python-swiftclient \
-    python-lockfile \
-    python-pyyaml \
-    python-pint \
-    python-xstatic \
-    python-xstatic-jquery \
-    python-xstatic-angular \
-    python-xstatic-angular-cookies \
-    python-xstatic-angular-mock \
-    python-xstatic-angular-bootstrap \
-    python-xstatic-angular-irdragndrop \
-    python-xstatic-angular-lrdragndrop \
-    python-xstatic-magic-search \
-    python-xstatic-d3 \
-    python-xstatic-hogan \
-    python-xstatic-jasmine \
-    python-xstatic-jquery-migrate \
-    python-xstatic-jquery-quicksearch \
-    python-xstatic-jquery-tablesorter \
-    python-xstatic-jsencrypt \
-    python-xstatic-qunit \
-    python-xstatic-rickshaw \
-    python-xstatic-spin \
-    python-xstatic-bootstrap-datepicker \
-    python-xstatic-bootstrap-scss \
-    python-xstatic-font-awesome \
-    python-xstatic-jquery-ui \
-    python-xstatic-smart-table \
-    python-xstatic-term.js \
-    python-pyscss \
-    python-django-pyscss \
-    "
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-babel \
+        python-django \
+        python-pint \
+        python-django-babel \
+        python-django-compressor \
+        python-django-openstack-auth \
+        python-django-pyscss \
+        python-eventlet \
+        python-httplib2 \
+        python-iso8601 \
+        python-kombu \
+        python-netaddr \
+        python-oslo.concurrency \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.policy \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-pyscss \
+        python-ceilometerclient \
+        python-cinderclient \
+        python-glanceclient \
+        python-heatclient \
+        python-keystoneclient \
+        python-neutronclient \
+        python-novaclient \
+        python-saharaclient \
+        python-swiftclient \
+        python-troveclient \
+        python-pytz \
+        python-pyyaml \
+        python-six \
+        python-xstatic \
+        python-xstatic-angular \
+        python-xstatic-angular-bootstrap \
+        python-xstatic-angular-gettext \
+        python-xstatic-angular-lrdragndrop \
+        python-xstatic-bootstrap-datepicker \
+        python-xstatic-bootstrap-scss \
+        python-xstatic-bootswatch \
+        python-xstatic-d3 \
+        python-xstatic-hogan \
+        python-xstatic-font-awesome \
+        python-xstatic-jasmine \
+        python-xstatic-jquery \
+        python-xstatic-jquery-migrate \
+        python-xstatic-jquery-quicksearch \
+        python-xstatic-jquery-tablesorter \
+        python-xstatic-jquery-ui \
+        python-xstatic-jsencrypt \
+        python-xstatic-magic-search \
+        python-xstatic-mdi \
+        python-xstatic-rickshaw \
+        python-xstatic-roboto-fontface \
+        python-xstatic-smart-table \
+        python-xstatic-spin \
+        python-xstatic-term.js \
+        "
 
 SRCNAME = "horizon"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://horizon.init \
     file://fix_bindir_path.patch \
     file://openstack-dashboard-apache.conf \
     file://local_settings.py \
     file://horizon-use-full-package-path-to-test-directories.patch \
-    file://Compatibility-fix-for-pyscss-1.3.4.patch \
     "
 
-SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
-PV = "2015.1.0+git${SRCPV}p1"
+SRCREV = "593f0b78eea8efbb6d833d66acc7ab4dc852159b"
+PV = "8.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d python-dir default_configs openstackchef monitor
-- 
2.1.4


