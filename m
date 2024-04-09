Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B3BCD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:08:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.137797.1712671695374345455
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X/H0orzQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed267f2936so1810572b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712671695; x=1713276495; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4JVvR85sBSXs+xnoBy5ByN1JKEd2OSKts2Gq4tMMwTs=;
        b=X/H0orzQ2MFEdxjiK7mFAb2gz2h+zf0SbjnfMwYane1lTUk7xmoFRC1gIf6VnhIWNe
         ZmWIqI+Q2N7X7LFy2AvRqOhtWtwcKQ73mhiZFzVuG1QGRhkqvwodm0Q6CgVhOqCChX8F
         N1BsBIAnnqSTn8Zo1zc60FrYSKUrw0gV7Y6GNG+BuZToBsL9j4VLD/hts6HBjqKLUaBJ
         DHojvqJeS8Y9jLhPVUj5zkBGnBUUuAdT6FUWdRV23oV4DUkMorF3Yb6wULNb9HVJBrrB
         PMUgflNEcP1JPKblp9n4mPKgWy4XeRuRKVmo1dXvMxJovLhd+ZbFC+xfqjwZ2FWpNwr9
         XLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671695; x=1713276495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JVvR85sBSXs+xnoBy5ByN1JKEd2OSKts2Gq4tMMwTs=;
        b=j2EvjnSlV1fPJ8W1kFnYkkX+Afc4p+M1dy+R4W947kmlfASbWr6Mh2TVZqI663Eyt4
         Gmf3K89TdzR0CILDPlL2m614AcySm23/cMReUT98qdnKzOxPcKGUfWa3NSne1va7eY0O
         77mVbRP04DXlXnoB9jXtpWU9x88c8Q2bcX/C1gPMtsq6CZBJsMABiAPkN2SwFQRHJ5mp
         LQNYw3L940kcFUzKDt/IMAE8wJpmpsPf+ofIdVtlVURwYAcokEuCPsV1t0G3QNAU7TA0
         wP3S4GPZjeQZmeTOu6sCkZB5g9Vzeci/zHA7l0d2gIXluJFPB7HQZrV7AdgZ2Nx7i786
         HZ7A==
X-Gm-Message-State: AOJu0Yz5zbxI2eT4YY8N+tN3GLGjOpCf5b8P9Sy66b7/kcWq7UwsxhhU
	W2okgOj42PN7mgqDwAX5cuK+r0GeaFy2NgdtgvmH1uwKz3qgb9zUMRqR39lXowlXvqTqv4SNFot
	TKuljAt0F5EzLF7VyQicrQ8AAqJVlA5i8
X-Google-Smtp-Source: AGHT+IGj4UKROkRGE6LDnbvF28VBVH3tvqKUiSi1xfBj4rqBySD3SjubHaLk0yNckE4txXFXjBfxFQhBH6sm+ZLkyEA=
X-Received: by 2002:a05:6a20:9f43:b0:1a3:3260:7555 with SMTP id
 ml3-20020a056a209f4300b001a332607555mr13243934pzb.11.1712671694400; Tue, 09
 Apr 2024 07:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240319151201.27522-1-paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <20240319151201.27522-1-paul.leguendekerneizon@savoirfairelinux.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Apr 2024 10:08:03 -0400
Message-ID: <CADkTA4MPG1hpMcDm+9BXfE4tcVvFyZGSyyiLnc+cOV_mU1XNOQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] add support of libvirt-dbus
To: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f635030615aa7363"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8667

--000000000000f635030615aa7363
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This worked in my local testing, so I've queued it on master-next.

I expect to merge master-next to master tomorrow, and we'll be set for the
release content.

Bruce

On Tue, Mar 19, 2024 at 11:12=E2=80=AFAM Paul Le Guen de Kerneizon <
paul.leguendekerneizon@savoirfairelinux.com> wrote:

> Hello community,
> This patch adds the support of the libvirt dbus plugin. As the recipe has=
 a
> direct dependency with `libvirt-glib`, this should be tested on target
> version
> of Yocto Nanbield.
>
> Waiting for your review, feel free to ask any questions or remarks.
> Regards,
> Paul Le Guen de Kerneizon, Savoir-faire Linux
>
> Mathieu Dupr=C3=A9 (1):
>   libvirt: add libvirt-dbus
>
>  .../libvirt/libvirt-dbus_1.4.1.bb             | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
>
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8644):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8644
> Mute This Topic: https://lists.yoctoproject.org/mt/105025660/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f635030615aa7363
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Thi=
s worked in my local testing, so I&#39;ve queued it on master-next.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I expect to merge master-next =
to master tomorrow, and we&#39;ll be set for the release content.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 19, 2024 at=
 11:12=E2=80=AFAM Paul Le Guen de Kerneizon &lt;<a href=3D"mailto:paul.legu=
endekerneizon@savoirfairelinux.com">paul.leguendekerneizon@savoirfairelinux=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello community,<br>
This patch adds the support of the libvirt dbus plugin. As the recipe has a=
<br>
direct dependency with `libvirt-glib`, this should be tested on target vers=
ion<br>
of Yocto Nanbield.<br>
<br>
Waiting for your review, feel free to ask any questions or remarks.<br>
Regards,<br>
Paul Le Guen de Kerneizon, Savoir-faire Linux<br>
<br>
Mathieu Dupr=C3=A9 (1):<br>
=C2=A0 libvirt: add libvirt-dbus<br>
<br>
=C2=A0.../libvirt/<a href=3D"http://libvirt-dbus_1.4.1.bb" rel=3D"noreferre=
r" target=3D"_blank">libvirt-dbus_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 23 +++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<a href=3D"http://libvirt=
-dbus_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">libvirt-dbus_1.4.1.bb<=
/a><br>
<br>
--<br>
2.34.1<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8644): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8644" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8644</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105025660/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105025660/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000f635030615aa7363--

