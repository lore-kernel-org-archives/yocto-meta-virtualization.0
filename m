Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6080E00D83; Wed, 24 Jul 2019 00:43:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADFC3E00D44
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Jul 2019 00:43:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6O7h4Qn013848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 00:43:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 24 Jul 2019 00:43:03 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Wed, 24 Jul 2019 15:43:02 +0800
Message-ID: <1563954182-300270-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: Do not change /var/lib/libvirt/qemu for mips and mips64 in do_install
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
X-List-Received-Date: Wed, 24 Jul 2019 07:43:07 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

qemu does not support mips and mips64 and thus /var/lib/libvirt/qemu is not
generated. Do not change it.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.5.0.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
index 8d71862..80f7a6c 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
@@ -311,9 +311,18 @@ do_install_append() {
 
 	sed -i -e 's/^\(unix_sock_group\ =\ \).*/\1"kvm"/' ${D}/etc/libvirt/libvirtd.conf
 	sed -i -e 's/^\(unix_sock_rw_perms\ =\ \).*/\1"0776"/' ${D}/etc/libvirt/libvirtd.conf
-	chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
-	echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
-	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+
+	case ${MACHINE_ARCH} in
+		*mips*)
+			break
+			;;
+		*)
+			chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
+			echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
+			    >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+			break
+			;;
+	esac
 
 	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
 	    # Generate sample keys and certificates.
-- 
2.7.4


