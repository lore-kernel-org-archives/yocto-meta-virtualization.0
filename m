Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 13E30E00BAF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Apr 2014 06:26:27 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 14 Apr 2014 15:26:22 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id A279C288415;
	Mon, 14 Apr 2014 15:26:22 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 14 Apr 2014 15:26:18 +0200
Message-ID: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 0/2] lxc ptest support and update to version 1.0.1
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
X-List-Received-Date: Mon, 14 Apr 2014 13:26:28 -0000
Content-Type: text/plain

Hi,

This patch series adds libvirt to ptest framework and updates to 1.0.1.
The tests that are using the ubuntu template are not installed, since
they are not suitable to embedded distros.

Best regards,
Mihaela Sendrea.

Mihaela Sendrea (2):
  lxc: Add ptest support
  lxc: Update version to 1.0.1

 recipes-containers/lxc/files/run-ptest             |  4 +++
 recipes-containers/lxc/files/runtest.patch         | 32 ++++++++++++++++++++++
 .../lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb}             | 21 +++++++++++---
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 recipes-containers/lxc/files/run-ptest
 create mode 100644 recipes-containers/lxc/files/runtest.patch
 rename recipes-containers/lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb} (77%)

-- 
1.8.5.3


