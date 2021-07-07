Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2339.1625687094801700049
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 12:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IqBKQrPx;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A128B38C051C
	for <meta-virtualization@yoctoproject.org>; Wed,  7 Jul 2021 19:44:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id b2so5172490ejg.8
        for <meta-virtualization@yoctoproject.org>; Wed, 07 Jul 2021 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NF3X0Ai8yk+47nbBATIzwWr1bJR8BHpE5K0OjdTQ8Dk=;
        b=IqBKQrPxhfuy3/mfAi31KpTj21DdZd4Ar7V1+6CxAsCOv2FGrqIVhtg/jSFuRD9pFE
         sF5O47YAUIIz5yQhtcmWDW+idon0jwC6NzZVOFq2IBwTGdDZpk+jmYoXE655YO+EmwHP
         lv5EBW9uAk+QoQ3nZo5IQoEP/24L2tM8igrN00oxMY26vpQ+OMtLsTQ4OBSHh6r+Dm7q
         TT4br2dgCLjD89/K7OOoFUnm18Z8EpF/+9+3ik+fN7I2JNXZwMpidGtoDaC7e9qAmAGj
         JaJY3o0iIpPQ30nIkUtXKZ8Lo3todg5yhziqULp2QEXgTwhrMDbMtIQxvzygYlYqHg0n
         JVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NF3X0Ai8yk+47nbBATIzwWr1bJR8BHpE5K0OjdTQ8Dk=;
        b=A1qBLZnJI4IBIyd3i+W3ztkMo05YYLxbnWCvh+uf0O6gYy34HkVU2MIp60/d4aZtWU
         w4cIOZg5LMLZmwbO/bnIg5zUvr78dKLk53sTr7iClwYTksw/7mwYND6wOiqODiSUWUoC
         Ovvg/FSDLcJ4g3jt0tv9L9QJ2ow0GTihzzLnTNIyyLES8IR+UfddhxlEDv8vbmiMO/zZ
         1t0SW1fKRiEoYrrR6WYlv3D4qrZP2SPbfwURHtuFM37dGsVP70gYfHCLaSNdOd+f+R8Z
         p2xxIRqdEt6RsjA9B9cGpG0g9VuTy3jre09Dl+yAdAR34POu3KXOlwrtsKzO//wGRwZY
         RCjw==
X-Gm-Message-State: AOAM533ncbAfy8zoiG0w17K7Sct6Ufudo6mAVyWVMvS1i64kl2lVroFf
	6u+Lt6rJshrepb4BDqq08lJgRn6P5yBejfzekO4=
X-Google-Smtp-Source: ABdhPJyGPLcN6o71cV0z4U5ci/ugxOAMF/gOmsr98Vm2N80CNqKSD1aqmTCOr4MIBZu//DrtmraJCnWlp2dLG4rKoPQ=
X-Received: by 2002:a17:906:2cca:: with SMTP id r10mr25183103ejr.298.1625687092960;
 Wed, 07 Jul 2021 12:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <1625638084-8262-1-git-send-email-zangrc.fnst@fujitsu.com> <168F99BB02677739.30794@lists.yoctoproject.org>
In-Reply-To: <168F99BB02677739.30794@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 7 Jul 2021 15:44:41 -0400
Message-ID: <CADkTA4NK3L0i+R0bgts3dHEz7dvpfpnRtgX5dkgSyu+g9sHnUw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] criu: skip QA checks textrel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: zangrc <zangrc.fnst@fujitsu.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 3:43 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> Were these warnings always there ? or has it been something introduced
> by recent uprevs of crui ?

We should also document why this QA warning is safe to skip/ignore as
part of this commit message (and even a comment above the QA check in
the recipe itself).

Cheers,

Bruce


>
> Bruce
>
>
> In message: [meta-virtualization] [PATCH] criu: skip QA checks textrel
> on 07/07/2021 zangrc wrote:
>
> > WARNING: criu-3.14+gitAUTOINC+e49ce513c8-r0 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> > ---
> >  recipes-containers/criu/criu_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> > index febf81e..6342620 100644
> > --- a/recipes-containers/criu/criu_git.bb
> > +++ b/recipes-containers/criu/criu_git.bb
> > @@ -22,6 +22,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=criu-dev \
> >             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> >            "
> >
> > +INSANE_SKIP_${PN} += "textrel"
> > +
> >  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> >
> >  DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
