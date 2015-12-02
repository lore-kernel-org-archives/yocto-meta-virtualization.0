Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96690E00BEB; Wed,  2 Dec 2015 08:34:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 645ABE00825
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:29 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:28 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:32 +0100
Message-ID: <1449073966-29707-27-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 26/40] python-keystonemiddleware: upgrade to 1.5.2
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:12 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-keystonemiddleware_git.bb       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
index f4ce244..69af3d1 100644
--- a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 
-PR = "r0"
 SRCNAME = "keystonemiddleware"
 
 SRC_URI = "\
-	git://git.openstack.org/openstack/keystonemiddleware;branch=master \
+	git://git.openstack.org/openstack/keystonemiddleware;branch=stable/kilo \
 	"
 
-PV="1.4.0+git${SRCPV}"
-SRCREV="782fb0129d2eb7f181f890068767ce2b6906b2bd"
+PV="1.5.2+git${SRCPV}"
+SRCREV="fd12825acb92db08aea588522f9a91d7091f3a32"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.1.0


