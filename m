Return-Path: <norbert.kaminski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68809E00E4B; Thu, 14 Nov 2019 06:24:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.58.60 listed in list.dnswl.org]
X-Greylist: delayed 558 seconds by postgrey-1.32 at yocto-www;
	Thu, 14 Nov 2019 06:24:17 PST
Received: from 3.mo68.mail-out.ovh.net (3.mo68.mail-out.ovh.net [46.105.58.60])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79233E00E42
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 06:24:17 -0800 (PST)
Received: from player792.ha.ovh.net (unknown [10.108.35.122])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 39C3F14C29B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 15:14:58 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id B7C01C16F393;
	Thu, 14 Nov 2019 14:14:55 +0000 (UTC)
To: meta-virtualization@yoctoproject.org
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Message-ID: <c8623b0b-96f2-a3b3-8cd8-8249a2f53455@3mdeb.com>
Date: Thu, 14 Nov 2019 15:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7017171173176744238
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepvffhuffkffgfgggtgfesthekredttdefjeenucfhrhhomheppfhorhgsvghrthcumfgrmhhinhhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepnhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepmhgvthgrqdhvihhrthhurghlihiirghtihhonheshihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Cc: piotr.krol@3mdeb.com
Subject: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
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
X-List-Received-Date: Thu, 14 Nov 2019 14:24:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

 From ea86f97c347f6637d85a6fdbf36943d43adfa18e Mon Sep 17 00:00:00 2001
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Date: Tue, 12 Nov 2019 11:25:29 +0100
Subject: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub

The patch fixes a problem with importing the package xen.lowlevel.xc.
RDEPENDS add the xen-python tool, which contains the package.

Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
---
  recipes-extended/xen/xen.inc | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 628e52b..ba00d2a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,6 +151,8 @@ RDEPENDS_${PN}-xentrace = "python"

  RDEPENDS_${PN}-xen-watchdog = "bash"

+RDEPENDS_${PN}-pygrub = "${PN}-python"
+
  PACKAGES = "\
      ${PN}-base \
      ${PN}-blktap \
-- 
2.17.1


