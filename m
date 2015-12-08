Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCDA7E00C48; Tue,  8 Dec 2015 09:35:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 320BCE00B46
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:57 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:56 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:50 +0100
Message-ID: <1449596034-8308-39-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 38/42] python-oslo.versionedobjects: added recipe
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
X-List-Received-Date: Tue, 08 Dec 2015 17:35:24 -0000
Content-Type: text/plain

Heat depends on oslo.versionedobjects.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-oslo.versionedobjects_0.1.1.bb   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_0.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_0.1.1.bb b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_0.1.1.bb
new file mode 100644
index 0000000..77127e6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_0.1.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A library that provides a generic versioned object model that is RPC-friendly, with inbuilt serialization, field typing, and remotable method calls"
+HOMEPAGE = "http://docs.openstack.org/developer/oslo.versionedobjects/"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "11309423d1a08aab4a81a20e2dcca8d5"
+SRC_URI[sha256sum] = "dac8ef3ec789bd3f69f3f974e9f40282a411d804663eefd1ae39721f16a4c2da"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    python-babel \
+    python-fixtures \
+    python-iso8601 \
+    python-mock \
+    python-oslo.concurrency \
+    python-oslo.context \
+    python-oslo.i18n \
+    python-oslo.log \
+    python-oslo.messaging \
+    python-oslo.serialization \
+    python-oslo.utils \
+    python-webob \
+    python-six \
+    "
-- 
2.5.0


