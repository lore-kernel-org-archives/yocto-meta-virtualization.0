Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30581E007D5; Wed,  2 Dec 2015 08:32:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B0D13E007D5
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:50 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:49 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:07 +0100
Message-ID: <1449073966-29707-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 01/40] python-tooz: updated to 0.13.3 (kilo latest)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:32:54 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-tooz_0.4.bb => python-tooz_0.13.3.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tooz_0.4.bb => python-tooz_0.13.3.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb b/meta-openstack/recipes-devtools/python/python-tooz_0.13.3.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
rename to meta-openstack/recipes-devtools/python/python-tooz_0.13.3.bb
index 9ea75c3..a461725 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_0.13.3.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
-
 SRCNAME = "tooz"
 SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "26c2ff05188be7a4ba9d13ef54a6280c"
-SRC_URI[sha256sum] = "4db6b9058f2886af067bb81b8f757de095fc7a0bb24beef82c769478229ee595"
+SRC_URI[md5sum] = "2e9815c91508c34f5413b38597155017"
+SRC_URI[sha256sum] = "8b6ea7026a920eaa8508f2004fcd2c891267da88cc1ae5224f344af849395b64"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


