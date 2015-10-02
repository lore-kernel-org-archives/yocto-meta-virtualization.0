Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12E9DE00FA7; Fri,  2 Oct 2015 06:51:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 61512E00FA0
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:51:07 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 2 Oct 2015
	15:51:05 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Oct 2015 15:50:55 +0200
Message-ID: <1443793858-17763-4-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
References: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 3/6] python-oslo.vmware: add recipe
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
X-List-Received-Date: Fri, 02 Oct 2015 13:51:21 -0000
Content-Type: text/plain

oslo.vmware is needed by glance and glancestore.

This recipe is backported from master 131510e36bdb161f by Mark
Asselstine <mark.asselstine@windriver.com>, adapted to use the
latest version from the stable/kilo branch.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-oslo.vmware_0.11.2.bb            | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb
new file mode 100644
index 0000000..575f296
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "oslo.vmware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+
+SRCNAME = "oslo.vmware"
+SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4ed4d7ce67629bb695d6688989daa159"
+SRC_URI[sha256sum] = "036cf0ad6ab0d4defd743678999851d570c2ca1ff34eba916920ce54d9a5d348"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        "
-- 
1.9.1


