Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53453FF8864
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 00:34:03 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1627.1777336437601536714
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 17:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=At6RuILO;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso6798983a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336436; x=1777941236; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubPA9LD1kUS4etl8TsK8jQhoRYKVD8LMyx5W6AeNJo4=;
        b=At6RuILOwBm2UBTn2sDfcNsBx1dS9ZA01IyLT1NZpvFbooON5ti8x0vK4xnX6AHOov
         O9UfGX93g6CBCIc+OW3QohZs6I1AagU6shOV9CILW6AaS78hCgdLO6wT5HgsBUtUuAFQ
         LbHJY30K4zhdXf3CQRfrN9eH5jO17PGxSTEN2+pz8oWclKBPem/IoxXrEu4oRybJ0Z7h
         vb1y0d4VlHOZYD+WJ9XlDxOvt4EdrcrpilLH3fMEJ/8lqrDXgKIilpwhC25YBQ8sDrPv
         xQtu5ukLD6fDNsBgpapB7f1r6tE4KQoZpdpMzmgEdbC77zk28L55LBAefsE2aLu67MHj
         VCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336436; x=1777941236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubPA9LD1kUS4etl8TsK8jQhoRYKVD8LMyx5W6AeNJo4=;
        b=dyaFTQrSvp1XwQjBtmMDYUx9zoDmr/IebNac6RKBCjn7ahNljb+tK3vANiaYOZkNEo
         ha9PzpKILvM76BZlkeHHCMuRYgxqmBuysVWUKVTo38qjSVAnK8X41sKj77bp+VDhuHBe
         rzoROTItb5XBRgD9ltAeBwZJ2taI796p2cHtecQcnW8MBOQ94Ac6rzQUX5YW4Y0rhvtp
         QGnN9r+Tn2RXqU7zhRMsTVuHiwBQO20NnMDmjKazbMrhWMypWZOUsuDrGVWfuAF5P9VE
         gVAHRz/ZgK2YK8Q9YXcplxIaCh9osPIPSgAc6T/Jymi+YCWrUAR8G0+2AaxAM6Gll2AM
         RfhA==
X-Gm-Message-State: AOJu0YxpkoZ0LEpUVCBisAAxn/T5oDWgU4reOIPBeB+dE5vVQyf3b74x
	oVPlLVpgfpFxCbhS320fh3c4n4kDvBOkLR3iXkWtDAWckAoaSbbVCLT0wn4plP5X
X-Gm-Gg: AeBDiesT/4MLMC9r7S9AoXuOQ193LpRVaXrKOZfCEfMfU75+PSAJ7POpwCUbJvSSiJu
	ySvwrNqFO12fR+Qo6v9gM0wWlUiy8JttHAGRKVNyon28/F6zR4DfmtvyQK1OdINiK74q28EMNFW
	Rl1Ow76r/iEheAgyTXWY88keqHPyce2hrzOtycaqQyXOzcPS4aFLNjZY1kZCdMixCXYHQtrg1uV
	tirMmGe0r8Kwyb2CWCqgyQMWZacd70k62phNZKoAtDnH3YhP5aXyWCrjJemxY2BLJq3f3Pjpu6Q
	YvKFX6tX2SQS1DinTkV/daUNnmi4sLcf5hknKPdqKIknF+/u4D+DtLRgYIPHAcGcxA2hz4LHSZt
	W9rctKsYJz91sJ4qts+98R5r4oE8PSV76UKEVpyC7tZh6roSu5og3aT0emnQ+s4CbWnRGGcvUUr
	NRz2xqPEesCZv71orLGmRWj23y12osr4/kTWgrx3x7jtK1qzk1MnlnO072w6JA1gMXXDpapWBsZ
	6oUChKf5xMtLAcxnf3oVHP3TgaKKU+z2g==
X-Received: by 2002:a17:90b:1a92:b0:35f:bae8:3531 with SMTP id 98e67ed59e1d1-3649207802emr766996a91.25.1777336436326;
        Mon, 27 Apr 2026 17:33:56 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490dbc8adsm763155a91.4.2026.04.27.17.33.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 17:33:55 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] test_vdkr_registry: fix test_image_requires_subcommand
Date: Mon, 27 Apr 2026 17:33:41 -0700
Message-ID: <20260428003340.78253-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 00:34:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9748

vdkr.run() merges stderr into stdout (see conftest.py), so the
error message ends up in result.stdout even though the script
writes it to stderr (>&2).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 tests/test_vdkr_registry.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/test_vdkr_registry.py b/tests/test_vdkr_registry.py
index 9073444d..72a27169 100644
--- a/tests/test_vdkr_registry.py
+++ b/tests/test_vdkr_registry.py
@@ -259,7 +259,11 @@ class TestImageCompoundCommands:
         """Test that 'image' without subcommand shows error."""
         result = self.vdkr.run("image", check=False)
         assert result.returncode != 0
-        assert "subcommand" in result.stderr.lower() or "requires" in result.stderr.lower()
+        # vdkr.run() merges stderr into stdout (see conftest.py), so the
+        # error message ends up in result.stdout even though the script
+        # writes it to stderr (>&2).
+        combined = (result.stdout + result.stderr).lower()
+        assert "subcommand" in combined or "requires" in combined
 
 
 class TestRegistryCLIOverride:
-- 
2.50.1 (Apple Git-155)


