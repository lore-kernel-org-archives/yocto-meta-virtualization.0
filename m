Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24C66E00DC3; Mon, 13 Nov 2017 11:32:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2043E00DE5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:48 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWmEG019655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:48 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:28 -0500
Message-ID: <1510601551-32245-9-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 08/11] python-neutronclient: uprev to latest stable/pike
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:56 -0000
Content-Type: text/plain

Updated runtime dependencies based on requirements.txt. Required
updates to python-cliff and python-osc-lib.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-neutronclient_git.bb  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index bcbefaa..5904e64 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -9,28 +9,32 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} +="\
+RDEPENDS_${PN} += " \
         python-pbr \
         python-cliff \
+        python-debtcollector \
         python-iso8601 \
         python-netaddr \
+        python-osc-lib \
         python-oslo.i18n \
         python-oslo.serialization \
         python-oslo.utils \
-        python-requests \
+        python-os-client-config \
+        python-keystoneauth1 \
         python-keystoneclient \
+        python-requests \
         python-simplejson \
         python-six \
         python-babel \
-	"
+        "
 
-SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=master \
+SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=stable/pike \
            file://neutronclient-use-csv-flag-instead-of-json.patch \
            file://neutron-api-check.sh \
           "
 
-PV = "3.1.0+git${SRCPV}"
-SRCREV = "3e115991c1cf9ec7cf4252440fa8d6015a5f53ce"
+PV = "6.5.0+git${SRCPV}"
+SRCREV = "e145c4ef8a0e8390f0468df422a757760e77f823"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
-- 
2.7.4


