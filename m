Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261AEC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:57:21 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.12713.1709042235996368354
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S1/lA7uV;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso4211926276.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709042235; x=1709647035; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVOSUsXVun8nSGs089fmNfSXAb9W/W/GJqhfDthCPGw=;
        b=S1/lA7uVprboCbRdwC55RoOBW8r+IWFF+AfEwtdNtUIuGG4z691uHvxDEntStN1Pxy
         +KVfP+4JVgyg2u6AqkpWN1JC1MHanFu6+Zq7ifWryruXZqHsPVja8V5q7n5FrHkch1tg
         +QbGSoaqS0nQoJpuoR8WvivaMNvTJekO16waNuzTkc8sEpSbwpI0e9IQ/RSwNySvLATt
         XiiWe3+9PA87CMDnGClsjVbIqgdPTH8x+2RGiC/GgKD0IFRPSFEsm4XhPnUtx7OjHTMU
         AnbQFOpFbfNmeZkcK6T0ez+AFQPdhRRY33ok6dhKAytLRe1j2wlF9u0TQzZkwIwYajpm
         gqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709042235; x=1709647035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVOSUsXVun8nSGs089fmNfSXAb9W/W/GJqhfDthCPGw=;
        b=boHyUGWFDfKi9eLXKEIXe8T5cQlFAAgndW0V7McoFkf8I6mO9jksKoi09l3uK+qOwN
         w1RjYTfKm9YdwXYGmfIpGXm1xwdNkh1Yeiq0dEWKsu3hwrb6BTxIEzfWRCY2adA9bLdM
         vX3ez9dQlLM9SQzmHgXdWcZhofs7awIMh971NxCrwY5egw8gzuqCyWmz4y6bCxfhlShe
         PG6/Zce3EOJxiwe4G8HfMuAKOkISc8cio5IRSsPAUYKpOqU5pwqmC3f9ZmCZJm4zi5U9
         dxEfVorImbxf/FW5g74/S4AzpcnpL+v4MI2BnDcJrJ6vXL3HFMYXZysWZn2tnc+Grtip
         BFRw==
X-Gm-Message-State: AOJu0YxPgJW8Fs4v08mVdGj8obaa0N54tdt4uWIUqRtlDvYm7yF1CIPQ
	oewmTvC7r3VHMHJhLj5Hp/HE9K2iO/qwlqTVjCmdHm6UEPtpvA30s43gwCQSWdcCSV+7wVsS3YN
	4ifW6t9AG5NGvF0E6bMAhGqjFHvw=
X-Google-Smtp-Source: AGHT+IGbg/Vat8Yqxj4yJF6zlPp09e7b4aXRZtsQHRlK6VHpZEORalyl/OruuA5kvVpFRDbGQkUA9w7mRKU2vExLDjc=
X-Received: by 2002:a25:ef03:0:b0:dc6:4b66:2636 with SMTP id
 g3-20020a25ef03000000b00dc64b662636mr2215736ybd.19.1709042230239; Tue, 27 Feb
 2024 05:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
In-Reply-To: <20240227051211.3390256-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 08:56:58 -0500
Message-ID: <CADkTA4MKpXktzigN7rzV6t8Zyj=+Fb45DTEdE2cQCxQUBGQ1Ng@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] oci-image-tools: remove unneeded deps
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:57:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8590

This patch is fine. I'll queue it shortly, once I work through some
other upgrade issues.

Bruce

On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> These deps no longer have any effect. Remove them.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../oci-image-tools/oci-image-tools_git.bb               | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/=
recipes-containers/oci-image-tools/oci-image-tools_git.bb
> index b925a2a7..ade6534d 100644
> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> @@ -3,15 +3,6 @@ SUMMARY =3D "A collection of tools for working with the =
OCI image format specifica
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c=
29e"
>
> -DEPENDS =3D "\
> -           oci-image-spec \
> -           oci-runtime-spec \
> -           go-digest \
> -           go-errors \
> -           spf13-cobra \
> -           spf13-pflag \
> -          "
> -
>  SRC_URI =3D "git://github.com/opencontainers/image-tools.git;branch=3Dma=
ster;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/opencontainers/image-=
tools \
>             file://0001-config-make-Config.User-mapping-errors-a-warning.=
patch \
>             file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.pa=
tch"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8586): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8586
> Mute This Topic: https://lists.yoctoproject.org/mt/104598180/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

