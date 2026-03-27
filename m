Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179F710A88E5
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:10 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74030.1774620420979624464
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 07:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=yz6C5nmk;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.53, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b8ebe6bd1so86257f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1774620419; x=1775225219; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWx9Ft1MaFIF58/a4S10WLRU7Dq85kxelhWr9ES4kL0=;
        b=yz6C5nmkX704/XL2B5zewRiBmSmjBaDTYNXg7txFxvqH5pS1wNZZkRsLGur/st/x1e
         S9qXbvpp+pPDqrqu3Jy+VuUGe8hvTJLEgY/iBHuHmSxBzdtwRekqngUhfHXdkmJcHmac
         xtyFYfYpPYcO3ahfRbDoiHNxmziDMkver/QwGhqPC4GBR7Ikk8+ij3x2nii9VG6oGvIK
         z91k+XCKO1a2wfPqht7V4rcZC6B59uzgm5fzYBR2qdibiQtgMB1kbLHYUA2taIcwHTQE
         XfHvRGh7vhyRdnpZDlN1T1Qq/XuxDQb49+LE03x0ROdbvFE9Y5CxT5XS7SUR0qQz2qse
         v9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620419; x=1775225219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWx9Ft1MaFIF58/a4S10WLRU7Dq85kxelhWr9ES4kL0=;
        b=M/sD9mxt+SQxzYoZSsoxeBAjvgTsK6H3SjV5cBvmNdim/GYcjZCoZ8xiNNneVl6fPf
         BXD+wSIggDXbzBrgH8EFEwxNfvhdgjzj+z5RfUkACm4hrU/P85eFrfVvPEcGVai5JCWc
         C0g7rn3+9Zt7zkpAcMaLSH7zym8vh9B2d7ll3w4zC0JjkYNapyHusnMXLh3rSdxNssxF
         3nySz82+MC9ty0WNxnplyKRbm2UGydU5bmMJqX0Fr8zB76R9Mp/JKr3Y1+yzUjmn6XWU
         qCgteuIaJIKBF6FP4aPFplEwElXXj0fBtv+2HudvAX3BFacDtMYAF6EsUWvSiDG/UNfZ
         hB/A==
X-Gm-Message-State: AOJu0YxPsjdIkSInTkQOv9qRX0dMzkjwmNAvuxgIou4sEkromLMefe1M
	nu1+L3P/HS41jC6vWUo8rIGTe4NHt2sjTy0Xb840rh0g9z6OXf1LT2y5Xiuc8d8NIzZuHwgyeE5
	IUWNBgtiFABhYygn6/j7+B8Vc45iqNZzKILRYp5l7RoWVkbrXuwTCmyBeDkYt+cL720W1NnpOBJ
	tWA4LoCHBc6gfbuyf+EA==
X-Gm-Gg: ATEYQzxMXMaN7ZrFttqbTDqTZQV/zdcGkt3ztFC13VT5JbKCqwlCMu+wQGOJ1Un0Ssx
	zE/iEtDTfVnSJ4ruwPmYShvfud85B6ScpnlgJ2iKZ5GY6qYtV9d0wV1Jogjo5cDYMmeU7h2H884
	vHaKn8BzgzdA2yOfSvALDXUl8Q2xde/FP8kTI74AJsxoIn4pbag+YIkKpnoappdBgxNOfxcFrgC
	eYqO1SRHDooNY30tjvpOUk8urLK/O7K3LermYruH/OlKxttsQl6E+vSbvvoWcmWtquj9FU9FNYu
	Vd2AjlJls1sDARsAvZhMXS/UblZN14jNbT7bVYKz9U6A6LRGnpjleA6YVYAkIh/2OnIoE7T9LHN
	3e1t6BnMCSNlBYF4+OD0xj1ZfBAdaJ/BLYVMfZwKk9UrkoN7td90oZDxwxBm6d+FIPLCRBAj4Tl
	JBrGTJxkwXQHiT2PaU+q4To7DUtrIuVHs4PxL6T/hQegAhqsY/SHff+iuQvz/PQf0lpC6sVh7sw
	a1HLQ==
X-Received: by 2002:a05:600c:5249:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-48727c8680fmr27352985e9.0.1774620419348;
        Fri, 27 Mar 2026 07:06:59 -0700 (PDT)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c957b9sm152397465e9.8.2026.03.27.07.06.58
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:06:59 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 2/4] runc-docker: update to 1.1.12
Date: Fri, 27 Mar 2026 15:06:38 +0100
Message-ID: <20260327140640.126833-3-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327140640.126833-1-jonas.gorski@bisdn.de>
References: <20260327140640.126833-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 14:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9679

Bump runc to version v1.1.12-2-ga9833ff3 with the following squashed
cherry-picks from master:

    da840d8845cb runc-docker: update to 1.1.12
    22877e9bd046 runc-docker: update to 1.1.11
    22989818f3af runc-docker: update to 1.9.0
    dddc423fa370 runc-docker: update to 1.1.8
    248be027d611 runc-docker: update to 1.1.7-tip
    4aa2aadb01e5 runc-docker: update to 1.1.7
    195db7f7c536 runc-docker: update to 1.1.5
    13ad8548dea1 runc-docker: update to 1.1.0-tip
    c25d16577d12 runc-docker: update to 1.4.0-tip

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-container=
s/runc/runc-docker_git.bb
index 97373a72895c..8d078e852642 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
=20
 # Note: this rev is before the required protocol field, update when all co=
mponents
 #       have been updated to match.
-SRCREV_runc-docker =3D "974efd2dfca0abec041a3708a2b66bfac6bd2484"
+SRCREV_runc-docker =3D "a9833ff391a71b30069a6c3f816db113379a4346"
 SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;nam=
e=3Drunc-docker;protocol=3Dhttps \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-r=
e.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
=20
-RUNC_VERSION =3D "1.1.4"
+RUNC_VERSION =3D "1.1.12"
=20
 CVE_PRODUCT =3D "runc"
--=20
2.53.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294




