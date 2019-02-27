Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BF4CE00D11; Tue, 26 Feb 2019 23:42:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEAF5E00D01
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 23:42:21 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R7fisd010902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2019 23:41:55 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 26 Feb 2019 23:41:34 -0800
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Wed, 27 Feb 2019 15:41:31 +0800
Message-ID: <1551253291-173385-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551253291-173385-1-git-send-email-zhe.he@windriver.com>
References: <1551253291-173385-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services] [PATCH] kernel: Remove redundant config fragment
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
X-List-Received-Date: Wed, 27 Feb 2019 07:42:22 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This fixes 01a28c32acb2 ("linux/nf.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by
CONFIG_NF_CONNTRACK") which duplicates a config fragment and causes the
following warning.

Warning: Value of CONFIG_NF_CONNTRACK is defined multiple times within fragment
tmp-glibc/work-shared/intel-x86-64/kernel-source/.kernel-meta/configs/v4.19/standard/intel-x86/nf.cfg:
CONFIG_NF_CONNTRACK=y
CONFIG_NF_CONNTRACK=y

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
index 1bf82ea..676a091 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
@@ -2,7 +2,6 @@ CONFIG_NF_CONNTRACK=y
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_NEEDED=y
 CONFIG_NF_NAT_PROTO_SCTP=m
-CONFIG_NF_CONNTRACK=y
 CONFIG_NF_CONNTRACK_PROC_COMPAT=y
 CONFIG_NF_NAT_IPV4=m
 CONFIG_IP_NF_NAT=m
-- 
2.7.4


