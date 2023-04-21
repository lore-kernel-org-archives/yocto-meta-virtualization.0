Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF20C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 12:41:32 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.10445.1682080884698955418
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 05:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GnN149P1;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-32a7770f7baso5138125ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682080884; x=1684672884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtfAYRik0IQ+yUsInb1/bUAggcovOL/KgULjfgQtbS4=;
        b=GnN149P1XtHfq41HLQbt8sOoUa1putmD88eb3nrF7I63mKmMCS4pGFK7546OgQkeM1
         o2jXje5NL78HCOkerjOGr1gtMNnGNDRdotmcbWb7hWZr1K4osC8i7Tdt3neLW3cP7XdP
         ii52eWoYNhmMDZUUFL/zWXqYlDlFxOvXk2rGePBtboRc8QqIsHTBjkht1Ln+yM03/fNO
         dLtL1YwTXWMmncZ0VI9Whl0y39E5Gg2tYMLi9xYnfRz76N2ypFbYQMMPiYf3n+p4kBa4
         V7tRpx26GCABCnOula6iye9OhlWTc+h/G7FmZ/uI4PRq+6koYV8XsMSg1auGLMYlJa1c
         webQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682080884; x=1684672884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtfAYRik0IQ+yUsInb1/bUAggcovOL/KgULjfgQtbS4=;
        b=NNo3mHRx+rKU6M+hfk4t+XJaa+Za+P3bYdgV3hYef2iI/UITYtAxI1MRWzGJXE6VO0
         y1Irm3ZvHn56UZiDs6dDD62MSWj3LDFUpuSCErI9KSLujDzVxTQQzOyTGdN/HsokPDEB
         8I+DJJlpFPolO1Iq/32BfheeIiL78OLEHx3yxwXh6YsjDj3v5nB2efP7XMWIQHdvErw4
         cYhsiMrdiL0Ch0JSz0ypMRzH3Q6btZd2BLgSXScBZjQkkeW+m6Rb3w3xJOzM0kvtzt/v
         oXg+p6prcQEAFRN0PAQWAS+pbHQLawHYnE719vHxxvw0Mx4p2MeiLjkZFfHN54oRqRqd
         HVgA==
X-Gm-Message-State: AAQBX9fgd4ES+JIcBO2saZHP9XllpfZatGXwqWTWPrObrQGTUXQBW316
	IFUbg0AslCHwFnOo6fOkEAEkkNMFtzgBHCkmjRKLP1j1+O4=
X-Google-Smtp-Source: AKy350ZoO+q5WGFpTqdz6Qe5royDbCq21WoS07LwOqM365i4qu/015ra27U4GTFZh2b3K6JQ3KRk8tidaWcM1OZdZlg=
X-Received: by 2002:a92:c60c:0:b0:328:5956:55ea with SMTP id
 p12-20020a92c60c000000b00328595655eamr3192234ilm.27.1682080883731; Fri, 21
 Apr 2023 05:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <e17f9bc804c35c44457e7556f5f8d7071c011917.1682064997.git.diego.sueiro@arm.com>
In-Reply-To: <e17f9bc804c35c44457e7556f5f8d7071c011917.1682064997.git.diego.sueiro@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2023 08:41:12 -0400
Message-ID: <CADkTA4ORGgHbUE0pGaZq4H1QJd1nTK5En9n+feu_ZyPPS8AqxQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone,langdale][PATCH] k3s: Fix go-api
 repo fetch
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 12:41:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8005

On Fri, Apr 21, 2023 at 4:23=E2=80=AFAM Diego Sueiro <diego.sueiro@arm.com>=
 wrote:
>
> Currently, k3s do_fetch fails with:
> ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 do=
_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any sou=
rce.', 'git://github.com/storageos/go-api;name=3Dgo-api;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D/<snip>/build/tmp/work/armv8a-poky-linux/k3s/v1.22.=
6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0/k3s-v1.22.6+k3s1+git4=
262c6b91a43ef8411870f72ff8b8715949f90e2/src/import/vendor.fetch/github.com/=
storageos/go-api')
>
> The https://github.com/storageos/go-api repository is currently being mig=
rated.
> It's locked while the migration is in progress.
>
> To workaround this issue, download the the release tarball instead.
>

I'm ok to make the switch, but can we leave the old SRCREV and SRC_URI
entries in the file, commented out, with a comment explaining why
we've made the change.

Bruce

> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/k3s/src_uri.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/k3s/src_uri.inc b/recipes-containers/k3s/=
src_uri.inc
> index 4c0c283..fddbbfd 100644
> --- a/recipes-containers/k3s/src_uri.inc
> +++ b/recipes-containers/k3s/src_uri.inc
> @@ -1950,8 +1950,8 @@ SRC_URI +=3D "git://github.com/stoewer/go-strcase;n=
ame=3Dgo-strcase;protocol=3Dhttps;n
>
>  # github.com/storageos/go-api v2.2.0+incompatible
>  # [1] git ls-remote https://github.com/storageos/go-api d6e6bab2519238b8=
a582cabd2f4a71cca81963aa
> -SRCREV_go-api=3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
> -SRC_URI +=3D "git://github.com/storageos/go-api;name=3Dgo-api;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/storageos/go-api"
> +SRC_URI[go-api.sha256sum] =3D "2a23ff05a9ad02084e31afa7ffaf4fd97757af927=
7a5fe8001e5335a6db1ddea"
> +SRC_URI +=3D "https://proxy.golang.org/github.com/storageos/go-api/v2/@v=
/v2.2.0.zip;downloadfilename=3Dgo-api_v2.2.0.zip;name=3Dgo-api;subdir=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/storageos/go-api"
>
>  # github.com/stretchr/objx v0.2.0
>  # [1] git ls-remote https://github.com/stretchr/objx ea4fe68685ee0d3cee7=
032121851b57e7494e8ea
> --
> 2.25.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

