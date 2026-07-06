Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A3CC44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:13:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155195.1783358028919035407
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHFkRabX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8482074a000so711581b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358028; x=1783962828; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2dvIqSxj1AMtWoYeZBy+kJbK/9QuExiGTpABfgj7Cpo=;
        b=CHFkRabXYFYyzXdBXo161RHVvCeFeNKtipXSmXwiNyk+LWapy1nNaOVYfEdfHKNBqq
         METu/wyd/2ppKqTTUdr7gFHBDGA7AHOIMaz6JRhN7JlqoCOiEOiGFfdgwteH3GYBadW7
         KQCp8mrp/tT26dPBxXSYXdiKmKjDzzgxw4DMAjWry3jsRXNwrp6QWaOd/EC6wmlTzITR
         R504FrJc366RFy7TMKmnaNx7sGBwmYWFwaJEA/57QxNVXKKyYdt+4BrpbGRKV0OAGQlj
         xOqp1eJPyhSx/kPONXrPJ6Ffy9Dm9vWwNalGh78zFy8V2AlboRZuzwJBghz3aO+5ypJQ
         mcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358028; x=1783962828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2dvIqSxj1AMtWoYeZBy+kJbK/9QuExiGTpABfgj7Cpo=;
        b=fUi46dgoYtdKF5KhWX+GbJ4p8z/npLJYCgYWSZhBcOxFSX161Xr6/hAWW7ByUCxYBZ
         4Yw1StYw0NqvSyi3U3Ii9sqInwFhNifPyv7/8OoMifbET43haonyPYC10DwwzFopbJWx
         jVkEIviJBtxTeDHP0c4JSDxImfbU0jfPdFubnvp2zBqs5q/JgUn9i/OGw6cIvFayMruh
         nDpM82+ftEWN1ydO90OvPHTDOWiTRIhQ9WXWBsDhLDWjJuAfOzXsfFEw8bZ2lWxbU4Xt
         DAP70yfB9o9gT3Ist+0S/TKrpLRKOKXoaAJMGG2jQIdNa+41DkEW4F7wXPiPXh6+zr0W
         lTcQ==
X-Gm-Message-State: AOJu0YwQEhmwXGwHlpqDeHaW+PZuHD+8KAFpdCtvTR11ClQINNxdQRaO
	Iavmh3QnUniycByvLtlSJayPTmeiNd88TeJMx5+W/U8jz9KESqN4602jqAtFug==
X-Gm-Gg: AfdE7cm08Zwh2l5fonApiAISbFXVDYZGthHCotWq8Ldrydi5y8Q0lPx/OaaScW8BUbo
	ob14f/CMnk6Kl4LeE5dmipStFIK3CT9Mw9m4RY+4lp5RUPcAPLuryaufCyuvO/SLeNc6MV9zTMk
	vzhnn2NLDtkXT6u1XGeiDQ5ef0bBwf0FNNoRUBRbGdV/3eIMYg7yMUstz8HPO8XkUoqV+K64Z9A
	FUiRnuSA/XvUiNNKIXNxrazdH0jga0KaK32bsE10wy2Pa57IOKcGj11mpr+EEp00keuRS2KW1bf
	oSiG7is6iFqXHVCiyO9qCu9OPRieVypxEv1aY/2lJS53CHVojGBCTE8QQiDRMCpgHqdhGaskUIh
	5rg24UF//BaH6ioaL/gwMp9GVX6/skaBJgA/fKyMHBWy/cqcRQfw9mA8faIyUuKSTC2SiyUdxkS
	qosscZVAAjmAF32ZdkN4ZAh1E/jZxR8XhZhYxnJygh6P+6TydVGitKadHbBW7iKFqbK/tYP5dXV
	i0TPHD1zh5c
X-Received: by 2002:a05:6a00:398f:b0:845:e703:e with SMTP id d2e1a72fcca58-84826cdc4e5mr1357987b3a.19.1783358028280;
        Mon, 06 Jul 2026 10:13:48 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.46
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:46 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 03/13] classes: add container-volatile-fixup.bbclass
Date: Mon,  6 Jul 2026 10:12:38 -0700
Message-ID: <a2622cbe7eac432a49ebf331937e12dfae49d320.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:13:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9927

Add a ROOTFS_POSTPROCESS_COMMAND to fixup 'log' and 'tmp' in
/var/volatile.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-volatile-fixup.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 classes/container-volatile-fixup.bbclass

diff --git a/classes/container-volatile-fixup.bbclass b/classes/container-volatile-fixup.bbclass
new file mode 100644
index 00000000..1b8a4c1e
--- /dev/null
+++ b/classes/container-volatile-fixup.bbclass
@@ -0,0 +1,6 @@
+# Workaround /var/volatile for now
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
+rootfs_fixup_var_volatile () {
+    install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
+    install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
+}
-- 
2.54.0


