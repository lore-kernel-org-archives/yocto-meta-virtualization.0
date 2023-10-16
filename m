Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F6CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:24:32 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.134927.1697480665604262205
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+UM7esy;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-79fb78e297bso206732039f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697480665; x=1698085465; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEM3ciHeo6OtltQchcoEtF8j/bgM1s1BLO6O7p8Urmo=;
        b=X+UM7esytiy+N7PmBYvlxZqDxCNVM0AB+Us65nmF2zPjaDo0icnjmpyeDyl2F6bBfP
         FtCg/SdRGE1u9bZB/l5abx2QZhaNtlkT8MhMPAouj2KrEJ9TykyTbrCW0ZigJKnUrGQ1
         EUDlBoBObnVnqhDWYKW1YrYeydTyzG2dKglbE4E6Df+2SpAMzNAIePUxhQiEkICGAQFh
         VOfIelhIcR+U6bhvFJNxUVf2gq9Ho9kze5xdWJTtICja+tKqxeArmDopnZFhny+P4Ky9
         fqg7EnpuIL7p1LZue4LNyME8n+qBkERAreWLrg7YoMr8D6wIMbdgXG6AcULLEJxSLjb1
         RGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697480665; x=1698085465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEM3ciHeo6OtltQchcoEtF8j/bgM1s1BLO6O7p8Urmo=;
        b=DZmHkazSSYSoCNp/FXgFnxqaUKD+Dt2cYXVHkM420H3IPd/77uou7wmkHZg6LEDigl
         Y1257kFWk7fzpT26WnLCwEv6IycE5a3p6DkGrew5WPlk9sr816bzM53A62F65+GHTuvY
         hDEQLTWiZPJiXSaqVkeVdseKmXfq9bRg01/BwpMXDeN4P/+XRBTbDTvfN+S5rF3DOm2b
         3wFEUs8rfvzDC/Y/Kr6DGMZLFxSF3ZZIydNfzmg99tQbqSVvlIhMAoPYXZIFhIJTih4l
         uecnUIjpRnDAikb1Ez7IZ+Tu3Q+73ROaUsYqGBwazzE2Xs20IeO25p3ZEjfOqiez/ud5
         PVIQ==
X-Gm-Message-State: AOJu0YxMkMQOE9q1NyRjhXkt/6aBhsBxm/TwJvFHET4DYbbVK+NaD07r
	qpR1IxnGzJjLatmfuqAPzR6UO/PByIQQ7GEVCelFQedsm9lbnQ==
X-Google-Smtp-Source: AGHT+IGtu50w2E6yhRYOS0aD4nXSP5UOJr+Fg8KaE1q7FaQFXo0PwowzMUsp4a5LZ485qji5PIbr4dfcQMJe/dOQlsM=
X-Received: by 2002:a05:6e02:1a46:b0:34f:bed6:60d4 with SMTP id
 u6-20020a056e021a4600b0034fbed660d4mr344100ilv.10.1697480664798; Mon, 16 Oct
 2023 11:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231014151943.1678111-1-yi.zhao@windriver.com>
In-Reply-To: <20231014151943.1678111-1-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 14:24:28 -0400
Message-ID: <CADkTA4OMVTKS69RRgNmPeh2JmzBpuH6m5vAJG9ApB0CAsQes=w@mail.gmail.com>
Subject: Re: [meta-virtualization] [m-c-s][master][mickledore]kirkstone[][PATCH]
 nss-pam-ldapd: upgrade 0.9.8 -> 0.9.12
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:24:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8372

merged.

Bruce

On Sat, Oct 14, 2023 at 11:19=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com=
> wrote:
>
> Changelog:
> https://arthurdejong.org/nss-pam-ldapd/release-0-9-12
>
> Add a patch to fix shebang to python3 for getent.py and chsh.py.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...m-fix-shebang-for-chsh.py-and-getent.patch | 34 +++++++++++++++++++
>  ...ldapd_0.9.8.bb =3D> nss-pam-ldapd_0.9.12.bb} |  5 +--
>  2 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-support/nss-pam-ldapd/files/0001-utils-Makefi=
le.am-fix-shebang-for-chsh.py-and-getent.patch
>  rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.8.bb =3D> nss-pa=
m-ldapd_0.9.12.bb} (88%)
>
> diff --git a/recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-f=
ix-shebang-for-chsh.py-and-getent.patch b/recipes-support/nss-pam-ldapd/fil=
es/0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch
> new file mode 100644
> index 0000000..86e9f7b
> --- /dev/null
> +++ b/recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-fix-sheb=
ang-for-chsh.py-and-getent.patch
> @@ -0,0 +1,34 @@
> +From fb9c5b955da462695e0a662aebfa13493eaf3978 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Fri, 13 Oct 2023 22:28:25 +0800
> +Subject: [PATCH] utils/Makefile.am: fix shebang for chsh.py and getent.p=
y
> +
> +Update shebang to python3 for chsh.py and getent.py to fix QA issue:
> +
> +WARNING: nss-pam-ldapd-0.9.12-r0 do_package_qa: QA Issue: File
> +/usr/share/nslcd-utils/chsh.py in package nss-pam-ldapd contains
> +reference to TMPDIR
> +File /usr/share/nslcd-utils/getent.py in package nss-pam-ldapd contains
> +reference to TMPDIR [buildpaths]
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + utils/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/Makefile.am b/utils/Makefile.am
> +index a6bccd3..22a50d8 100644
> +--- a/utils/Makefile.am
> ++++ b/utils/Makefile.am
> +@@ -39,5 +39,5 @@ install-data-hook:
> +       set -ex; for cmd in getent chsh ; do \
> +         [ -L $(DESTDIR)$(bindir)/$$cmd.$(MODULE_NAME) ] || $(LN_S) $(ut=
ilsdir)/$$cmd.py $(DESTDIR)$(bindir)/$$cmd.$(MODULE_NAME) ; \
> +         chmod a+rx $(DESTDIR)$(utilsdir)/$$cmd.py ; \
> +-        sed -i -e '1 s|^#!.*|#! $(PYTHON)|;1 s|^#! \([^/].*\)|#! /usr/b=
in/env \1|' $(DESTDIR)$(utilsdir)/$$cmd.py ; \
> ++        sed -i -e '1 s|/usr/bin/env python|/usr/bin/env python3|' $(DES=
TDIR)$(utilsdir)/$$cmd.py ; \
> +       done
> +--
> +2.25.1
> +
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recip=
es-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> similarity index 88%
> rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> index d7354c4..7f3b9e3 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
> @@ -16,6 +16,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>
>  SRC_URI =3D "\
>         http://arthurdejong.org/nss-pam-ldapd/${BPN}-${PV}.tar.gz \
> +       file://0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.=
patch \
>         file://nslcd.init \
>         file://nslcd.service \
>         "
> @@ -23,8 +24,8 @@ SRC_URI =3D "\
>  inherit autotools features_check
>  REQUIRED_DISTRO_FEATURES =3D "pam"
>
> -SRC_URI[md5sum] =3D "8c99fdc54f4bf9aca8c5f53fdb1403ff"
> -SRC_URI[sha256sum] =3D "ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8b=
adc6e7eb16f3453f"
> +SRC_URI[md5sum] =3D "cc30ee0ab91d6c94b7a343ae09b5dc69"
> +SRC_URI[sha256sum] =3D "c6d661e74693cbf531a790631ca93b73f291fb23cc39465b=
09deb8da2bfb0e14"
>
>  DEPENDS +=3D "libpam openldap krb5"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8366): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8366
> Mute This Topic: https://lists.yoctoproject.org/mt/101961438/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

