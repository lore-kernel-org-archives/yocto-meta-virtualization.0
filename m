Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4706C5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:21:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20888.1785111706951752910
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C5dqPcph;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceed7018c8so13153995ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785111706; x=1785716506; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evVPKuR7GBkvJtbrOeyJicmxl5J8VnATOrudt5ayuKY=;
        b=C5dqPcphS7uIGYPv+e6ELKUtHDpa8Zs55iKOdF9a86hHZl48sq2+4G3eFkCiYfZsJQ
         xcfMfOVGpj2BKLgaANPApT5UvqrntKpKMEyaOpkUPVCh92Tcxad4LlWWIWjL5wFASHso
         82IzWr4Y7pStFmc5jYrSOcLeA9n9roWfnGBw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111706; x=1785716506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=evVPKuR7GBkvJtbrOeyJicmxl5J8VnATOrudt5ayuKY=;
        b=XZ2/2PYYfaPRmTH+iNisf8ETGlYFTJrS+26ODtxj0kslStHpjOfx1J84xmQqcavujp
         tba5sAFgJdE9g/zakUJR+dJ0cmipH1X/q0XK89Dj1TwDcOZl1G+0Yi0WxxLxRCbXg5Ez
         5GcKqRddmV1CrbLtH64OvkA/2erU8ZWf/eBcLckod7dRi75Z/OB+Us//9QCuh+Phppg5
         eC4BjU2XQcztTMJ61bMBQVR20pC+EC6us5hqZPPSpQHDSKSmb6XOKQChAJFU9xO49zp9
         tRIW0FchYqDJPuFG1f/cNbvfjYUW93RXQVJKXiO1wWUgKPQ9VFjDo7OS6ciqYi+fXb1o
         Pu5A==
X-Gm-Message-State: AOJu0Yyy3CKPtnXUYrgdCWL4JcUWITdnEMhYYWXUwugZwkA2AI010x+0
	yi0Yv6yNwx/5844TZ9opCRrbAbGF2xmGj8Yep3cWCp7in6HoxYnFeii7igCtm9o9lfhkqTcLY6A
	15/o5
X-Gm-Gg: AR+sD135fvqLUfE/cjWwRCCNx2pE76K+1H4ie4yeKib3Vu/vixSnQXW8HE6LIVFVSxh
	icNqYpG2e6aeNfjHREQCs9OxCpcR52ba3qluw8Kxa8D+o63DJ5vHCbyskWb+rksYI539jUquUoy
	pblBDfZqj2Xl5SDtwtWUu8nejxhpt+qxmJtLBF0nUbkXOVkwn4Nt7w5K40sq38fR++MWJCOivzs
	RByhUytSPDm+ArV5IUtks9zlIFgfXpJNS41IY+gYN6+Kslt+JYukjZ2WFSiHozUVGFS4+cKMIkv
	1tn28ThSTnVu/C7cG/aI3jO6GJnQf0HPIZsr8sw/lP7N6cehf7HBuZAeIruS8kwojniAeQFjDoD
	rwsNhUGdNjuQJtezo8HYicZ1T3RI/OrDh/x6mVpgto/5dMEQG6eHPrX1wgbwOV4+PNYoZ0E8sZ1
	P7BgtxuQRnssAqE6XEjdo=
X-Received: by 2002:a17:903:19c5:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2cfde68359bmr55623355ad.5.1785111706331;
        Sun, 26 Jul 2026 17:21:46 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm25238035ad.39.2026.07.26.17.21.45
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:21:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 1/3] vrunner: add /sbin,/usr/sbin to PATH
Date: Sun, 26 Jul 2026 17:21:32 -0700
Message-ID: <51de6e987d775747a9f0588705837aed978f58a4.1785110917.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785110917.git.tim.orling@konsulko.com>
References: <cover.1785110917.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9987

From: Tim Orling <tim.orling@konsulko.com>

mke2fs (state disk creation) and iptables (Xen backend port forwarding)
live in /sbin or /usr/sbin, which many non-root interactive shells (e.g.
Debian/Ubuntu) don't put on PATH. Under `set -e` a missing command here
kills the script silently (no output reaches the caller), so make sure
these are reachable regardless of the caller's PATH.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/vcontainer/files/vrunner.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/vcontainer/files/vrunner.sh b/recipes-containers/vcontainer/files/vrunner.sh
index a32a005d..3de48abf 100755
--- a/recipes-containers/vcontainer/files/vrunner.sh
+++ b/recipes-containers/vcontainer/files/vrunner.sh
@@ -28,6 +28,7 @@ set -e
 
 VERSION="3.5.0"
 SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
+PATH="$PATH:/sbin:/usr/sbin"
 
 # Runtime selection: docker or podman
 # This affects blob directory, cmdline prefix, state directory, and log prefix
-- 
2.47.3


