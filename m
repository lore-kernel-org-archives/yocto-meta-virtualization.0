Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5109C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:21:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21254.1785111710095707577
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dY8RWAMj;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccf2360620so18900865ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785111709; x=1785716509; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qBC+pmnN6OyeX20l3xlhKFC4MRefdriHIsXSlMuGMSA=;
        b=dY8RWAMja61dzfUXQAW1zzlBjSrTnRY4z6I6iP5aXZMDaCO3/Nf2uLzHXP94ZxVhsC
         6EnJ1VPiv8hUokgYr56ZRMbEimm17BWWpZKCASFRIZHrF2uuR755EGdkSfDzDAL/fuca
         hdir+6Dys89zKeL+hfwfpHc833huRZFFxpy5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111709; x=1785716509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qBC+pmnN6OyeX20l3xlhKFC4MRefdriHIsXSlMuGMSA=;
        b=V7DKxvFlfxgbbjyPuiLN80tI7OLBjlSuilcetKISGZR8yBtL9DLRlPXkghOvZgsdPb
         sJ69pkTz3/B7Qe/BN+o6kpGS2psMI6YZfPQXcBSvOXpXiMevPaYkmcPqNNJdO9tZGv/G
         hBfWpIY0//lpmE+6dFRGeRlkTPYyUhFi3WeumfrGkC3TTSTV9MhqC6CTfarycQgn+w7x
         jOP/W8d3ezI+ptf3OOy23C+66oRlvMj9nWInNauk+AMlDy42OioNyEnr47RWUs2XzdIc
         8WwXPJMC9WFxbFr0HSc263imoWG2eevDFOKM/ko75KRC/zsMb4paN8ojq0gWxRSFMq3k
         T/mg==
X-Gm-Message-State: AOJu0YyTnWBFQ5fEvbZQSu7dXqog0wOhXs6VaXo0VfkB6HZBbCqRyWK5
	NGwbkIHGIm3qHPLPdQhiMe/1JuznPBpqRvFqB62dQaPy+o7G+ayjQFo44RGiUgFZrN5g4+9HHM7
	I9MxE
X-Gm-Gg: AR+sD107P33NUC1t2pG6UKFo4iiOEb+fF4YqqK5FRW7fyq+YgC6ANr/HZRttvW4jbOl
	+sM+jgl0tq3gIG2xQlQ4gwZZ7Vk3ZDQsoEj/kx8qr/4WG/vRX8fLFQtMBw3Nsj6TTjzX81uzIEO
	cmQHESD2GgBeXyUVbYyreXAyS7ypCUT/E2KkcEQOi3NKBzcULn/4WUPIKqkKEPeJGtZTSVX/Huz
	49OV6oSLhoptdrJ2QpjE1nEOO3CYUAKBlpH15u1P4V8mUWaAoTUTnGULTpnodbPyUrSx+zQW4N0
	SpvBeX1lQ2tgkfhLPOKniooNIzBpjIeZqFcVOIt7eV84OtqhQ0vsSuf874bSgXh3drVEyXvxu0h
	aCsSAb4TjzRmHgj5aHQq182hVUlRPz+ni+MMd54eGjpB3vmiy0hK+pJn82hBji7jDg5F1jduey4
	/0OrJpXs7yAKA/dyz5icQ=
X-Received: by 2002:a17:903:1aa7:b0:2cb:2b84:f431 with SMTP id d9443c01a7336-2cfde8a6856mr61133625ad.47.1785111709513;
        Sun, 26 Jul 2026 17:21:49 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm25238035ad.39.2026.07.26.17.21.49
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:21:49 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 3/3] tests/conftest.py: memrest_stop timeout=120
Date: Sun, 26 Jul 2026 17:21:34 -0700
Message-ID: <76663da09cf268817d875971c8fd11cf4820ed96.1785110917.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785110917.git.tim.orling@konsulko.com>
References: <cover.1785110917.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:21:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9989

From: Tim Orling <tim.orling@konsulko.com>

Match the documented daemon_stop() worst case already used
elsewhere in test_vcontainer_daemon_lifecycle.py.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 tests/conftest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/conftest.py b/tests/conftest.py
index 6258611b..67718dcf 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -495,7 +495,7 @@ class VdkrRunner:
             cmd, proc.returncode, stdout=output, stderr="")
         return result
 
-    def memres_stop(self, timeout=30):
+    def memres_stop(self, timeout=120):
         """Stop memory resident mode."""
         return self.run("memres", "stop", timeout=timeout, check=False)
 
@@ -794,7 +794,7 @@ class VpdmnRunner:
             cmd, proc.returncode, stdout=output, stderr="")
         return result
 
-    def memres_stop(self, timeout=30):
+    def memres_stop(self, timeout=120):
         """Stop memory resident mode."""
         return self.run("memres", "stop", timeout=timeout, check=False)
 
-- 
2.47.3


