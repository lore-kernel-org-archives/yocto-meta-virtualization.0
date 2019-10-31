Return-Path: <norbert.kaminski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59076E00DAF; Thu, 31 Oct 2019 11:23:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SUBJ_OBFU_PUNCT_FEW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.56.78 listed in list.dnswl.org]
	* 0.8 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject:
	header
X-Greylist: delayed 3602 seconds by postgrey-1.32 at yocto-www;
	Thu, 31 Oct 2019 11:23:36 PDT
Received: from 9.mo69.mail-out.ovh.net (9.mo69.mail-out.ovh.net [46.105.56.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DB06E00ADD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Oct 2019 11:23:36 -0700 (PDT)
Received: from player693.ha.ovh.net (unknown [10.109.143.183])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 7B1536E17E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Oct 2019 18:04:31 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 04A40B9A59C9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Oct 2019 17:04:30 +0000 (UTC)
To: meta-virtualization@yoctoproject.org
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Message-ID: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
Date: Thu, 31 Oct 2019 18:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1449877605498394900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddthedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Subject: recipes-extended/images/xen-image-minimal.bb: change, hardcoded vmlinuz to the KERNEL_IMAGETYPE variable
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
X-List-Received-Date: Thu, 31 Oct 2019 18:23:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Why is vmlinuz hard-coded in the syslinux.cfg? Could it be replaced by 
the KERNEL_IMAGETYPE?

 From 450becb15192a3541b7a3d55ace75a1929d15add Mon Sep 17 00:00:00 2001
From: Asiderr <norbert.kaminski@3mdeb.com>
Date: Thu, 31 Oct 2019 17:50:53 +0100
Subject: [PATCH] recipes-extended/images/xen-image-minimal.bb: change 
hardcoded vmlinuz to the variable

Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
---
  recipes-extended/images/xen-image-minimal.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb 
b/recipes-extended/images/xen-image-minimal.bb
index c39d378..740ef1f 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -61,6 +61,6 @@ build_syslinux_cfg () {
      echo "PROMPT 1" >> ${SYSLINUX_CFG}
      echo "LABEL boot" >> ${SYSLINUX_CFG}
      echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
-    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz 
${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
+    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- 
/${KERNEL_IMAGETYPE} ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
  }

-- 
2.17.1


