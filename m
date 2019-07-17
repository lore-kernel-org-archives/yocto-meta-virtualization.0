Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6D68E00D1C; Wed, 17 Jul 2019 00:39:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A9A8E00798
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jul 2019 00:39:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6H7cXZj013511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jul 2019 00:38:58 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 17 Jul 2019 00:38:37 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 17 Jul 2019 15:38:34 +0800
Message-ID: <1563349114-19162-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-cloud-services][PATCH] openssh: update bbappend
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
X-List-Received-Date: Wed, 17 Jul 2019 07:39:09 -0000
Content-Type: text/plain

Update the bbappend since openssh had been upgraded to 8.x in oe-core.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-openstack/recipes-connectivity/openssh/files/mcs-sshd                | 0
 .../openssh/{openssh_7.%.bbappend => openssh_%.bbappend}                  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-openstack/recipes-connectivity/openssh/files/mcs-sshd
 rename meta-openstack/recipes-connectivity/openssh/{openssh_7.%.bbappend => openssh_%.bbappend} (100%)

diff --git a/meta-openstack/recipes-connectivity/openssh/files/mcs-sshd b/meta-openstack/recipes-connectivity/openssh/files/mcs-sshd
old mode 100755
new mode 100644
diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_%.bbappend
similarity index 100%
rename from meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
rename to meta-openstack/recipes-connectivity/openssh/openssh_%.bbappend
-- 
2.7.4


