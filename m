Return-Path: <Adrian.Calianu@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B1EAE00A0C; Tue, 16 Dec 2014 04:06:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A5D1BE009B9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Dec 2014 04:06:45 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 16 Dec 2014 13:06:41 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 86F542800CB;
	Tue, 16 Dec 2014 13:06:41 +0100 (CET)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1418731583-59475-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: Adrian Calianu <adrian.calianu@enea.com>
Subject: [PATCH 0/1] disable separate builddir support for libvirt
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
Date: Tue, 16 Dec 2014 12:06:58 -0000
X-Original-Date: Tue, 16 Dec 2014 13:06:21 +0100
X-List-Received-Date: Tue, 16 Dec 2014 12:06:58 -0000
Content-Type: text/plain

Branch: dizzy

Disable separate build folder for livirt since this option brakes the
environment to run ptests on target.

Adrian Calianu (1):
  libvirt: disable separate builddir support

 recipes-extended/libvirt/libvirt_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


