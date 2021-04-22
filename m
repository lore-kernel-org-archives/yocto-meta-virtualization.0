Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.11276.1619094087869828228
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 05:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFwXx2Yt;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id i3so27507366edt.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Apr 2021 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y4bq6CHvjHTqWRs/3iNpjXhFMHH1RPcH9sQJf4HGpD4=;
        b=BFwXx2Ytmosu5/9eJs2Dy04BwgbDpYNpaJKVb5KM2sJh55BQ/eGvy9+HtR0LMP+EOc
         AFbLE09iLMN9Dxt6mxJ20fVHgeKOVgCoO65muO+J2ER5D7ITDjehNPKwSkedVkZ+uIz+
         MqOVlRrrmBbTgjVY5VvEvMbnFCycOSB9Jl53c3IlYq0+Xr1pg4YMuU5fNUSSvizEmCo+
         q2TLTFtE0YD53/LDXGL87M4cKZY4x1wcycC22KeQsiBW1t28ptYY27mczFZitBzE0i1D
         FWc1hQ/nd5QT5QbOG6suqhVY496jjDHWbfobvRD1CQWtk9M4CN4Ppriw+tIlv8t77bRu
         Xv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y4bq6CHvjHTqWRs/3iNpjXhFMHH1RPcH9sQJf4HGpD4=;
        b=pDnB6j6fFkhdhVi1wZZ1TqP7EWBC/uqD2QVVL7qLp09BK3ceypSoRPxHpr7RXxqDyM
         2Y4Vd39z4cdyWozLMNLUIeBKqvPqps+3tz9ZzN7UrCelM8DOIbfuK+fHz+3j3DKEpQnu
         kAUfL8Bl/YJSbovqJIYEHy1ZhJEyK8lFUpbwI/XleC9C71Moilq18SQIUXzZydPCQ2kp
         KoFexT95c8WIDHTgijI8BqRPR8Ro/+TW75w6BtQ3uPNetuzFyD/fe9itr7tjrdn1lNaX
         Yxd15T6R3cnFPewuiRWT1M8pu7juf58GhYzUrR6NEKpa4pzWX5BQLJG2Q8K/JsHhiY6k
         UkJg==
X-Gm-Message-State: AOAM531X781NN6w7oJqsiJ7fxMflDO/vHP0wy/lrntf1vRxwSbNcengv
	4LqXEaIeydXmbcqq3B42z1DFEVv+Q+V8/CM1X74=
X-Google-Smtp-Source: ABdhPJwJWW8vVAIGYYc0vDMOoEPlyg6F4bJ75DQ1VZRfR1FsSttKh9wGi/4UQl+rhJ6FIEbvm0V7lUIyHFXEeg19mLY=
X-Received: by 2002:a05:6402:54f:: with SMTP id i15mr3533099edx.365.1619094086212;
 Thu, 22 Apr 2021 05:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <qvvA.1619088799002052755.HOj2@lists.yoctoproject.org>
In-Reply-To: <qvvA.1619088799002052755.HOj2@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 22 Apr 2021 08:21:15 -0400
Message-ID: <CADkTA4Or002+zzXHQFOyyC4HZx1smcxwsM=iaHZ8zMiSPW_KiQ@mail.gmail.com>
Subject: Re: [meta-virtualization] devtool modify docker failure
To: s.anandje1@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 6:53 AM <s.anandje1@gmail.com> wrote:
>
> Hi,
>
>
>
> I have made my yocto setup successfully.
>
> The layers I have included is:
>
> $ cat conf/bblayers.conf
>
>   ${TOPDIR}/../poky/meta \
>
>   ${TOPDIR}/../poky/meta-poky \
>
>   ${TOPDIR}/../poky/meta-yocto-bsp \
>
>   ${TOPDIR}/../layers/meta-openembedded/meta-filesystems \
>
>   ${TOPDIR}/../layers/meta-openembedded/meta-networking \
>
>   /${TOPDIR}/../layers/meta-openembedded/meta-oe \
>
>   ${TOPDIR}/../layers/meta-openembedded/meta-perl \
>
>   ${TOPDIR}/../layers/meta-openembedded/meta-python \
>
>   ${TOPDIR}/../layers/meta-virtualization \
>
>
>
> I want to work on docker source code so I thought of fetching the source=
 code from devtool.
>
> But while I'm using devtool I'm facing an issue.
>
>
>
> $ devtool modify --no-same-dir --extract docker-ce workspace/sources/doc=
ker
>
> ERROR: Command Error: 'sh -c 'PATCHFILE=3D"0001-libnetwork-use-GO-instea=
d-of-go.patch" git -c user.name=3D"OpenEmbedded" -c user.email=3D"oe.patch@=
oe" commit -F /tmp/tmps5pr6pui --author=3D"Bruce Ashfield <bruce.ashfield@w=
indriver.com>" --date=3D"Fri, 6 Apr 2018 23:58:22 -0400"'' exited with 0  O=
utput:
>
> On branch devtool
>
> Changes not staged for commit:
>
>   (use "git add <file>..." to update what will be committed)
>
>   (use "git restore <file>..." to discard changes in working directory)
>
>   (commit or discard the untracked or modified content in submodules)
>
> modified:   libnetwork (modified content)
>
>
>
> no changes added to commit (use "git add" and/or "git commit -a")
>
> ERROR: Logfile of failure stored in: ${TOPDIR}/build/tmp/work/core2-64-p=
oky-linux/docker-ce/19.03.8-ce+gitafacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3-=
r0/devtooltmp-lnnatl98/temp/log.do_patch.27786
>
>
>
> Is there any workaround to overcome this error?
>

You'd be better off asking on the oe-core mailing list. We don't do
anything specific in the docker recipe that is known to break devtool,
so it would be something generally wrong with devtool .. that and
you'll get a wider audience of potential devtool users.

I've never used devtool when working with sources, so I can't offer
any specific advice.

Cheers,

Bruce

>
>
> Thanks & Regards
>
> Anand
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
