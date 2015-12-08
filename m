Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D45ACE00C32; Tue,  8 Dec 2015 09:35:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id E0BA2E00546
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:44 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:43 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:42 +0100
Message-ID: <1449596034-8308-31-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 30/42] openvswitch: add as RRECOMMENDS for compute and controller
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
X-List-Received-Date: Tue, 08 Dec 2015 17:35:05 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

We use openvswitch throughout the openstack images so we need to make
sure the kernel module is available by adding it to the list of
RRECOMMENDS packages.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb         | 1 +
 .../recipes-extended/packagegroups/packagegroup-cloud-controller.bb      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
index 2769e02..98a7348 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
@@ -41,4 +41,5 @@ RRECOMMENDS_${PN} = " \
     kernel-module-fuse \
     kernel-module-softdog \
     kernel-module-veth \
+    kernel-module-openvswitch \
     "
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
index 706d3ec..2718d2e 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
@@ -61,4 +61,5 @@ RRECOMMENDS_${PN} = " \
     kernel-module-fuse \
     cloud-init \
     kernel-module-softdog \
+    kernel-module-openvswitch \
     "
-- 
2.5.0


