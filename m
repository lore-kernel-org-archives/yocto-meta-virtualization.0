Return-Path: <Christian.Ziethen@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98CCBE006F1; Thu,  3 Jul 2014 06:28:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C6BCEE00342
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Jul 2014 06:28:23 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 3 Jul 2014
	15:28:18 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4442)	id 692AC285092;
	Thu,  3 Jul 2014 15:28:18 +0200 (CEST)
From: =?UTF-8?q?Christian=20Zieth=C3=A9n?= <Christian.Ziethen@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 3 Jul 2014 15:28:09 +0200
Message-ID: <1404394090-25834-1-git-send-email-Christian.Ziethen@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: Christian.Ziethen@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v1] Replace module_autoload with KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Thu, 03 Jul 2014 13:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

linux-yocto_3.14: Replace module_autoload with KERNEL_MODULE_AUTOLOAD

Christian Zieth=C3=A9n (1):
  linux-yocto_3.14: Replace module_autoload with   =20
    KERNEL_MODULE_AUTOLOAD

 recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--=20
1.9.1


