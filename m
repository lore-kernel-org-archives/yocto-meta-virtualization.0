Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A803BEEB57B
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 09:33:11 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.44174.1726133590976112554
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 02:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUzW8S3T;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so673950e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133589; x=1726738389; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LhimVXwzk9y2TQQFwODzG2e2DjrCWtLQuIeWyQrudM=;
        b=TUzW8S3TyBhOtuBopbn5Ki5xTHerbPK9Na3iTh1wFEbWxBZvL/U3MMEHSIl/RzhYr9
         u8Acj2aJ+fLFguCyO4RqRZdNVz4ZMrRU5HDZ7z+yAhdWJCSQBLK1nokOooHku6twJAXe
         Tmt7LW/51WWzrw1VNEl7+GsO1gHXyeCHS8bE1io/Pluij79qzrEpyFdLAl4oU2uz0L0r
         YWAZVdteQsX7ncCSUi3gU/ciuo03OiH+08xTYezvfS0LD6ZKGeNavMER/zNmppn3fQ4d
         OO9PE7h6ZmJl0lkJnRp9mk5WLvjB/qz2Kcsv70vq4pGc88KcjkEmfvB46J025AbbIsrA
         wx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133589; x=1726738389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LhimVXwzk9y2TQQFwODzG2e2DjrCWtLQuIeWyQrudM=;
        b=jHY8nHZ/+dmPlGf8HdJcyzDSs3y3rPEPPyZv+Ycx9ttkPzncL+fmdMCNoIAok54q4/
         scFwm+ZqvmAgTCCNK95pqEjXkSaZjcpsk5MkSrAenHAQpMGD6Ue1SnX69RD4a1xF0WyF
         VZKv9dUnUkEaRIjBhHQVT9DWGCKBR0E0cI5mkvO+lUTBTVu/6L3GIGW5/tUmc7gpn4ZP
         d3ifctQ5qXZg+8rSerAgAXvp4EqKY9NzKlX0Fd5vYcvAjRwUAqrtbuypTpzOj+aS8Ngh
         SGvcbr4xhWGaf9YQoCzfwxnXtVAPZAxCQyl3tsq5Y3qL8vISGQ4KSipGbVhERB6gkZKQ
         b5Uw==
X-Gm-Message-State: AOJu0YyNa+86UaN8aM0uae+0VrKC+tEK2EjNYL7HJMhWwb/Kqad+W9wd
	DNw3yOryx2NEzVj1PooKb1Yn/bsJ19HCShfp8lzXhKs7jNmABTvWnOinkdVVTZfGk/lBf7jZelp
	yMb3hVJAff5k76EQExD6dk8VMATs=
X-Google-Smtp-Source: AGHT+IEv0gWLZOQdo0TXZS8ESjQwOvtQuVsqfQrYKso6x+VmRVB7SSj1Q7pm5nF/Oqg5MKoBreNg/7eBuAEnPEO0//M=
X-Received: by 2002:a05:6512:ad6:b0:535:6400:1da2 with SMTP id
 2adb3069b0e04-53678fbb34emr1267576e87.18.1726133588529; Thu, 12 Sep 2024
 02:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240912083239.237361-1-f_l_k@t-online.de> <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
 <A7ZOJS.J4CMW0BLYVKO2@t-online.de>
In-Reply-To: <A7ZOJS.J4CMW0BLYVKO2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Sep 2024 11:32:52 +0200
Message-ID: <CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 09:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8889

That's weird, these LINUX_MAJOR/LINUX_MINOR are used only to include
the .inc file in:
recipes-kernel/linux/linux-%.bbappend:include
${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc=
',
'', d)}

while yocto-cfg-fragments dependency you've mentioned in the error is
added based on PV now in this .inc file:
recipes-kernel/linux/linux-yocto_virtualization.inc:        return
"yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv

So I think your fix only prevents either of these to be included:
./recipes-kernel/linux/linux-yocto_virtualization.inc
./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc

and not only for people using meta-intel, but for everybody, because
there is no linux-yocto_x.y_virtualization.inc at all.

That doesn't look right. I think
"oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip
trailing +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead
of PV inside the .inc file.

Regards,

On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote:
>
> Wasn't this fixed by https://git.yoctoproject.org/meta-virtualization/com=
mit/?id=3Dc02af94731631b3432b8ddee2b89761ab32530ee ?
>
> I have meta-virtualization layer up to date, so it includes this commit, =
but was still hit by this problem.

