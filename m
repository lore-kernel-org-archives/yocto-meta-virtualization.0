Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B750EE00CC7; Wed, 11 May 2016 23:55:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 66 seconds by postgrey-1.32 at yocto-www;
	Wed, 11 May 2016 23:55:10 PDT
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 440E4E00C65
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 May 2016 23:55:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6472497"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 May 2016 14:53:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9119642B6704
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 May 2016 14:53:57 +0800 (CST)
Received: from localhost.localdomain (10.167.226.24) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 12 May 2016 14:53:57 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1451775962-55892-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.24]
X-yoursite-MailScanner-ID: 9119642B6704.AAC51
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [PATCH] openvswitch: Fix rootfs creation errors
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
Date: Thu, 12 May 2016 06:55:13 -0000
X-Original-Date: Sun, 3 Jan 2016 02:06:02 +0300
X-List-Received-Date: Thu, 12 May 2016 06:55:13 -0000
Content-Type: text/plain

error: file /var/run from install of openvswitch-2.1.3-r0.x86_64
    conflicts with file from package base-files-3.0.14-r89.ubinux_x86_64

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index b46d5af..1c6252a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -50,4 +50,5 @@ do_install_ptest() {
 
 do_install_append() {
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
+	rm -r ${D}/${localstatedir}/run
 }
-- 
1.8.4.2




