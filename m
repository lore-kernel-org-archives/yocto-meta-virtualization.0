Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A1DDE003FB
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Sep 2013 07:14:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r86EEvkR022136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Sep 2013 07:14:57 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Sep 2013 07:14:57 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 6 Sep 2013 10:14:53 -0400
Message-ID: <1378476894-17540-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: update to 1.1.2
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
X-List-Received-Date: Fri, 06 Sep 2013 14:14:59 -0000
Content-Type: text/plain

I'm about to update libvirt to 1.1.2 to fix some issues with 
1.1.1, and as part of this update, I'm also going to clean up
the old versions of the recipes.

Object now, before I pull the trigger :)

Bruce

Bruce Ashfield (1):
  libvirt: uprev to 1.1.2

 recipes-extended/libvirt/libvirt_1.0.3.bb          |  181 --------------------
 .../libvirt/{libvirt_1.1.1.bb => libvirt_1.1.2.bb} |    4 +-
 2 files changed, 2 insertions(+), 183 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt_1.0.3.bb
 rename recipes-extended/libvirt/{libvirt_1.1.1.bb => libvirt_1.1.2.bb} (97%)

-- 
1.7.10.4


