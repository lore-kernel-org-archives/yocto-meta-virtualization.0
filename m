Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90136E00C7B; Wed,  3 Feb 2016 17:41:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD023E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141fkrO011591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:46 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:46 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:40:56 -0500
Message-ID: <1454550104-7065-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 01/49] housekeeping: remove references to openvswitch-controller
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
X-List-Received-Date: Thu, 04 Feb 2016 01:41:54 -0000
Content-Type: text/plain

Per 5181ec2259eba5f4d3ec8516ea693bbc94481cf3 [openvswitch: rename
openvswitch-controller] and f7dcf5bce94064d32e6d07f9385fbff02e2a86f2
[openvswitch: enable systemd support] on meta-virtualization we remove
references to openvswitch-controller. This was never intended to be
something that should be installed. So removing this from the
packagegroup and chef.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/packagegroups/packagegroup-cloud-controller.bb      | 1 -
 meta-openstack/recipes-support/deploychef/files/startup-list             | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
index 2718d2e..5154b1d 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
@@ -23,7 +23,6 @@ RDEPENDS_${PN} = " postgresql-setup \
     neutron-setup \
     neutron-server \
     neutron-plugin-openvswitch \
-    openvswitch-controller \
     cinder-api \
     cinder-volume \
     cinder-scheduler \
diff --git a/meta-openstack/recipes-support/deploychef/files/startup-list b/meta-openstack/recipes-support/deploychef/files/startup-list
index 810d619..fa6dca1 100644
--- a/meta-openstack/recipes-support/deploychef/files/startup-list
+++ b/meta-openstack/recipes-support/deploychef/files/startup-list
@@ -38,4 +38,3 @@ S30nova-spicehtml5proxy
 S70lighttpd
 S71openvswitch-switch
 S72libvirtd
-S72openvswitch-controller
-- 
2.1.4


