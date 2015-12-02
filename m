Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 155B3E00AB9; Wed,  2 Dec 2015 08:33:32 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 8BAF0E007B1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:58 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:57 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:12 +0100
Message-ID: <1449073966-29707-7-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 06/40] python-oslo.config: upgrade to 1.9.3 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:32 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../{python-oslo.config_1.6.1.bb => python-oslo.config_1.9.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.6.1.bb => python-oslo.config_1.9.3.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
index 6cc72f6..3094b1e 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
@@ -9,8 +9,8 @@ SRCNAME = "oslo.config"
 
 SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d51fd561300f46945dd24977c429280c"
-SRC_URI[sha256sum] = "4709df3a8ba05e6a47300770f1c90ade77b3d095f28e8f75191df8745268bb20"
+SRC_URI[md5sum] = "109da1307ea8c65440accccbc59cf9a5"
+SRC_URI[sha256sum] = "ab54e67776d9bbee86ba8cce9393ba3186e6e63de926e9797598dc35fe790140"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


