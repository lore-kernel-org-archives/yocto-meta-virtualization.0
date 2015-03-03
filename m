Return-Path: <Rob.Woolley@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5762E008EA; Tue,  3 Mar 2015 13:25:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF7AE00853
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Mar 2015 13:25:19 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t23LPIbt016296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 3 Mar 2015 13:25:18 -0800 (PST)
Received: from yow-rwoolley-lx.wrs.com (128.224.146.40) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 3 Mar 2015 13:25:18 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 3 Mar 2015 16:25:16 -0500
Message-ID: <1425417916-16328-4-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1425417916-16328-1-git-send-email-rob.woolley@windriver.com>
References: <1425417916-16328-1-git-send-email-rob.woolley@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tgt: Identify CONFFILES
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
X-List-Received-Date: Tue, 03 Mar 2015 21:25:23 -0000
Content-Type: text/plain

Some package formats explicitly track which files are configuration files
so that they are not overwritten on updates. Explicitly list the
configuration file.

Signed-off by: Rob Woolley <rob.woolley@windriver.com>
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -15,6 +15,8 @@ SRC_URI += "file://tgtd.init"
 
 S = "${WORKDIR}/git"
 
+CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
+
 inherit update-rc.d
 
 do_compile() {


