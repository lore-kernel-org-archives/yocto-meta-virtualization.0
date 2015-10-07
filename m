Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF88FE00E1B; Wed,  7 Oct 2015 08:38:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 11A3FE00C80
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Oct 2015 08:38:53 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Oct 2015
	17:38:52 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Oct 2015 17:38:45 +0200
Message-ID: <1444232325-22859-4-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
References: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido/kilo][PATCH 3/3] openstackcclient: New version and updated dependencies
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
X-List-Received-Date: Wed, 07 Oct 2015 15:38:54 -0000
Content-Type: text/plain

Updated to the newest version in kilo, and added dependencies,
The dependency on cliff-tablib fixes this error:
> openstack token issue
ERROR: openstackclient.shell Exception raised: cliff-tablib>=1.0

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...ackclient_1.0.3.bb => python-openstackclient_1.0.4.bb} | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.3.bb => python-openstackclient_1.0.4.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
rename to meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
index 77cb5d2..a585b68 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
@@ -20,5 +20,20 @@ DEPENDS += "\
     "
 
 RDEPENDS_${PN} += "\
+    python-babel \
+    python-cinderclient \
+    python-cliff \
+    python-cliff-tablib \
+    python-glanceclient \
+    python-keystoneclient \
+    python-neutronclient \
+    python-novaclient \
+    python-oslo.config \
+    python-oslo.i18n \
+    python-oslo.serialization \
+    python-oslo.utils \
     python-pbr \
+    python-requests \
+    python-six \
+    python-stevedore \
     "
-- 
1.9.1


