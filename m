Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C6FC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:17:15 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.17344.1700518634321359464
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 14:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxnEZB4o;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5c9d850a0dbso19696857b3.2;
        Mon, 20 Nov 2023 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700518633; x=1701123433; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwITa9Z/BHqnJdMYXiVHxzHeX7IZZlNDMq0KLZgfHuQ=;
        b=JxnEZB4oHUiZ1EKzAFBWgU/1vrRMqYPzMpI2KFicJ1ek8uyTFHufa5sMdqX18o3Vee
         ptNVA5t3VtJ4OHIQPjMUru7e8s1LvDubo5sb3HjhWj/DpZ1n45CBWqRvFueqLIi74vWk
         bE0WnQQtllfW0oz6akB4cjRhU3Ek64BB/6tcG3qfs1LMLHT3ScwP0/OMCDZP7jtOiDXK
         0YArSErt+GehPcPa5PnISIoJhOlIU6NOw/JQc0gtW06tZKODLHcj9ywoT+qGsLAEzL8Q
         1SVsV6FZIOf0Y1WclG+Md6gTwgLCpNP4OmIOXeg+Zgkjrj6DNVojOx51bZbxIXtPxPY1
         RNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700518633; x=1701123433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwITa9Z/BHqnJdMYXiVHxzHeX7IZZlNDMq0KLZgfHuQ=;
        b=b5YJhZgPTxEp/VIjkTYrGVZTa4Dx6ydd6HcAgXjyAMNmXvmR1zw+inMztr1fYCpc1C
         8UrOCglNpiXjcz4f5ZFPSzSfecDJbpp499hAmZw6h41pISUTr6F9HUPdCPM9w15v4S3p
         w43zvL8ZqadqlxBhEhnPXMpG/CYczWPhyXi/kTThiSqhW3rt660KFesIoH+8yrGmgGjF
         r72zqLWxy1sI1kCnLYS/eDUqZUUkzbQLYp402dijkUsnszhufgPY40KOfrgKCAnoQZyB
         JbwRoNlDB0v1qkbeqczP2/2WlU189DuF7YlM2x5HvDEle7Cvoh3I7h3e7UfmPporPw+n
         uTKA==
X-Gm-Message-State: AOJu0YyI4e9t2P50bIfxqA76B69nO6E8OF8yB/QxgZCWScKZexqJMrCa
	gepFmfBhtkR9vCj/zlDVVV0891tY58inFHT0UVRJCYgc
X-Google-Smtp-Source: AGHT+IEFoQ6B6v/i13A2vPT+82uqWNzhUWlkPSJYUDfuq6Hs8ff5j8h4NZ4Nb3TY/ntTOcjDPuQXlLpVyXAx0nCXQPY=
X-Received: by 2002:a81:a04f:0:b0:59e:9a44:9db9 with SMTP id
 x76-20020a81a04f000000b0059e9a449db9mr9641736ywg.26.1700518633042; Mon, 20
 Nov 2023 14:17:13 -0800 (PST)
MIME-Version: 1.0
References: <2023112021510697052353@mail.local>
In-Reply-To: <2023112021510697052353@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2023 17:17:01 -0500
Message-ID: <CADkTA4O9JP3kHrC7AOy_JGsQApk+YHuzTD+C23quBrQdSN38oQ@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Nov 2023 22:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8460

What branch ? We resolved that issue quite some time ago for master
and for the older branches.

If something happened to Joshua's change in master, I'm not aware of
it, and will wait for a patch to meta-virt to fix it up.

Bruce

On Mon, Nov 20, 2023 at 4:51=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> check-layer-nightly is failing for meta-virt:
>
> Loaded 0 entries from dependency cache.
> Parsing recipes...ERROR: ExpansionError during parsing /home/pokybuild/yo=
cto-worker/check-layer-nightly/build/meta-virtualization/recipes-extended/i=
mages/container-base.bb
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/li=
b/bb/data_smart.py", line 481, in DataSmart.expandWithRefs(s=3D"${@oe.go.ma=
p_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
>                      tb =3D sys.exc_info()[2]
>     >                raise ExpansionError(varname, s, exc).with_traceback=
(tb) from exc
>
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/li=
b/bb/data_smart.py", line 465, in DataSmart.expandWithRefs(s=3D"${@oe.go.ma=
p_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
>                      try:
>     >                    s =3D __expand_python_regexp__.sub(varparse.pyth=
on_sub, s)
>                      except SyntaxError as e:
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/li=
b/bb/data_smart.py", line 153, in VariableParse.python_sub(match=3D<re.Matc=
h object; span=3D(0, 43), match=3D"${@oe.go.map_arch(d.getVar('TARGET_ARCH'=
))}">):
>                          self.contains[k].update(parser.contains[k])
>     >            value =3D utils.better_eval(codeobj, DataContext(self.d)=
, {'d' : self.d})
>                  return str(value)
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/li=
b/bb/utils.py", line 434, in better_eval(source=3D<code object <module> at =
0x7f1275c759a0, file "Var <OCI_IMAGE_ARCH>", line 1>, locals=3D{'d': <bb.da=
ta_smart.DataSmart object at 0x7f127678f790>}, extraglobals=3D{'d': <bb.dat=
a_smart.DataSmart object at 0x7f127678f790>}):
>                  ctx[g] =3D extraglobals[g]
>     >    return eval(source, ctx, locals)
>
>   File "Var <OCI_IMAGE_ARCH>", line 1, in <module>
> bb.data_smart.ExpansionError: Failure expanding variable OCI_IMAGE_ARCH, =
expression was ${@oe.go.map_arch(d.getVar('TARGET_ARCH'))} which triggered =
exception AttributeError: module 'oe' has no attribute 'go'
> The variable dependency chain for the failure is: OCI_IMAGE_ARCH -> IMAGE=
_CMD:oci
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1719/s=
teps/23/logs/stdio
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

