Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 458CBE00B20; Thu, 26 Nov 2015 07:47:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C2B6EE00B21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:34 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:33 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:15 +0100
Message-ID: <1448552846-24382-3-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 02/13] cloud-init: fix 64bit libraries
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:37 -0000
Content-Type: text/plain

From: wruser <wruser@ironpass-er.wrs.com>

We need to ensure that the cloud-init to install in the correct
location (/usr/lib64)

Signed-off-by: Eddy Raineri <eddy.raineri@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
index 3a5c420..ea6752c 100644
--- a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
+++ b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
@@ -23,7 +23,7 @@ MANAGE_HOSTS ?= "False"
 HOSTNAME ?= ""
 
 do_install_prepend() {
-    sed -e 's:/usr/lib/${BPN}:${libdir}/${BPN}:' -i ${S}/setup.py
+    sed -e 's:/lib/${BPN}:${base_libdir}/${BPN}:' -i ${S}/setup.py
 }
 
 do_install_append() {
-- 
2.1.0


