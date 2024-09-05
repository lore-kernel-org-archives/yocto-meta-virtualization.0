Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20978CE7A91
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 19:49:40 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.18880.1725565773801510883
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Sep 2024 12:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYLuFO8x;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-27b7a1480bdso436530fac.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725565773; x=1726170573; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPxanSY+mbycqXqf5DCIAMqvIq/KX51BD9Y6KGIroQU=;
        b=IYLuFO8xDzSjkA6YcVrufpYOvW35BP6vXclQqPykUydDOKkSoxWOepJ4pMXhAUuDv7
         fQomgTCR6kO7d+ZQwtHKqoAOlzo0AjVCxnEBjtCwjCIp1kIXb28z4yNaveXdtXKNlgOW
         ZGONfSLWukqSk15B6Dhbp59+W7P1kTJGRqPFNIfcJsMvecsx6vwva1zbk79PFRqEZWYC
         DXLgDZi6G2hqa6hzKFHVONmnqmOmkeT8duZsP5nZL2lMhal2YcJxAaGzU6bL+d1TOXxA
         Ch+kCsZHNF3x3QstU8N0xfAkk/rDsS5ThoVlto49+3B6DFFlvUjxc9xsUAvsBlc1D3vd
         m5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725565773; x=1726170573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPxanSY+mbycqXqf5DCIAMqvIq/KX51BD9Y6KGIroQU=;
        b=juF6+qO+VDMzhbxi2pjC9C4dSvl6a/jRRpBKK8KQhYcutKlwSMg6a+SYMVNAvO+6jS
         h8+jjRjtKUS7n1KsBTIaeUEblCW7IClxxB/o+B+o5Jlk++z8oH7Z8KFjs8VH/8Ae/v5e
         PSja4UQhAOWowu4aZfTSxsH5ELLlMTbCrPPbflJn8HOMu/410IoTVlcwK9VhJ486O3bi
         mxiWF+KsBbaJHitPWCXHlos2Omo88jhZfD0BSk07t72sc52nIRD2/p2D8w0PR18fSAMB
         MqHAmDXlIq4Ghl/0juOOf3XZMLi/FgmI449OTmZOIhZm7CybxD86uphT7pNaMYg2XUj6
         JHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMMuq+wXbpSZAtXmGPxZV1mHlCbOMdHaYP6I/NHfCl/TFpyGc33vsaRNxwWjw417DNK7XAyW4cPHdApbw5INlIlLjG@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyqLc5RmUngCyF4Aw9zmbIYoRIpRmNroeMj/Zjf0jvd5iLIGiYb
	a/xJEKgj6awsTJfl9rANw8lUKfIZqNQclGMQjyH/7sup5uCh4x0uQDBJFUUDCBtO0r7AB60NDLN
	RUv7Wmn9u9ELy3GVVE5or4Y1BtZmJOshB
X-Google-Smtp-Source: AGHT+IHT2W1Zh4krpN9RqTLlLjwssP1lIoTW4cKwkpHiaF+T/ThEOZXgmn6QqxcAkHUXtb8baTBANdEWmPxbLmMmJpA=
X-Received: by 2002:a05:6870:a1a6:b0:277:f5de:210f with SMTP id
 586e51a60fabf-27b82e18c09mr446728fac.19.1725565773000; Thu, 05 Sep 2024
 12:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240904013050.1629475-1-Qi.Chen@windriver.com> <ZtoJVIj3GSDD1qEM@gmail.com>
In-Reply-To: <ZtoJVIj3GSDD1qEM@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Sep 2024 12:49:07 -0700
Message-ID: <CAMKF1sqYgZRLwdVaNqo-djp_y=qV9vOfy-8fugzTTVZHS+2Luw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: fix build on qemuarm
To: bruce.ashfield@gmail.com
Cc: Qi.Chen@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 19:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8870

On Thu, Sep 5, 2024 at 12:41=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I'm not sure that I want to support libvirt on qemuarm .. but
> since the patch isn't too complicated, I've gone ahead and
> merged it

The problem is generic 32bit systems with 64bit time_t, I guess will exhibi=
t the
same problem, so the fix is more than qemuarm

>
> Bruce
>
> In message: [meta-virtualization][PATCH] libvirt: fix build on qemuarm
> on 03/09/2024 Chen Qi via lists.yoctoproject.org wrote:
>
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > On qemuarm, time_t is 'long long int', so using '%lu' to print
> > it out will give us the following error:
> >
> >     error: format '%lu' expects argument of type 'long unsigned int',
> >     but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=3D=
format=3D]
> >
> > So use %llu to print it out.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...emu_nbdkit.c-use-llu-to-print-time_t.patch | 76 +++++++++++++++++++
> >  recipes-extended/libvirt/libvirt_git.bb       |  1 +
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c=
-use-llu-to-print-time_t.patch
> >
> > diff --git a/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-ll=
u-to-print-time_t.patch b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit=
.c-use-llu-to-print-time_t.patch
> > new file mode 100644
> > index 00000000..7263666a
> > --- /dev/null
> > +++ b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-pr=
int-time_t.patch
> > @@ -0,0 +1,76 @@
> > +From c4636402c06ab5ae436176daf0ef17005346e27d Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Mon, 2 Sep 2024 22:15:51 -0700
> > +Subject: [PATCH] qemu_nbdkit.c: use %llu to print time_t
> > +
> > +Use %lu to print time_t will give use the following error:
> > +
> > +  error: format '%lu' expects argument of type 'long unsigned int',
> > +  but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=3Df=
ormat=3D]
> > +
> > +So use %llu to print time_t.
> > +
> > +Upstream-Status: Submitted [https://lists.libvirt.org/archives/list/de=
vel@lists.libvirt.org/thread/FQSQMML6VWMHNWBYP67OLCUTJY5LJQST/]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + src/qemu/qemu_nbdkit.c | 24 ++++++++++++------------
> > + 1 file changed, 12 insertions(+), 12 deletions(-)
> > +
> > +diff --git a/src/qemu/qemu_nbdkit.c b/src/qemu/qemu_nbdkit.c
> > +index f099f35e1e..fe660c78e5 100644
> > +--- a/src/qemu/qemu_nbdkit.c
> > ++++ b/src/qemu/qemu_nbdkit.c
> > +@@ -544,18 +544,18 @@ qemuNbdkitCapsFormatCache(qemuNbdkitCaps *nbdkit=
Caps)
> > +
> > +     virBufferEscapeString(&buf, "<path>%s</path>\n",
> > +                           nbdkitCaps->path);
> > +-    virBufferAsprintf(&buf, "<nbdkitctime>%lu</nbdkitctime>\n",
> > +-                      nbdkitCaps->ctime);
> > ++    virBufferAsprintf(&buf, "<nbdkitctime>%llu</nbdkitctime>\n",
> > ++                      (long long)nbdkitCaps->ctime);
> > +     virBufferEscapeString(&buf, "<plugindir>%s</plugindir>\n",
> > +                           nbdkitCaps->pluginDir);
> > +-    virBufferAsprintf(&buf, "<plugindirmtime>%lu</plugindirmtime>\n",
> > +-                      nbdkitCaps->pluginDirMtime);
> > ++    virBufferAsprintf(&buf, "<plugindirmtime>%llu</plugindirmtime>\n"=
,
> > ++                      (long long)nbdkitCaps->pluginDirMtime);
> > +     virBufferEscapeString(&buf, "<filterdir>%s</filterdir>\n",
> > +                           nbdkitCaps->filterDir);
> > +-    virBufferAsprintf(&buf, "<filterdirmtime>%lu</filterdirmtime>\n",
> > +-                      nbdkitCaps->filterDirMtime);
> > +-    virBufferAsprintf(&buf, "<selfctime>%lu</selfctime>\n",
> > +-                      nbdkitCaps->libvirtCtime);
> > ++    virBufferAsprintf(&buf, "<filterdirmtime>%llu</filterdirmtime>\n"=
,
> > ++                      (long long)nbdkitCaps->filterDirMtime);
> > ++    virBufferAsprintf(&buf, "<selfctime>%llu</selfctime>\n",
> > ++                      (long long)nbdkitCaps->libvirtCtime);
> > +     virBufferAsprintf(&buf, "<selfvers>%u</selfvers>\n",
> > +                       nbdkitCaps->libvirtVersion);
> > +
> > +@@ -593,10 +593,10 @@ virNbdkitCapsSaveFile(void *data,
> > +         return -1;
> > +     }
> > +
> > +-    VIR_DEBUG("Saved caps '%s' for '%s' with (%lu, %lu)",
> > ++    VIR_DEBUG("Saved caps '%s' for '%s' with (%llu, %llu)",
> > +               filename, nbdkitCaps->path,
> > +-              nbdkitCaps->ctime,
> > +-              nbdkitCaps->libvirtCtime);
> > ++              (long long)nbdkitCaps->ctime,
> > ++              (long long)nbdkitCaps->libvirtCtime);
> > +
> > +     return 0;
> > + }
> > +@@ -1054,7 +1054,7 @@ qemuNbdkitProcessBuildCommandCurl(qemuNbdkitProc=
ess *proc,
> > +     }
> > +
> > +     if (proc->source->timeout > 0) {
> > +-        g_autofree char *timeout =3D g_strdup_printf("%llu", proc->so=
urce->timeout);
> > ++        g_autofree char *timeout =3D g_strdup_printf("%llu", (long lo=
ng)proc->source->timeout);
> > +         virCommandAddArgPair(cmd, "timeout", timeout);
> > +     }
> > +
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended=
/libvirt/libvirt_git.bb
> > index 706d4a40..d57bdc11 100644
> > --- a/recipes-extended/libvirt/libvirt_git.bb
> > +++ b/recipes-extended/libvirt/libvirt_git.bb
> > @@ -39,6 +39,7 @@ SRC_URI =3D "gitsm://github.com/libvirt/libvirt.git;n=
ame=3Dlibvirt;protocol=3Dhttps;br
> >             file://0001-messon.build-remove-build-path-information-to-a=
void-.patch \
> >             file://0001-meson.build-clear-abs_top_builddir-to-avoid-QA-=
warni.patch \
> >             file://0001-tests-meson-clear-absolute-directory-paths.patc=
h \
> > +           file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
> >            "
> >
> >  S =3D "${WORKDIR}/git"
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8869): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8869
> Mute This Topic: https://lists.yoctoproject.org/mt/108257527/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

