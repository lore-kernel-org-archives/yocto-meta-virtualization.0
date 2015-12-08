Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 471F5E00C1E; Tue,  8 Dec 2015 09:34:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 942C8E00B97
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:35 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:34 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:36 +0100
Message-ID: <1449596034-8308-25-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 24/42] python-vcversioner: add new recipe
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:54 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Add python-vcversioner,since the newer python-jsonschema depends on it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/python-vcversioner_2.14.0.0.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
new file mode 100644
index 0000000..2fe96ab
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "http://github.com/Julian/jsonschema"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://vcversioner.py;beginline=1;endline=13;md5=b20bc154910c13368ad5ba54560f0b0c"
+
+SRCNAME = "vcversioner"
+
+SRC_URI = "http://pypi.python.org/packages/source/v/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
+SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.5.0


