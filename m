Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3515DE00DDE; Wed, 16 Sep 2015 09:26:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC554E00BED
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 09:26:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GGQeGd015539
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 09:26:40 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 09:26:40 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 16 Sep 2015 12:26:38 -0400
Message-ID: <1442420798-8646-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442420798-8646-1-git-send-email-mark.asselstine@windriver.com>
References: <1442420798-8646-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libvirt: Properly shutdown libvirtd.service
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
X-List-Received-Date: Wed, 16 Sep 2015 16:26:49 -0000
Content-Type: text/plain

We build libvirt without support for sd_notify (dbus) therefor we have
to run libvirtd as a 'forking daemon' (per commit
055744cdbc1526d966091158c8fae2d22c905db4 we pass --daemon)

We need to update the systemd service file to reflect this such that
the libvirtd.service can be properly stopped. If we ever enable
sd_notify support in libvirt we can revert back to using the 'notify'
systemd type. Without this change libvirtd continue to run even if the
stop command is issued, subsequent attempts to start the service will
fail.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.19.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb b/recipes-extended/libvirt/libvirt_1.2.19.bb
index f433321..df53d59 100644
--- a/recipes-extended/libvirt/libvirt_1.2.19.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
@@ -225,6 +225,11 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 	    # This variable is used by libvirtd.service to start libvirtd in the right mode
 	    sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
+
+	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
+	    sed -i -e 's/Type=notify/Type=forking/' \
+	           -e '/Type=forking/a PIDFile=${localstatedir}/run/libvirtd.pid' \
+		   ${D}/${systemd_unitdir}/system/libvirtd.service
 	fi
 
 	# The /var/run/libvirt directories created by the Makefile
-- 
2.1.4


