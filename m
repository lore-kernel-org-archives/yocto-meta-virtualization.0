Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.333.1574433358985515315
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Nov 2019 06:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 140.211.169.56, mailfrom: norbert.kaminski@3mdeb.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFA0FE00BA1; Fri, 22 Nov 2019 06:35:58 -0800 (PST)
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
	*      [46.105.34.1 listed in list.dnswl.org]
X-Greylist: delayed 1134 seconds by postgrey-1.32 at yocto-www; Fri, 22 Nov 2019 06:35:57 PST
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net [46.105.34.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1970E00A39
	for <meta-virtualization@yoctoproject.org>; Fri, 22 Nov 2019 06:35:57 -0800 (PST)
Received: from player728.ha.ovh.net (unknown [10.108.42.75])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id CAAAD123812
	for <meta-virtualization@yoctoproject.org>; Fri, 22 Nov 2019 15:17:01 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id DC5B8C5A955D;
	Fri, 22 Nov 2019 14:16:57 +0000 (UTC)
Subject: [meta-virtualization] [PATCH] docker.inc: Add xt-addrtype kernel module
References: <2ed2e82f-ad3e-a61b-0511-69c47eb8cce2@3mdeb.com>
To: meta-virtualization@yoctoproject.org
Cc: piotr.krol@3mdeb.com, Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
X-Forwarded-Message-Id: <2ed2e82f-ad3e-a61b-0511-69c47eb8cce2@3mdeb.com>
Message-ID: <d82e5ef6-6ddd-4d21-9137-cbd8e9158370@3mdeb.com>
Date: Fri, 22 Nov 2019 15:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ed2e82f-ad3e-a61b-0511-69c47eb8cce2@3mdeb.com>
X-Ovh-Tracer-Id: 17139855758694652206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehgedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepufhfvffhkffffgggjggtgfesthekredttdefjeenucfhrhhomheppfhorhgsvghrthcumfgrmhhinhhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucffohhmrghinhepshhotghkrdhishenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepnhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepmhgvthgrqdhvihhrthhurghlihiirghtihhonheshihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

 From 585f3e4a1da40528b2d8eba0bf46033fdf5e310d Mon Sep 17 00:00:00 2001
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Date: Fri, 22 Nov 2019 11:27:18 +0100
Subject: [PATCH] docker.inc: Add xt-addrtype kernel module

Trying to use docker info and hello world container without this module
causes a daemon error.

docker info error log:

Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is th=
e
docker daemon running?

dockerd error log:

PREROUTING chain: iptables failed: iptables --wait -t nat -A PREROUTING -=
m
addrtype --dst-type LOCAL -j DOCKER: iptables v1.8.3 (legacy): Couldn't
load match `addrtype':No such file or directory

Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
---
 =C2=A0recipes-containers/docker/docker.inc | 2 +-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc=20
b/recipes-containers/docker/docker.inc
index 0083902..32d4a2e 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -29,7 +29,7 @@ RDEPENDS_${PN} =3D "util-linux util-linux-unshare iptab=
les \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
 =C2=A0RDEPENDS_${PN} +=3D "virtual/containerd virtual/runc"

-RRECOMMENDS_${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat"
+RRECOMMENDS_${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat=20
kernel-module-xt-addrtype"

 =C2=A0PROVIDES +=3D "virtual/docker"

--=20
2.17.1

