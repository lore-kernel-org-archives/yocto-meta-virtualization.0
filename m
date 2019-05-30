Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20E62E00D48; Wed, 29 May 2019 22:48:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5AA3E00798
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5mRgH017960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:27 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 22:48:26 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 01:47:48 -0400
Message-ID: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 0/4] update bbappend to match bb version
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
X-List-Received-Date: Thu, 30 May 2019 05:48:29 -0000
Content-Type: text/plain



Hongzhi.Song (4):
  iptables: update bbappend to match to oe-core version
  libvirt: update bbappend to match bb version
  linux: update bbappend to match oe-core version
  iproute2: update bbappend to match bb version

 .../recipes-extended/iptables/iptables_1.6.%.bbappend       |  3 ---
 .../recipes-extended/iptables/iptables_1.8.%.bbappend       |  3 +++
 .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
 .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.18.bbappend          |  9 ---------
 .../recipes-kernel/linux/linux-yocto_5.0.bbappend           |  9 +++++++++
 .../recipes-support/iproute2/iproute2_4.%.bbappend          |  4 ----
 .../recipes-support/iproute2/iproute2_5.%.bbappend          |  4 ++++
 8 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
 create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
 delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
 create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
 create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
 delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
 create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend

-- 
2.8.1


