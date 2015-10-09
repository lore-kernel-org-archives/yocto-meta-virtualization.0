Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E48F5E00C05; Fri,  9 Oct 2015 08:26:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id DBD26E006EA
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Oct 2015 08:26:50 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 9 Oct 2015
	17:26:45 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Oct 2015 17:26:45 +0200
Message-ID: <1444404405-54190-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][PATCH] openstack-base.bbclass: do not overwrite hosts file
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
X-List-Received-Date: Fri, 09 Oct 2015 15:26:53 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/classes/openstack-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/classes/openstack-base.bbclass b/meta-openstack/classes/openstack-base.bbclass
index 718aa1c..5ecbd21 100644
--- a/meta-openstack/classes/openstack-base.bbclass
+++ b/meta-openstack/classes/openstack-base.bbclass
@@ -7,6 +7,6 @@ openstack_configure_hosts() {
 
     echo "${CONTROLLER_IP} ${CONTROLLER_HOST}" >> ${IMAGE_ROOTFS}/etc/hosts
     echo "${COMPUTE_IP} ${COMPUTE_HOST}" >> ${IMAGE_ROOTFS}/etc/hosts
-    echo "${MY_HOST}" > ${IMAGE_ROOTFS}/etc/hostname
+    echo "${MY_HOST}" >> ${IMAGE_ROOTFS}/etc/hostname
 }
 
-- 
1.9.1


