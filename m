Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86CA5E00B57; Mon, 28 May 2018 06:15:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 533E2E00972
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:15:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4SDFKQD016058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:15:20 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 06:15:19 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 May 2018 09:14:47 -0400
Message-ID: <1527513289-5463-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
References: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] lxc: rename the lxc 'autostart' sysvinit script matching upstream
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
X-List-Received-Date: Mon, 28 May 2018 13:15:23 -0000
Content-Type: text/plain

This was renamed back in v1.1.0 but I suppose most folks have been
buiding for systemd or were not using this functionality and it went
unnoticed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 547c44f..bf2a265 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -88,7 +88,7 @@ SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
 SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
-INITSCRIPT_NAME_${PN} = "lxc"
+INITSCRIPT_NAME_${PN} = "lxc-containers"
 INITSCRIPT_PARAMS_${PN} = "defaults"
 INITSCRIPT_NAME_${PN}-networking = "lxc-net"
 INITSCRIPT_PARAMS_${PN}-networking = "defaults"
-- 
2.7.4


