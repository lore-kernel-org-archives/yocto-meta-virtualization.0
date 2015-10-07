Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8795EE00D4B; Wed,  7 Oct 2015 08:38:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id ED06EE00C80
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Oct 2015 08:38:50 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Oct 2015
	17:38:49 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Oct 2015 17:38:43 +0200
Message-ID: <1444232325-22859-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
References: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido/kilo][PATCH 1/3] python-tablib: added recipe
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
X-List-Received-Date: Wed, 07 Oct 2015 15:38:53 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-tablib_0.10.0.bb    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb b/meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb
new file mode 100644
index 0000000..7c8dbca
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Format agnostic tabular data library (XLS, JSON, YAML, CSV)"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d26f98effd307261a2e0ddcce08e07b7"
+
+SRC_URI[md5sum] = "41fb8a731f6ef54812045ef9bf2909c6"
+SRC_URI[sha256sum] = "41c2dad7f491f5557e22783a9af81bed62f7b6fb0d7afd4c2ee301f3eb428c93"
+
+inherit pypi
+
+DEPENDS += " \
+    python-pip \
+    "
+
+RDEPENDS_${PN} += " \
+    python-pip \
+    python-pyyaml \
+    "
-- 
1.9.1


