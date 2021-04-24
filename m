Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.4165.1619253082062552907
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZNUHEfTN;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id x11so51903713qkp.11
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RqgbCZBNW3NXdfcUAoCn1TvOjr2Y/D/wJuVmWbYNAb0=;
        b=ZNUHEfTN1gNFUtRP0XsrxRObvpmTGM/x/+n2X0p+9FfXKnMRY9YVn2q6jTHMTwdbxm
         UoEKibi0H++fYGqITU/hR9SXPqaWT3wUc1JmAE/20nYTz7mVLJh1KgCQSwPq/2uh1tCH
         1fTuhJLq6T9Pik1whXJhSl4FMDnln6CrC8O+6jSd3PuCGaj6hazcITjpttGLmfYeEvBf
         es6rnA9bBuQD+n0XDE4igTW+AVqq+v+/8noyun5+zTFbNujzt4GqnUnNW3YOjWG3exlu
         MTts5mHiCBAU+eTkQPE1eNlxRokqR9Ic9kQC21aYUlV+V6Xiw+QVQR+KTIQwUU5C/ikV
         zbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RqgbCZBNW3NXdfcUAoCn1TvOjr2Y/D/wJuVmWbYNAb0=;
        b=biInsEabbww7OMQkGqs7iTkPFIu0xDXByCrvD/QQ/GtdbU4W5n9eOcSdcEFlPBrdFr
         MqRuPEEIuUQkj28/CbpE6R5FGCWDZHomErvsymNgidTFJhxWJsVselJfCaRLbbMLScn5
         K0HXXUE+HicFRbj9S1Yom4IFP8uUfpdI5aEHEa9XP4M2YclNwSP482KUY1XP97TuID+Z
         9Zlpc9Z4kvKmlk5Wkdtbs9S5hwz8fs9LP0FbzMGN9F+QuJ2c2I2VCbwAuEc0Q+qxPHg8
         8OSjKQqgdrD8t/yJQq1zpeyBVILvg+px16cfn6q24MC0A8rB6hsucmxvRQfcXYDF8q1i
         tq3w==
X-Gm-Message-State: AOAM532YQ5UZ72arufz43dWS/ARd5F/+1BN8CCCAVke5Z84u5eVVpYQ9
	A4ORaIy/Q8LR+UayAdET1qsRhRzD9YI=
X-Google-Smtp-Source: ABdhPJyHlG4Q6um7+CVKvOWnNbrg50dc4oypj4snVBC6vwiq85lt7ygpBE8deSBS2LNPXzItdOw9xQ==
X-Received: by 2002:a37:906:: with SMTP id 6mr7794408qkj.234.1619253080994;
        Sat, 24 Apr 2021 01:31:20 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:20 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com,
	ticotimo@gmail.com
Subject: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on Raspberry Pi 4
Date: Sat, 24 Apr 2021 01:30:55 -0700
Message-Id: <20210424083103.202107-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables running Xen 4.14 and 4.15, with Yocto Linux 5.10,
on the Raspberry Pi 4 board.

Sets a new default kernel preference for linux-yocto for Xen on RPi4.
Applies some clean up to the config settings and dynamic layer.

Tested with kernel v5.10.25:
 SRCREV_machine = "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
 SRCREV_meta="031f6c76e488a3563f35258c72ff1de3e25a512e"

Christopher Clark (8):
  xen, rpi4: use the preferred generic multiboot,module compatible
    string
  xen, rpi4: drop the raspberrypi4-64 defconfig, xen_git.bbappend
  xen, rpi4, linux-yocto: enable linux-yocto 5.10 for RPi4
  xen, rpi4: switch Xen-on-Rpi4 kernel preference to linux-yocto
  xen, rpi4: fix u-boot script to load binaries from boot partition
  xen, rpi4: apply workaround to fix crash on boot with Xen 4.14
  xen, rpi4: move rpi4-machine+xen-distro cfg into dynamic layer
  xen, rpi4: add xen-rpi-u-boot-scr recipe for default u-boot script

 conf/distro/include/meta-virt-xen.inc         |  21 +---
 .../distro/include/xen-raspberrypi4-64.inc    |  25 ++++
 .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 ---
 .../files/boot.cmd.xen.in                     |  12 +-
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  |  34 +++++
 .../xen/files/defconfig_raspberrypi4-64       | 117 ------------------
 .../recipes-extended/xen/xen_git.bbappend     |  11 --
 .../linux/linux-yocto-dev.bbappend            |   6 +-
 .../linux/linux-yocto_5.10.bbappend           |   6 +
 .../linux/linux-yocto_xen-rpi.inc             |   6 +
 10 files changed, 87 insertions(+), 168 deletions(-)
 create mode 100644 dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
 delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
 rename dynamic-layers/raspberrypi/recipes-bsp/{rpi-u-boot-scr => xen-rpi-u-boot-scr}/files/boot.cmd.xen.in (80%)
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc

-- 
2.25.1

