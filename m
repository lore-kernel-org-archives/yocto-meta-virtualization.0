Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 8803CE00502
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Mar 2014 03:34:19 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 18 Mar 2014 11:34:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 93E982800CE;
	Tue, 18 Mar 2014 11:34:14 +0100 (CET)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Mar 2014 11:34:10 +0100
Message-ID: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 0/2] libvirt ptest support and update to version 1.2.2
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
X-List-Received-Date: Tue, 18 Mar 2014 10:34:23 -0000
Content-Type: text/plain

Hi,

This patch series adds libvirt to ptest framework and updates to 1.2.2.
The testsuite summary for libvirt 1.2.2 looks similar to the one for libvirt 1.2.1 (8 new tests come with the new livbirt version).

Best regards,
Mihaela Sendrea.

Mihaela Sendrea (2):
  libvirt: Add ptest support
  libvirt: Update version to 1.2.2

 recipes-extended/libvirt/libvirt-python.inc        |   4 +-
 recipes-extended/libvirt/libvirt/run-ptest         |   3 +
 recipes-extended/libvirt/libvirt/runptest.patch    | 112 +++++++++++++++++++++
 .../libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} |  43 +++++++-
 4 files changed, 155 insertions(+), 7 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt/run-ptest
 create mode 100644 recipes-extended/libvirt/libvirt/runptest.patch
 rename recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} (87%)

-- 
1.8.5.3


