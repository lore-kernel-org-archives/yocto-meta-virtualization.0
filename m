Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FA31E00C46; Sat, 12 Oct 2019 02:05:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F3F6E009E7
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 Oct 2019 02:05:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9C95kI6005885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 12 Oct 2019 02:05:46 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 12 Oct 2019 02:05:45 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Sat, 12 Oct 2019 17:05:44 +0800
Message-ID: <1570871144-49146-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] meta-openstack: linux-yocto: Remove non-existing kernel options
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
X-List-Received-Date: Sat, 12 Oct 2019 09:05:52 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The following kernel options have been removed from kernel.

CONFIG_NF_NAT_PROTO_SCTP removed by
faec18dbb0405 ("netfilter: nat: remove l4proto->manip_pkt")

CONFIG_NF_NAT_IPV4 removed by
3bf195ae6037e ("netfilter: nat: merge nf_nat_ipv4,6 into nat core")

CONFIG_NF_CONNTRACK_PROC_COMPAT removed by
adf0516845bc ("netfilter: remove ip_conntrack* sysctl compat code")

CONFIG_NF_NAT_NEEDED removed by
4806e975729f ("netfilter: replace NF_NAT_NEEDED with IS_ENABLED(CONFIG_NF_NAT)")

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg | 3 ---
 meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg           | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
index 6e1cff7..91b8209 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
@@ -1,7 +1,5 @@
 CONFIG_NF_NAT=m
-CONFIG_NF_NAT_NEEDED=y
 CONFIG_NF_NAT_PROTO_UDPLITE=m
-CONFIG_NF_NAT_PROTO_SCTP=m
 CONFIG_NF_NAT_AMANDA=m
 CONFIG_NF_NAT_FTP=m
 CONFIG_NF_NAT_IRC=m
@@ -12,7 +10,6 @@ CONFIG_NETFILTER_XT_TARGET_NETMAP=m
 
 CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
 
-CONFIG_NF_NAT_IPV4=m
 CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
index 676a091..5821a43 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
@@ -1,7 +1,3 @@
 CONFIG_NF_CONNTRACK=y
 CONFIG_NF_NAT=m
-CONFIG_NF_NAT_NEEDED=y
-CONFIG_NF_NAT_PROTO_SCTP=m
-CONFIG_NF_CONNTRACK_PROC_COMPAT=y
-CONFIG_NF_NAT_IPV4=m
 CONFIG_IP_NF_NAT=m
-- 
2.7.4


