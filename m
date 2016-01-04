Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68B53E00D14; Mon,  4 Jan 2016 07:23:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id ADDC9E00D58
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 07:23:49 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 Jan 2016 16:23:48 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 4 Jan 2016 16:23:39 +0100
Message-ID: <1451921019-16491-6-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
References: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 5/5] python-ceilometerclient: upgrade to 1.1.2
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
X-List-Received-Date: Mon, 04 Jan 2016 15:23:52 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-ceilometerclient_git.bb        | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
index 35760a9..b0f8161 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
@@ -18,15 +18,13 @@ RDEPENDS_${PN} +="python-cliff \
 	python-pbr \
 	"
 
-PR = "r0"
-
 SRC_URI = "\
-	git://github.com/openstack/python-ceilometerclient.git;branch=master \
+	git://github.com/openstack/python-ceilometerclient.git;branch=stable/kilo \
 	file://fix_ceilometerclient_memory_leak.patch \
 	"
 
-PV = "1.0.13+git${SRCPV}"
-SRCREV = "f8765ce532a45391c5366be8fa0f583f96a30d22"
+PV = "1.1.2+git${SRCPV}"
+SRCREV = "44c2a21adcfb3092d5e66706612fe14ec2282717"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.5.0


