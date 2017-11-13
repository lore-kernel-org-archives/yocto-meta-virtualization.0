Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15224E00DAB; Mon, 13 Nov 2017 11:33:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DC05E00D85
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:52 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWqk1019658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:52 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:52 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:31 -0500
Message-ID: <1510601551-32245-12-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 11/11] python-horizon: uprev to latest stable/pike
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
X-List-Received-Date: Mon, 13 Nov 2017 19:33:00 -0000
Content-Type: text/plain

Required version updates to satisfy requirements.txt:

python-xstatic-angular, python-xstatic-angular-bootstrap,
python-xstatic-angular-gettext, python-xstatic-bootstrap-scss,
python-xstatic-bootswatch, python-xstatic-d3,
python-xstatic-font-awesome, python-xstatic-jasmine,
python-xstatic-jsencrypt, python-xstatic-roboto-fontface,
python-xstatic-term.js.

As well as the openstack *-clients. These uprev's have been completed
in commit prior to this one.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-horizon_git.bb  | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index d2cb345..69d19f5 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -18,10 +18,8 @@ RDEPENDS_${PN} += " \
         python-django-compressor \
         python-django-openstack-auth \
         python-django-pyscss \
-        python-eventlet \
-        python-httplib2 \
+        python-futurist \
         python-iso8601 \
-        python-kombu \
         python-netaddr \
         python-oslo.concurrency \
         python-oslo.config \
@@ -29,25 +27,27 @@ RDEPENDS_${PN} += " \
         python-oslo.policy \
         python-oslo.serialization \
         python-oslo.utils \
+        python-osprofiler \
+        python-pymongo \
         python-pyscss \
-        python-ceilometerclient \
         python-cinderclient \
         python-glanceclient \
         python-heatclient \
         python-keystoneclient \
         python-neutronclient \
         python-novaclient \
-        python-saharaclient \
         python-swiftclient \
-        python-troveclient \
         python-pytz \
         python-pyyaml \
+        python-semantic-version \
         python-six \
         python-xstatic \
         python-xstatic-angular \
         python-xstatic-angular-bootstrap \
+        python-xstatic-angular-fileupload \
         python-xstatic-angular-gettext \
         python-xstatic-angular-lrdragndrop \
+        python-xstatic-angular-schema-form \
         python-xstatic-bootstrap-datepicker \
         python-xstatic-bootstrap-scss \
         python-xstatic-bootswatch \
@@ -57,22 +57,23 @@ RDEPENDS_${PN} += " \
         python-xstatic-jasmine \
         python-xstatic-jquery \
         python-xstatic-jquery-migrate \
-        python-xstatic-jquery-quicksearch \
-        python-xstatic-jquery-tablesorter \
+        python-xstatic-jquery.quicksearch \
+        python-xstatic-jquery.tablesorter \
         python-xstatic-jquery-ui \
         python-xstatic-jsencrypt \
-        python-xstatic-magic-search \
         python-xstatic-mdi \
+        python-xstatic-objectpath \
         python-xstatic-rickshaw \
         python-xstatic-roboto-fontface \
         python-xstatic-smart-table \
         python-xstatic-spin \
         python-xstatic-term.js \
+        python-xstatic-tv4 \
         "
 
 SRCNAME = "horizon"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
     file://horizon.init \
     file://fix_bindir_path.patch \
     file://openstack-dashboard-apache.conf \
@@ -80,8 +81,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://horizon-use-full-package-path-to-test-directories.patch \
     "
 
-SRCREV = "593f0b78eea8efbb6d833d66acc7ab4dc852159b"
-PV = "8.0.0+git${SRCPV}"
+SRCREV = "246ff9f81248a00a434e66d18fad70519ba811cc"
+PV = "12.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d python-dir default_configs monitor
-- 
2.7.4


