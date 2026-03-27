Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A40D10ED67F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73162.1774620420119855313
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 07:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=XhA5vslX;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.53, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853a5ffc05so4207245e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1774620418; x=1775225218; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw3/F+diCfjVuiEOdPsZf1Oa9mY5nA+5OpyS1V4iKwE=;
        b=XhA5vslX3b5QCm15WDw7B42EpKCclAmfzqaelqvmjAM5EUfk6M7i4Jnd6nvGHP1S07
         fZjfovhjh3HQh2FSVZ4osDCiVB9fZugve9BOYMWm4rzjin5Frz9Iv6Vmk2i1DWzQwOOX
         OjtfH/jIJ65AmY5u+eBwB1IlBz3GstVLf9JjMStBzKuTZY8mTCbASg9x3kiVnjOBAe09
         xH5VuboImbEC3duyUxHMnnfeClUwqN4g8185o9LMD4n7ZcysV1tVHxOuZN9hEKQLNgO2
         C3oiJw6PtCZa5djUuAtQFagyDV+0N81WCIHdJAMLbfYxgSxr/PGkJjW1qh6jVPUF7O52
         r34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620418; x=1775225218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xw3/F+diCfjVuiEOdPsZf1Oa9mY5nA+5OpyS1V4iKwE=;
        b=tUWXv0jw2GsphvHWrlSK+hM4gB2flRU33aaGST/kNDMFlQ2I2nNgMSJDT1T50vmw8S
         T/zMHbfz/i+IsPa/ZY+PDSa2IzgOnDOUz6AW+T1mkudtl9R29WLoM+53Rs3S1UVQg2qu
         IDr8LCEdaPHZmH/fXbCczKmLNAcrGb8OI9R2k3aEOnB9kmtuhaTa1NqqjpQccfBiIUkc
         BFAdZn0Tp7Ejd+IZvGaJEJtMBkAM+ytaPrTP2B+J0ixIAn4HhYa+pdMH0AM98B2MuNOg
         VZjH88MX3L3TqRGLvajJ8R7mfEEAla8TH9NvBYgMNlU/pFIZzIsO//NPWNRxT7aZK8k/
         eRFA==
X-Gm-Message-State: AOJu0YwrmQneWVHHxXe4BdxmxDjMQyctXBTFf0UrmowidC/ARYD0NF2s
	f6v2m1Ha8ha7gaaso7p46gq+za3xjzt+DyZUK28oYK9OaJSnBEymVbAoppFOi9hKQjPY2qQ3Dxt
	G1Rh/0TCG9/r9+qhQfmo7sTRBgpBKdtfZFmSjH+tHZd8Z3yaVkJkGLwTlFuevpkbFKNTN0JugTb
	HpSWSO5+DZmWxWx6NbWQ==
X-Gm-Gg: ATEYQzzTgCVCnitkmGOpv3KYkx6DrRaHdvTBMadFCKJ8EwHDqrlgPt8A1YlfV547Mym
	bVom4o6JssXiG9jLaUgz0tVugnG9aA6Npn6petdJQ/OgHvAsUAo1/nqEnyLpfAkeUonoeIYwMzM
	f3SNrwVGQeoVCzCLbdqG7x9ItwJavhqSPEwXsXcR7/ddppRMDDWpRQtwHGestJWJV5T25/8hlPn
	O9+jH8c6YlTVFGDKmnuc2UbDY2XaMiJ01sm8r+SkaPtzHgkDY/EQB1lA9C1gkR29HzviirHTE8C
	J6EnoNbamXYQYmXH/ZcxJ7maD7l+Y5Xci0khzxpAnauRRiF97xXtoaykiO+o5JC1FmEfdXFHK5u
	mbJHJzSZNo/wPf5PBQpTehLz0482bzBd3ISQoiQRQPFOcaEJ6XmyDg7Oa4Acdp1Ol2mJcyW3HcK
	e3kZYYBdqbtGk4AIG0easxBR6233NrYeEtXCC9BDwbt8cJ82WVmRrmKbf4Z07oOIbl+usrwLB40
	OVQA5nRVfWpcOlb
X-Received: by 2002:a05:600c:4f91:b0:485:3fc3:e8e9 with SMTP id 5b1f17b1804b1-48727ede097mr24242075e9.3.1774620418273;
        Fri, 27 Mar 2026 07:06:58 -0700 (PDT)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c957b9sm152396485e9.8.2026.03.27.07.06.57
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:06:57 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 1/4] runc-opencontainers: update to 1.1.12
Date: Fri, 27 Mar 2026 15:06:37 +0100
Message-ID: <20260327140640.126833-2-jonas.gorski@bisdn.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9678

Bump runc to version v1.1.12-14-ge8bb71e1 with the following squashed
cherry-picks from master:

    4cea448064d4 runc-opencontainers: update to 1.1.12
    9213f05f5591 runc-opencontainers: update to 1.1.12
    e4b6616a90e0 runc-opencontainers: update to 1.1.11
    62ac94c50dff runc-opencontainers: update to 1.1.10
    606fe98a9811 runc-opencontainers: update to 1.9.0
    ea3b6a83981a runc-opencontainers: update to 1.1.8
    5dda7078ba85 runc-opencontainers: update to 1.1.7-tip
    b3fd5097ab34 runc-opencontainers: update to 1.1.7
    ae91a8666a73 runc-opencontainers: update to 1.1.5
    969daee49f1d runc-opencontainers: update to 1.1.0-tip
    f281ad2d9650 runc-opencontainers: update to 1.4.0-tip

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 ...spect-GOBUILDFLAGS-for-runc-and-remove-re.patch | 14 +++++++-------
 recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLA=
GS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefi=
le-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
index 4d35e58e7f76..df9e1d8e2722 100644
--- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-=
runc-and-remove-re.patch
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-=
runc-and-remove-re.patch
@@ -15,12 +15,12 @@ Index: git/src/import/Makefile
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- git.orig/src/import/Makefile
 +++ git/src/import/Makefile
-@@ -20,7 +20,7 @@
- 		endif
+@@ -24,7 +24,7 @@
+ 		GO_BUILDMODE :=3D "-buildmode=3Dpie"
  	endif
  endif
--GO_BUILD :=3D $(GO) build -trimpath $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags =
"$(BUILDTAGS)" \
-+GO_BUILD :=3D $(GO) build $(GOBUILDFLAGS) -trimpath $(GO_BUILDMODE) $(EXT=
RA_FLAGS) -tags "$(BUILDTAGS)" \
- 	-ldflags "-X main.gitCommit=3D$(COMMIT) -X main.version=3D$(VERSION) $(E=
XTRA_LDFLAGS)"
- GO_BUILD_STATIC :=3D CGO_ENABLED=3D1 $(GO) build -trimpath $(EXTRA_FLAGS)=
 -tags "$(BUILDTAGS) netgo osusergo" \
- 	-ldflags "-extldflags -static -X main.gitCommit=3D$(COMMIT) -X main.vers=
ion=3D$(VERSION) $(EXTRA_LDFLAGS)"
+-GO_BUILD :=3D $(GO) build -trimpath $(GO_BUILDMODE) \
++GO_BUILD :=3D $(GO) build $(GOBUILDFLAGS) -trimpath $(GO_BUILDMODE) \
+ 	$(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
+ 	-ldflags "$(LDFLAGS_COMMON) $(EXTRA_LDFLAGS)"
+=20
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-c=
ontainers/runc/runc-opencontainers_git.bb
index 59ddca9bb59e..48a64f20d7cc 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
=20
-SRCREV =3D "974efd2dfca0abec041a3708a2b66bfac6bd2484"
+SRCREV =3D "e8bb71e147d6044f57dfb5d4da619cf27f830c48"
 SRC_URI =3D " \
     git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=3Dh=
ttps \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch=
 \
     "
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




