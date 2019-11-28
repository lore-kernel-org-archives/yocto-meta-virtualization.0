Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1138.1574972253358254438
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 12:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 140.211.169.56, mailfrom: norbert.kaminski@3mdeb.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7F61E00EBE; Thu, 28 Nov 2019 12:17:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [46.105.36.150 listed in list.dnswl.org]
Received: from 17.mo6.mail-out.ovh.net (17.mo6.mail-out.ovh.net [46.105.36.150])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6C5FE0097D
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 12:17:31 -0800 (PST)
Received: from player716.ha.ovh.net (unknown [10.108.42.23])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 6FA521EE5C6
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 21:00:24 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 6CC14C9E5E33;
	Thu, 28 Nov 2019 20:00:19 +0000 (UTC)
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
To: meta-virtualization@yoctoproject.org,
	bruce.ashfield@gmail.com
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Norbert Kaminski <norbert.kaminski@3mdeb.com>
Subject: Re: [meta-virtualization][PATCH] docker.inc: Add xt-addrtype kernel module
Date: Thu, 28 Nov 2019 20:59:52 +0100
Message-Id: <20191128195952.8230-1-norbert.kaminski@3mdeb.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 2835015966778431764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeijedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomhepnhhkrghmihhnshhkihcuoehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomheqnecuffhomhgrihhnpehsohgtkhdrihhsnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnseihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedt

From: Norbert Kaminski <norbert.kaminski@3mdeb.com>

Trying to use docker info and hello world container without this module
causes a daemon error.

docker info error log:

Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the
docker daemon running?

dockerd error log:

PREROUTING chain: iptables failed: iptables --wait -t nat -A PREROUTING -m
addrtype --dst-type LOCAL -j DOCKER: iptables v1.8.3 (legacy): Couldn't
load match `addrtype':No such file or directory

Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>

---
 recipes-containers/docker/docker.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 0083902..32d4a2e 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -29,7 +29,7 @@ RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
                  "
 RDEPENDS_${PN} += "virtual/containerd virtual/runc"
 
-RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
+RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-xt-addrtype"
 
 PROVIDES += "virtual/docker"
 
-- 
2.17.1

