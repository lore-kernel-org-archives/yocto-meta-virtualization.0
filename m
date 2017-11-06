Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0D97E00D0D; Mon,  6 Nov 2017 01:45:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D4DEE00CF7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 01:45:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA69juPP023467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Nov 2017 01:45:56 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 6 Nov 2017 01:45:55 -0800
From: "Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>
To: Yan Yankovskyi <yan.yankovskyi@globallogic.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] [PATCH] xen: delete references to
	xenstored.socket and xenstored_ro.socket in xen.inc
Thread-Index: AQHTIW9TXuAgG/ZfLEe3131HA9kwo6MHhOoQ
Date: Mon, 6 Nov 2017 09:45:54 +0000
Message-ID: <9D17CA0E2F3FD24582A90F5363602C23011EB48C4E@ALA-MBC.corp.ad.wrs.com>
References: <1504083795-20546-1-git-send-email-yan.yankovskyi@globallogic.com>
In-Reply-To: <1504083795-20546-1-git-send-email-yan.yankovskyi@globallogic.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.147]
MIME-Version: 1.0
Subject: Re: [PATCH] xen: delete references to	xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 06 Nov 2017 09:45:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yan

Do you know why this patch was not merged? I'm running into same problem.

Regards,
Yunguo

-----Original Message-----
From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualizat=
ion-bounces@yoctoproject.org] On Behalf Of Yan Yankovskyi
Sent: Wednesday, August 30, 2017 5:03 PM
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] [PATCH] xen: delete references to xenstored.=
socket and xenstored_ro.socket in xen.inc

These files were removed since the following patch http://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dcommit;h=3D976ce01e103fc03bb3336cdbc6c951a709e285fe
and are absent in xen 4.8.0 and further, which leads to the following error=
 during the Xen build process:
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not =
exist

Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc in=
dex b5c5f03..717424b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -687,8 +687,6 @@ FILES_${PN}-xencommons +=3D "\
     ${systemd_unitdir}/system/xenconsoled.service \
     ${systemd_unitdir}/system/xen-init-dom0.service \
     ${systemd_unitdir}/system/xenstored.service \
-    ${systemd_unitdir}/system/xenstored.socket \
-    ${systemd_unitdir}/system/xenstored_ro.socket \
     ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "
=20
@@ -728,8 +726,6 @@ SYSTEMD_SERVICE_${PN}-xencommons =3D " \
     xenconsoled.service \
     xen-init-dom0.service \
     xenstored.service \
-    xenstored.socket \
-    xenstored_ro.socket \
     "
 SYSTEMD_SERVICE_${PN}-xendomains =3D "xendomains.service"
=20
--
1.9.1

--
_______________________________________________
meta-virtualization mailing list
meta-virtualization@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-virtualization

