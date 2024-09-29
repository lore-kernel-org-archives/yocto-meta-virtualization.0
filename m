Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8F6CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 03:59:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.26615.1727582363699235449
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Sep 2024 20:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F9j4oYd9;
 spf=pass (domain: konsulko.com, ip: 209.85.215.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2411604a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Sep 2024 20:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1727582363; x=1728187163; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqJBmvDmDKZUDLqwEoHW95yJo8AeeCJpDZX36Nad+yQ=;
        b=F9j4oYd9gO83LUfSR6+Z9Ak5/M+2U8V/n5jkYDGim8mc0aR51uP2dqsX0oFyQoq8Sh
         YWcOKNXt8KYuAg36pdg4qHL2ek3L2EWHlLavHVhQeWxkKechbzHiVHARgNtJHMwDzmYS
         v28GFlHDk/YNXdT6N8Ncrhp7xmTPDD9wdIFWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727582363; x=1728187163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqJBmvDmDKZUDLqwEoHW95yJo8AeeCJpDZX36Nad+yQ=;
        b=HzWljOaFT+ubbU8Krfvh2jiH5mtUzOY+4f+j3SfMphJSntIarZJYrTnhVf7dPwSIU2
         lEZtmqVV7g3FgMqu2r0oV8LYRUsAfTtHsZXYFQacry2Zy78M9FCw0fWizL4r4c/nNgsc
         i13kwyEv+BlMqIhH15ZpQ5VmbV1XQNJXyfFW4PpLJsjruOvDbZbLHUeOMfd1+SmWzqSs
         H561XMZH2h/dZj6USfguJPWVlM1BG3OiDlo6CH/jgXxvT3z9XJuK2rA6jv17lEtDMLvm
         giS+V2U18wMF+zN+k0fjE5V306CSaSqEDSL0JhFflXJoJvv8rCXgaSeJd3xTfJhmDw2q
         OhoA==
X-Gm-Message-State: AOJu0YxdIkZmz+t01ZGZZ5tXTRx0fD+RacL7jVdu3E2X5Bv8uDJVj+ve
	0kspKciV00KhiD/HTg+KvotKcOmBjzSPZcuRTtI5DZu+wwwXL/BIDSDbVGu+qTkE2HAHkaFYgct
	LHsY=
X-Google-Smtp-Source: AGHT+IF9gEub90mDxyjRJAUnL5DyJHkToTRdpshmbP/+YHsJLwn9Kn+xZlVcHW1JqVQpWReberootw==
X-Received: by 2002:a05:6a21:168b:b0:1d2:f09e:c15b with SMTP id adf61e73a8af0-1d4fa6cdf4emr11892962637.25.1727582362572;
        Sat, 28 Sep 2024 20:59:22 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b9407sm3487302a12.23.2024.09.28.20.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 20:59:21 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] libvirt: ensure sysusers.d path for libvirt-qemu
Date: Sat, 28 Sep 2024 20:58:29 -0700
Message-ID: <20240929035828.26171-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Sep 2024 03:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8902

From: Tim Orling <tim.orling@konsulko.com>

In 8138d9cc7e0c31171230110db0cfa881c46a821b the path to
/lib/sysusers.d might not exist, use install -d to ensure
it does.

Fixes:
install: cannot create regular file
'.../libvirt/v10.5.0+git/image/lib/sysusers.d/libvirt-qemu.conf':
No such file or directory

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 1175e737..bef98b69 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -208,7 +208,7 @@ do_install:append() {
 
 	install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
 	install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
-	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
+	install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
-- 
2.46.2


