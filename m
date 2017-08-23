Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3843E00D05; Wed, 23 Aug 2017 14:43:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62142E00CAB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:52 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id b3so897565pga.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=at1RZrtiXWPQ55ZO220rTXTMT+AyYZuAO9saoRM6OuU=;
	b=XOFpJl/v1B1lbXucMv1yudtxWaHPX8FLYRM/QZpcJo7tuwmMHTRlQ/3JPOED154Kog
	7Qf38qSWfGrmVG720im1GsohyLmd+sQXInyvingNI/4CAQEX0xz8D3fB6qnJpTMLwIQC
	VmtiPvCVe+UVf8UdEh8Ddz7n7PbmECtcrvFhlG9UvRPkLpOE/9OasipxjLC6S7IptyHh
	6y5yh8sU96mznJy7A2jJTOC2bW3uLh6RP35C0dPk+W/vFJ8j4pXC7boazYK0rifa2oF/
	sqBaP/tkFDUFxAWBKczUJPKcXxUO6cUy6oxgHhB44R1kpukOO4GaCs6gc87inpynkiWI
	jKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=at1RZrtiXWPQ55ZO220rTXTMT+AyYZuAO9saoRM6OuU=;
	b=hveVfWzl4p9HCOaHEvOasShtgU3Fiqpm6iJc5LDrZK69ZFUoQhM+TU078/mw1gVTO0
	g5j7VYf55HKU20JiHrQbyKp6eBYUgdIL82peUU39WZ3IbyZ20upjMQRSI1hxjp5koMad
	A84Cq39xEBN8EEAobvVu1xbnIYIQe9XYZ4Z2ZpshRBtY8ew9PGQRPcgjX8hM1Wq4vkPr
	wi5nqiyqo3WuPiCUShW8s8dx7XWUlIa1kiuuhI2TmMl+PYCPLSwioSoOik9rCKLLMOYx
	uGEs7fsThsaufXW8GX4+qiQZhdOIZoo2W6z+AkdPh5HbPWk8m9ZqK8RCld8FnO96/R9i
	zWmQ==
X-Gm-Message-State: AHYfb5icLCdjRkBFDMPA/aJDTZ1JogVT+LJzTQHJlq/99yl7TGHHHkkK
	+TtivJgUaUZCGy4TJLA=
X-Received: by 10.98.213.196 with SMTP id d187mr4277122pfg.146.1503524631563; 
	Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id j1sm4221243pgs.77.2017.08.23.14.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Aug 2017 14:43:35 -0700
Message-Id: <1503524615-27663-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 4/4] xen-image-minimal : change SYSLINUXCFG to SYSLINUX_CFG
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
X-List-Received-Date: Wed, 23 Aug 2017 21:43:54 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

The SYSLINUXCFG variable was renamed to SYSLINUX_CFG in poky and
openembedded-core with the commits referenced below.
This commit makes a corresponding change to fix the build for
xen-image-minimal.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>

git://git.openembedded.org/openembedded-core
commit e38c94d6bf83ed3ca7f046d9503e81b927487bf2
git://git.yoctoproject.org/poky.git
commit bb1c719250cecc8725147cbdd999a9a44a11b549

  Author: Robert Yang <liezhi.yang@windriver.com>
  Date:   Wed Feb 24 01:23:58 2016 -0800

      syslinux.bbclass: make vm and live can be built together

---
v2: no code change but updated the commit message to add
    reference to the previous change that made this necessary.

 recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index b8c2002..94240f6 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -50,12 +50,12 @@ SYSLINUX_XEN_ARGS ?= "loglvl=all guest_loglvl=all console=com1,vga com1=115200,8
 SYSLINUX_KERNEL_ARGS ?= "ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5"
 
 build_syslinux_cfg () {
-	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
-	echo "DEFAULT boot" >> ${SYSLINUXCFG}
-	echo "TIMEOUT 10" >> ${SYSLINUXCFG}
-	echo "PROMPT 1" >> ${SYSLINUXCFG}
-	echo "LABEL boot" >> ${SYSLINUXCFG}
-	echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
-	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUXCFG}
+	echo "ALLOWOPTIONS 1" > ${SYSLINUX_CFG}
+	echo "DEFAULT boot" >> ${SYSLINUX_CFG}
+	echo "TIMEOUT 10" >> ${SYSLINUX_CFG}
+	echo "PROMPT 1" >> ${SYSLINUX_CFG}
+	echo "LABEL boot" >> ${SYSLINUX_CFG}
+	echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
+	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
 }
 
-- 
2.1.4


