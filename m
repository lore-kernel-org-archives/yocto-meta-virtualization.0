Return-Path: <cjp256@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7916E015BA
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Oct 2013 19:23:23 -0700 (PDT)
Received: by mail-qc0-f173.google.com with SMTP id l13so779984qcy.18
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Oct 2013 19:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lCSsVV/vIRYB1assh2oYlHlBLx5vLpdWwyFsv6q+pIg=;
	b=W80qOFM0LH5ZIlPW/MB4VBROwy0tmxOKwDuhiglc6uUy7MvP4TXeeDLhIf0WPL861V
	RsiPyApyc3yf4vsjdw3DMWDRWP6YqhbBql29HkxKSR9w9yHR9YpUdfNNR99E7SD3Ts/e
	Uq32tFizt8TcE950ocTyVjNeLPk7NGa743/2s0vzhhdL+wiDFVsawirch1ETyCcf+lau
	gxAksOTNdHyl2oG85hkbOdWuapLPFJTH8WLVLeWd3+Rzucc0q5vxwhabk48rjy3QFVjH
	nTieoifdELYSqx4HZVXWkEYZWWHcHNeuCP4UiNGWZig2gnxWAMfIbEmXN7mkgfnadx++
	/4Gw==
X-Received: by 10.49.110.36 with SMTP id hx4mr851902qeb.93.1381371803271;
	Wed, 09 Oct 2013 19:23:23 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id h6sm82159945qej.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 19:23:22 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Oct 2013 22:22:48 -0400
Message-Id: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH v2 0/3] Xen guest support
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
X-List-Received-Date: Thu, 10 Oct 2013 02:23:24 -0000

This patch set supercedes:
[meta-virtualization][PATCH] xen-guest-image-minimal: example image for a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
[meta-virtualization][PATCH] linux-yocto: Add xen guest kernel fragment support for PV/HVM guests, using 'xen-guest' distro flag.

v1 -> v2:
Consolidates xen-guest.cfg and xen.cfg into a single fragment that should be more consistent with typical yocto fragments and satisfies requirements for different types of xen guests.
Simplified xen-guest-image-minimal to simply append console=hvc0 kernel argument instead of the special syslinux config handling.

Chris Patterson (3):
  linux-yocto/xen: update fragment to support both dom0 and typical xen
    guests.
  xen-image-minimal: update image installed modules to reflect xen
    fragment changes.
  xen-guest-image-minimal: add minimal xen guest image.

 recipes-extended/images/xen-guest-image-minimal.bb | 16 ++++++++++++++++
 recipes-extended/images/xen-image-minimal.bb       |  6 ------
 recipes-kernel/linux/linux-yocto/xen.cfg           | 13 ++++++-------
 recipes-kernel/linux/linux-yocto/xen.scc           |  4 ++--
 recipes-kernel/linux/linux-yocto_3.10.bbappend     |  2 +-
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |  2 +-
 recipes-kernel/linux/linux-yocto_3.8.bbappend      |  2 +-
 7 files changed, 27 insertions(+), 18 deletions(-)
 create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb

-- 
1.8.4.rc3


