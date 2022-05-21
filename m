Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C5DC433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.8874.1653159895426135774
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Letougor;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id n8so9881133plh.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GnSmsSyYPklhLV7Ubt4xFG/GefPYKZQ4u8c3QhP9eXI=;
        b=Letougor25+TOrFdC2PKPLaegpz3QYeoDePz2kqLeMYj5NL/SQbsoLe7iAM6UP72pa
         YY2ZfAOd+KrbGr38oIzzFjLyvfshwMeOh495ShR5g4ncG3tU1057YsPZWkxxHYaFBKzQ
         CwqhFCnyj3TYjUqo9X1koGbon9eydxWtb4Bjnk/0kEiSFVvVwYuIlJKl6fnEe3iZS795
         +9Ja75TYyVzHKD5Bz/Q2TUX01rElSWfFUzHATW1sW71aFPYIMHMHFBGdRauMqJkgYqig
         nncHm94cIeGP4wN1ypJVWwtZZOIQocUKYdRkZ2TgI3aFncc7Z5gipFNygCzYW08E6DA3
         q+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GnSmsSyYPklhLV7Ubt4xFG/GefPYKZQ4u8c3QhP9eXI=;
        b=KLjR5omHF76NsDYPZoiP/nxN4pAxTgtc0DQ1cYIKIOokx5TbDnGNsNP67Ff6yBUrpr
         6UOcfaCF0QZM1U5zRO0uzdwbJz2IC1IRPsLEnvNM0ro5hyhciBJrgcbf+1GZihC6YlcY
         GclDcfNDNTj9yj8KVOP2ebXT265Q+Mk6SDccGMULRDbccpFhh2ja4UTpmpS8l480C6rq
         IVl4vkLewPE4qqE6yKEiOVGh4UBtynkoiDjiOrbjn6E7tczzYN3kt0iVTgDgJD75g0Uj
         2IZiKcPiFcIKLCaGiRuWzsWUaBlPXktAUsznWdl2IkEyVpLa4O9rZo/1/TEhB5ynjAjA
         088A==
X-Gm-Message-State: AOAM531h+Jc2dHPPZ/1BXosak4rHVnP5KarJ/DwQyakjm4GooE1aw26v
	ARWzY2JMXNaYgO//jCOUFsjDpccnBPY=
X-Google-Smtp-Source: 
 ABdhPJzF4VlY+3GnWkDRIyEX9JOMRnjSivRBEvlGe7l4isKr2+FgL0uV40Eg9wljMgym4cHj1Mf4Xw==
X-Received: by 2002:a17:90b:11d1:b0:1df:9cbf:87a9 with SMTP id
 gv17-20020a17090b11d100b001df9cbf87a9mr18276685pjb.39.1653159894207;
        Sat, 21 May 2022 12:04:54 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:53 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: 
 [meta-virtualization][gatesgarth,hardknott,honister,kirkstone,master][PATCH
 0/11] Xen on Raspberry Pi 4 fixes
Date: Sat, 21 May 2022 12:04:36 -0700
Message-Id: <20220521190447.135705-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 21 May 2022 19:05:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7298

A series of fixes applied to master and across stable branches where
needed to fix running Xen on the Raspberry Pi 4 board.

This updates Linux kernel configuration for Xen to remove tracking from
the linux-yocto-dev kernel, either by applying a fixed revision and
specification of a stable branch or replacing it with the linux-yocto
kernel. The Xen build configuration is updated to remove the hypervisor
defconfig for the Raspberry Pi and drop the arm64 prelink patch as a
license correction and since the build no longer needs it with the newer
gcc toolchain.

Tested on hardware.

Christopher Clark

gatesgarth:
  01: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
  02: xen: drop patch to workaround prelink on aarch64
  03: xen: fix boot on the Raspberry Pi 4

hardknott:
  04: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
  05: xen: drop patch to workaround prelink on aarch64
  06: xen: fix boot on the Raspberry Pi 4

honister:
  07: linux-yocto-dev, xen, raspberrypi: remove tracking bbappend
  08: xen: drop patch to workaround prelink on aarch64
  09: xen: fix boot on the Raspberry Pi 4 with Xen 4.14

kirkstone:
  10: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15

master:
  11: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15

