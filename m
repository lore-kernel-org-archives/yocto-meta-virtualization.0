Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55C6C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:21:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20889.1785111708706961274
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rHA9dEtB;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceb096e675so25072115ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785111708; x=1785716508; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=un51YRemmTXosv4jiFYnREyaXhD10S4zqZXR88AAJuY=;
        b=rHA9dEtBqMKthJ31DqTJFKT0yPUUNZQP8Fa8xVGaqzoHwCWnaeSVe6KVj49DTJOJFH
         BatVZC19F5Jf0TkOPz6ehmpst5wZz0aOpiBY8sqgCDle7E8qyI8+SLfyOxz4e1qBuWpm
         yM5WGtQ4AihwHzOqEaCDaOrKL8TAndbUOe0tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111708; x=1785716508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=un51YRemmTXosv4jiFYnREyaXhD10S4zqZXR88AAJuY=;
        b=W5LyEum3lhP/tLQ1F/fvht/pnFyJtBg6Z0d0S4DgcDV3p+FQqDi0aNDYP2uCAKCswF
         2Vf+TKSanRrcbgCXsFXovu+TtoKR7VoCl9GADZe7X3Q0CakjcJGSVJdJba+Ec2KhRPzh
         hGWwF7qX4kV831hmhqGNqalxFZLN1d1VwVDv7TngHRT6lNW8ifYdhAN7BujV/8vARhD3
         bK2cGl3qdSK20mCwSiun5Gh7Tcm3N++03r4QR5tFDAeiqrbV055srCUg+rN0Q12Fffcb
         JBruTo8FcZqMdRJw5OyGJKzZToOTO1y+1tPKLMTH+RtqJ485FXL/RJyjTiWYBjJkIqUZ
         hmkQ==
X-Gm-Message-State: AOJu0YwqHRY5hGFfB1ZeedyxWSO4+l9olxreuG/usz/KARJgSAXuqd1u
	SuhkXAfxG8JbTzhxp9ccKBpfYWnJwsIrp/FV/8l43zvGELMhFdZG77wCBP6Crxtrmub4waGuG3D
	5gBaV
X-Gm-Gg: AR+sD10PLsSfzvkcVnp6Y/l67OMHctykEwyCiQlUAq5j0IZNZovzzN1OCPEx8W6V5yE
	SPUkn8zbnXeJhx7Lri/hSNyVnwmtJmcPpg3OFJ2d2jkKaYoI0MdAJ9oUb5JAnS4AU6QcBPTKuqw
	GxDsZvZMgILbnyzOdG5nlIhJfAjd6F0he8nF268oze2BRHQpt1zVhhvoIf25wrv1HDMlG+hePbS
	hkOvzdR4PpkhTbvqFvFokVAwtMNw6oyegAbc/t+g3ydUZZAn5iTL3eckakuFMGPC3HdtpG4lq8k
	m5nx9VA+bk3GZhcDqIHK2UFbHZdytMNDGGoADqqqtxaQio++gRwkqbY5tE8lvQlSNxEa1eR214K
	pIk8pjIIn4+iSqd9sldzt+9i0+qGp+u/25HcD8b0XqbGEd2OaDVgHHq0JCSJusa0zM63MpbmqNq
	FSe10XKJ1rxZuLSV2IjsOFUkhYZcDpJw==
X-Received: by 2002:a17:903:1965:b0:2cf:c532:2603 with SMTP id d9443c01a7336-2cfde880ccemr56547075ad.35.1785111708046;
        Sun, 26 Jul 2026 17:21:48 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm25238035ad.39.2026.07.26.17.21.47
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:21:47 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 2/3] vrunner.sh: fix daemon_stop() shutdown reliability
Date: Sun, 26 Jul 2026 17:21:33 -0700
Message-ID: <11a5ee4115768dbba2ce6ea002bd8ac75619b62d.1785110917.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785110917.git.tim.orling@konsulko.com>
References: <cover.1785110917.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9988

From: Tim Orling <tim.orling@konsulko.com>

Hold the connection open briefly after sending the kill command
so the guest's "===SHUTTING_DOWN===" ack has somewhere to land
(mirrors the ===PING===/===PONG=== handshake). A bare `echo | socat`
closes the connection the instant echo's stdin hits EOF; the
guest's write of its ack into that already-closed channel then
never returns, so it never reaches `break` and graceful_shutdown()
never runs -- every stop was silently burning the full 60s and
falling through to QMP quit / SIGKILL instead.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/vcontainer/files/vrunner.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/vcontainer/files/vrunner.sh b/recipes-containers/vcontainer/files/vrunner.sh
index 3de48abf..7ce71a4e 100755
--- a/recipes-containers/vcontainer/files/vrunner.sh
+++ b/recipes-containers/vcontainer/files/vrunner.sh
@@ -669,7 +669,15 @@ daemon_stop() {
     #   Error: reading blob sha256:<hash>: file integrity checksum
     #          failed for "<file>"
     if [ -S "$DAEMON_SOCKET" ]; then
-        echo "===SHUTDOWN===" | socat - "UNIX-CONNECT:$DAEMON_SOCKET" 2>/dev/null || true
+        # Hold the connection open briefly after sending the command so the
+        # guest's "===SHUTTING_DOWN===" ack has somewhere to land (mirrors
+        # the ===PING===/===PONG=== handshake above). A bare `echo | socat`
+        # closes the connection the instant echo's stdin hits EOF; the
+        # guest's write of its ack into that already-closed channel then
+        # never returns, so it never reaches `break` and graceful_shutdown()
+        # never runs -- every stop was silently burning the full 60s poll
+        # below and falling through to QMP quit / SIGKILL instead.
+        { echo "===SHUTDOWN==="; sleep 3; } | timeout 10 socat - "UNIX-CONNECT:$DAEMON_SOCKET" 2>/dev/null || true
         # Poll up to 60s (120 * 0.5s). Generous enough to cover heavy
         # ext4 journal commits; short enough that a truly hung guest
         # doesn't block the caller indefinitely.
-- 
2.47.3


