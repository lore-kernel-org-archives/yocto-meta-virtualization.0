Return-Path: <jori@enea.com>
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A614E0084D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 08:10:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 2FFD880C;
	Thu, 27 Feb 2014 17:10:16 +0100 (MET)
X-Virus-Scanned: amavisd-new at acc.umu.se
Received: from sestows930 (sestofw01.enea.se [192.36.1.252])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: zqad)
	by mail.acc.umu.se (Postfix) with ESMTPSA id 4720C808;
	Thu, 27 Feb 2014 17:10:15 +0100 (MET)
Received: by sestows930 (Postfix, from userid 1000)
	id 699EC181980; Thu, 27 Feb 2014 17:10:14 +0100 (CET)
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 27 Feb 2014 17:10:05 +0100
Message-Id: <1393517409-425-1-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
Subject: [PATCHv2 0/4] libvirt fixes
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
X-List-Received-Date: Thu, 27 Feb 2014 16:10:21 -0000

Hi,

Resubmitting the series without the LXC IMAGE/DISTRO_FEATURE patch.

Regards,
/Jonas

Jonas Eriksson (4):
  libvirt: Change license to LGPLv2.1+
  libvirt: Fix selinux DISTRO_FEATURE check
  libvirt: Use DISTRO_FEATURES to enable Xen support
  libvirt: Disable polkit driver when there is no x11

 recipes-extended/libvirt/libvirt_1.2.1.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
1.9.rc1


