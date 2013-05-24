Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EE3FE0146C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4OI5QTN010576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:27 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 24 May 2013 11:05:26 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 24 May 2013 11:05:23 -0700
Message-ID: <1369418725-6697-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH 0/2] lxc recipe changes
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
X-List-Received-Date: Fri, 24 May 2013 18:05:27 -0000
Content-Type: text/plain

Guessing a default.conf based on distro is problemmatic, but
we certainly do not want the guess based on the host, which is
what will happen if we do not specify it.

Joe Slater (2):
  lxc: specify distro
  lxc: use four fields for PACAKGECONFIG[] info

 recipes-containers/lxc/lxc_0.9.0.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.3.4


