Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A554FE00C12; Tue,  8 Dec 2015 09:34:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 57F5BE00B89
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:29 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:28 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:32 +0100
Message-ID: <1449596034-8308-21-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 20/42] libvirt: remove sanlock from PACKAGECONFIG
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:45 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

There exists no recipe for sanlock and the libvirt recipe doesn't have
a sanlock PACKAGECONFIG so removing sanlock from the set of
PACKAGECONFIGs.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
index 195633b..874bfd6 100644
--- a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
@@ -1,5 +1,5 @@
 PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
-	 	 python sanlock ebtables \
+	 	 python ebtables \
 		 ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 		"
 
-- 
2.5.0


