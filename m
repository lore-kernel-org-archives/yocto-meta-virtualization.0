Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E4FC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 10:17:38 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.10252.1693217850602800892
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 03:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pUIr6Sid;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-794d98181f0so22021639f.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693217850; x=1693822650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4YX3ZaaFpaRhiKlo1nGmdejS90vXl4KptZ9KfhsvlqM=;
        b=pUIr6Sidf5Xm3340HEc4Zmap07UBsKHclgBtPquYMFbSCJeoJ2R4nQ1HSTEkOi75dQ
         bpYhQM9VyZm8xvgrGWVciz6xQsDrlCYQjLCEYXvAxImZb7ZcfDVXEB830t4JTVtWP/UQ
         BihKc4vXGbb7XsR9xv1Ktnd7vHfoiyXRAt+uXkU/L2eDm/oC1YSYdVLi3SgzUnfXKe8p
         jj9oCNe/pHrXB91vVgzej1zRosQrQiA8lSRXzrICUiWxzrHNodNJcsh8Q8+1eZj7iiy5
         lgMfAxP0UyeDmhEQhHH1hgDYzTN4gs5ZHwuiGUDcJ5HMnnxWwGlRWRD6+w2wBpyZo6JW
         F7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693217850; x=1693822650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YX3ZaaFpaRhiKlo1nGmdejS90vXl4KptZ9KfhsvlqM=;
        b=iqPz2DUxkqfd2KOqVwmD2kv71ttHeivF9m70M/Ksac6fxrQGm982NRVUaR8kj0Id23
         n1eIesGq8mhEIH6UZyHh/p2MkZvzl+WdINiFSqamSd7hvrLNdR5PvDK3D4TIdtH6e8A5
         ekAMK3bT0diaqIzsUOphYa6icK2yE1AbUjFt4kd9B1CLqNrogmLgixAjJlUIDgYK5Q+u
         UUeqe1rCQZP5t/wzWiWosi7AeEnBnuynuBfI65d3CQXJqsqmqg+042NcpRzEtzZrZ8GZ
         iL+h+tSf9ILT1srRNXBIPetMGhqncmgd3zPjJ1jQLdFv7VXkNB4nwDMQx2suP8Xdk7TN
         o9Gw==
X-Gm-Message-State: AOJu0YzvHmPjoUpJUvDXl7xvMiJwb4N+oFkduD9AyF8KoklxIRyW8ik5
	IaJgjhGSaoNPeK/pcQp2JQIrFKoNqzz19/xysfM=
X-Google-Smtp-Source: AGHT+IH67Iv94UbK1oIqoWtowol0P0Blda/xdXnxKRtvaVYOGzuDtoDsjifKeNE6uygtG0peciMtLpYEUy9rfMXL8Pk=
X-Received: by 2002:a5e:8c18:0:b0:785:d4f5:2225 with SMTP id
 n24-20020a5e8c18000000b00785d4f52225mr17132865ioj.19.1693217849640; Mon, 28
 Aug 2023 03:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230824081002.6730-1-f_l_k@t-online.de> <ZOtP7s2ivBE4sp+A@gmail.com>
 <V7Y20S.DEMNSEGCSDXK3@t-online.de>
In-Reply-To: <V7Y20S.DEMNSEGCSDXK3@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 07:17:21 -0300
Message-ID: <CADkTA4MpeKhmt=p2cfYu8GorSgQ-k5+ezVje41DfO5FV2Tf1Cg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to fuse3
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000748f790603f900f7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 10:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8245

--000000000000748f790603f900f7
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2023, 11:43 PM Markus Volk <f_l_k@t-online.de> wrote:

> On Sun, Aug 27 2023 at 01:30:22 PM +00:00:00, Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
>
> It is worth re-testing master-next and 9.6.0 to see if everything still
> works as you expect.
>
>
> Thanks, I will do the tests with the master-next branch.
>
> One question about the other patch I sent. Do you have build issues with
> it or do you not want to support introspection at all?
> I ask because the "gnome-boxes" recipe I recently sent to meta-gnome
> depends on vala bindings for libvirt-glib and cannot be built without the
> patch. For the latter case, it would be better to remove gnome-boxes from
> meta-gnome again.
>


I have no objections to introspection. I'm still out of the office, so I'm
only getting a few minutes here and there for email. Did I miss a patch ?
If so, feel free to point it out and I'll queue a build test!

Bruce

--000000000000748f790603f900f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Aug 27, 2023, 11:43 PM Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de" target=3D"_blank" rel=3D"noreferrer">f_l_k@t-=
online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_-3677905704893885977m_-2403426850288002288geary-body" dir=3D"auto">On=
 Sun, Aug 27 2023 at 01:30:22 PM +00:00:00, Bruce Ashfield &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">bruce.ashfield@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><=
div style=3D"white-space:break-spaces">It is worth re-testing master-next a=
nd 9.6.0 to see if
everything still works as you expect.</div></blockquote><div><br></div><div=
><div>Thanks, I will do the tests with the master-next branch.</div><div><b=
r></div><div>One question about the other patch I sent. Do you have build i=
ssues with it or do you not want to support introspection at all?</div><div=
>I ask because the &quot;gnome-boxes&quot; recipe I recently sent to meta-g=
nome depends on vala bindings for libvirt-glib and cannot be built without =
the patch. For the latter case, it would be better to remove gnome-boxes fr=
om meta-gnome again.</div></div></div></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have no obj=
ections to introspection. I&#39;m still out of the office, so I&#39;m only =
getting a few minutes here and there for email. Did I miss a patch ? If so,=
 feel free to point it out and I&#39;ll queue a build test!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Bruce=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div></div>

--000000000000748f790603f900f7--

