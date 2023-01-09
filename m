Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7263C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 06:38:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.65444.1673246276515830568
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jan 2023 22:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hcAKvMJz;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ss4so10334414ejb.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jan 2023 22:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jCMt3XsiIrTJsZDprxC7igJxtoKnyPNctejnLcTZNbE=;
        b=hcAKvMJz/1Bs9GCm3v6ijVu9v4t7QABS5nYrr8XJq+DsjzEepsBzSN37BCF7Vtk7T2
         WVbARaT/9Wq6sOu3ip8BqJwjH2tPStJWufUmZAYIZzJ+UouKBmME5jnGYKvNINqm+4ZC
         18+PjkIX67giY0ZctdyO3A9aAEBYZ1Pxn5zFgu89qXTGsQYhmCvdE4UQSbT7sJ1torQI
         oZJvtSf/msh0b0O4of+Wps4x/stOWcaxGpP9GDffWY+Pfa23kbcUxoxkWPzo8lhxIBlb
         zNHbib0pMu4ealc9SyiEnH4HOFkY5ozUbdITQJu8R/A+cO4CBhhQr5/6l2O/waiCRngW
         cIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCMt3XsiIrTJsZDprxC7igJxtoKnyPNctejnLcTZNbE=;
        b=SFAvpK5V+tupiMQ2zV+UEYu4GTICxsOYzQ4YLtvPCNDMk7nwpGlUGArAdgSu0mh8z4
         wuVh8FHFLZ5lticKfXW5m/fDTdbilqjkw3Oc11We2t0OxEwMs/n/097bTTt5PJ2QCa0O
         8iwWfkS8EoXOox6FVGM9ig7QDSoK6t2EigQi/EfS4XPYsXTtPJzhMBVX10nV9fjQ2PGh
         ATGgyynwcFlaHwVAYhub3GPFAYFJwJFLxy04SLUEb+hOfA86lGfr8iZQwBwd2Y+z+wVA
         vKuJl0opkwzfYXRC3tWqSgPny6QlQWzmQmIJIiwEfS3UXwjyaQBS9+bCLhdUk7UYw4a/
         aaAw==
X-Gm-Message-State: AFqh2kpd6w4/rY6r9lzf1ia5PTAzfZMiBaRHMdGYvOa40RnFgTc71AFt
	AkVn7lAxgRAu2OuiJQAA0eCtvdgDya3h/1n5wkVgGAEI
X-Google-Smtp-Source: AMrXdXvsQPBx8cGvgcJ2NQi/woz/p6VBXJvPvk1Aj9RKur3oLGOditgPYiQPJQO83iadat16C1R6L2o6Mcgx+SP+bJQ=
X-Received: by 2002:a17:906:910:b0:7c1:136d:b841 with SMTP id
 i16-20020a170906091000b007c1136db841mr4384144ejd.216.1673246275097; Sun, 08
 Jan 2023 22:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20230106144630.23637-1-michal.orzel@amd.com>
In-Reply-To: <20230106144630.23637-1-michal.orzel@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jan 2023 22:37:42 -0800
Message-ID: <CACMJ4GbC8q9AOeiPwo0pRpBpAbV0=-KEpWh6SjuiF8X_f8R+BQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] xen: Update recipes for xen and xen-tools
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bertrand.marquis@arm.com, 
	stefano.stabellini@amd.com, stewart.hildebrand@amd.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="000000000000d95f1b05f1cf01fd"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 06:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7806

--000000000000d95f1b05f1cf01fd
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 6:46 AM Michal Orzel <michal.orzel@amd.com> wrote:

> This patch series:
>  - updates the 4.16 recipes to the latest 4.16.3 release,
>  - adds 4.17 recipes, fixes conflicts and updates master,
>  - bumps default version to 4.17.
>
> Tested by building all the available Xen versions on qemu{arm64/x86-64} and
> running them using runqemu.
>

Thanks for including testing - appreciated. The series is good.

Christopher



>
> Michal Orzel (3):
>   xen: Bump SRCREV of 4.16 recipes to 4.16.3
>   xen: Add recipes for stable Xen 4.17 release and update master
>   xen: Bump default version to 4.17 stable
>
>  .../include/meta-virt-default-versions.inc    |   4 +-
>  .../files/xen-fix-gcc12-build-issues.patch    | 433 ------------------
>  recipes-extended/xen/xen-tools.inc            |   3 +
>  recipes-extended/xen/xen-tools_4.16.bb        |   5 +-
>  recipes-extended/xen/xen-tools_4.17.bb        |  19 +
>  recipes-extended/xen/xen-tools_git.bb         |   8 +-
>  recipes-extended/xen/xen_4.16.bb              |   5 +-
>  recipes-extended/xen/xen_4.17.bb              |  19 +
>  recipes-extended/xen/xen_git.bb               |   8 +-
>  9 files changed, 55 insertions(+), 449 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
>  create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
>  create mode 100644 recipes-extended/xen/xen_4.17.bb
>
> --
> 2.25.1
>
>

--000000000000d95f1b05f1cf01fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 6, 2023 at 6:46 AM Michal=
 Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 patch series:<br>
=C2=A0- updates the 4.16 recipes to the latest 4.16.3 release,<br>
=C2=A0- adds 4.17 recipes, fixes conflicts and updates master,<br>
=C2=A0- bumps default version to 4.17.<br>
<br>
Tested by building all the available Xen versions on qemu{arm64/x86-64} and=
<br>
running them using runqemu.<br></blockquote><div><br></div><div>Thanks for =
including testing - appreciated. The series is good.</div><div><br></div><d=
iv>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Michal Orzel (3):<br>
=C2=A0 xen: Bump SRCREV of 4.16 recipes to 4.16.3<br>
=C2=A0 xen: Add recipes for stable Xen 4.17 release and update master<br>
=C2=A0 xen: Bump default version to 4.17 stable<br>
<br>
=C2=A0.../include/meta-virt-default-versions.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0.../files/xen-fix-gcc12-build-issues.patch=C2=A0 =C2=A0 | 433 -------=
-----------<br>
=C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 19 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 19 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A09 files changed, 55 insertions(+), 449 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/xen-fix-gcc12-build-iss=
ues.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen-tools_4=
.17.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.17.bb=
" rel=3D"noreferrer" target=3D"_blank">xen_4.17.bb</a><br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000d95f1b05f1cf01fd--

