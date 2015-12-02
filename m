Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB240E00C38; Wed,  2 Dec 2015 08:34:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3AB83E0083E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:40 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:39 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:39 +0100
Message-ID: <1449073966-29707-34-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 33/40] python-keystoneclient: upgrade to 1.3.3
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:20 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-keystoneclient_git.bb          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index 0063efc..5c5d98c 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -4,17 +4,16 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 
-PR = "r0"
 SRCNAME = "keystoneclient"
 
 SRC_URI = "\
-	git://github.com/openstack/python-keystoneclient.git;branch=master \
+	git://github.com/openstack/python-keystoneclient.git;branch=stable/kilo \
 	file://fix_keystoneclient_memory_leak.patch \
 	file://keystone-api-check.sh \
 	"
 
-PV = "1.3.0+git${SRCPV}"
-SRCREV = "a84b5ac115dd5775f7380a204811aa939fd5c242"
+PV = "1.3.3+git${SRCPV}"
+SRCREV = "ec70eb02f8a5889828cde786694283240f64c5c4"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor
@@ -32,6 +31,7 @@ RDEPENDS_${PN} += " \
 	python-requests \
 	python-simplejson \
 	python-oslo.config \
+	python-oslo.serialization \
 	python-pbr \
 	"
 
-- 
2.1.0


