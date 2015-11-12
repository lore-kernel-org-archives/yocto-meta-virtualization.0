Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E48B6E00A9A; Wed, 11 Nov 2015 18:50:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DE1AE007C3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC2oato023001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:36 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 18:50:36 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Nov 2015 21:50:29 -0500
Message-ID: <1447296631-16483-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 4/6] linux-yocto: carry forward kernel configuration
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
X-List-Received-Date: Thu, 12 Nov 2015 02:50:39 -0000
Content-Type: text/plain

Yocto master uses linux-yocto 4.1 so we need to create the proper
bbappend to ensure we are setting up the kernel correctly. We reuse
the bbappend for the previous kernel version but enable
CONFIG_IP_NF_NAT to allow nova to define the desired iptables.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg       | 1 +
 meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
index 9160ffe..223210c 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
@@ -5,3 +5,4 @@ CONFIG_NF_NAT_PROTO_SCTP=m
 CONFIG_NF_CONNTRACK_IPV4=y
 CONFIG_NF_CONNTRACK_PROC_COMPAT=y
 CONFIG_NF_NAT_IPV4=m
+CONFIG_IP_NF_NAT=m
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..843546c
--- /dev/null
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://enable-veth.cfg \
+            file://enable-iscsi-tcp.cfg \
+            file://enable-nbd.cfg \
+            file://enable-rtlink.cfg \
+            file://nf.scc \
+            file://nfs.scc \
+	"
-- 
2.1.4


