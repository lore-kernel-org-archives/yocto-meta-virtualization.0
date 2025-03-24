Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4121DC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 18:53:45 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.47275.1742842423194343631
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 11:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrIKBNiw;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30332dfc821so2928351a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Mar 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742842422; x=1743447222; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCxl2gb75RpW3V7zpOcHJT2XBkjMZ7eQsQvy0ONQRSE=;
        b=FrIKBNiwtHPNA35DnJ+0Bq4KzpmU71jlo8l3VKWom//mvDzXGwwCSttyLmzb6AQG1L
         2rUK/Rq7Olc5fRx1T3Z8qy6vLn6hYIVFaBsyPKcbqqmOyQp3hK7qTbnRmPOM+sm5MvKx
         vIjxLZHMSHSKT6M7GAZ6bwM7vvqOQ0V+Ga9WhwyvtziE1oeKDr5eKarG4M0WgSC4TftO
         +bcuulVxvWqUEdi5S/7S+IdYdhOgCQgxMBv+osdDlL7oAqlFTFDdEmRbQWo9zbgNJyh7
         1GHFshHO04vazucy/6Rmf+YiC8UkBQSDzwF3/+36M9rsK3DJBnznX6uwvokOKFpOHh9G
         wTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742842422; x=1743447222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCxl2gb75RpW3V7zpOcHJT2XBkjMZ7eQsQvy0ONQRSE=;
        b=BN24H2xJg/J9uCtE7DmQpa/SsVDB/IdkHllQkJApYOYmwBNgQwX4oCwwV2e/wgMxkl
         atrFsrSw6eA0fLynClXC/m8Jjld0J/VfrafIL90TSRZsXO5678WgYC1+K9JdBUpPkgZ7
         2ESRse6Cw7UaokAesm/SBP6+4mTmTUX0MoqjCGd7o9ytojCu6ctCHkpjMzfdD8EJlTSM
         NTQZKpEp0mrBTMdKCHxMeIh+9O8pnRiBye0KPTgZzpVbtg4fNXAN2Gf4GR88UgAYZD5a
         /BSDyfXnGT/oATgky2P4b20XFu39vwFJDfCgbINYYKnwEG/Q6MlkCXdvGOKMjOO13t/6
         RLYg==
X-Gm-Message-State: AOJu0YzcOCGEwfQypaEBWoylpbXXyMjnKfa8p9W8rzKhlonEHsGqIxkW
	AR39t9Ul0bpQRvkYBGqZOoat5qKmiEyrrVDEfmU3AUyfA5DzbmkzoJLGXBmtnBJJg6Kf7E/XegV
	gFJZSqRutArGtHdnmISiz9WrZQmE=
X-Gm-Gg: ASbGncuMBlOpsUYmRY6bKS7Aw9XC4yvY3WQaV33sLuMZGsfaBXlW4aoYgKsl3tHpvOK
	LOMeg48jUrmRmWHEbd1glnOBpXv5aS01ZjhhHf6jsReaa06X+uKiND6/VOhCCwMrsVdmKGsGN6K
	keTNwzaDFulzbUn3ejgpYJ5+9vWQ==
X-Google-Smtp-Source: AGHT+IEWx3vjx4/jlujTqY2NM+oB8mpP2f7/8VvG7QLMAgc8+76KKsHV0g4MCf9CSux9CkC+vNgG5YPuoVM9JQLss0g=
X-Received: by 2002:a17:90b:278d:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-3030fea8f28mr24229505a91.14.1742842422544; Mon, 24 Mar 2025
 11:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <pqcZ.1742295934410662356.eyju@lists.yoctoproject.org> <31837.1742543917751179729@lists.yoctoproject.org>
In-Reply-To: <31837.1742543917751179729@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Mar 2025 14:53:30 -0400
X-Gm-Features: AQ5f1JqjeBumlzvWLbH--wXKDp4byHwuAtQ09GSoP9NbfM-HnlQ2s3b6QCaTmcg
Message-ID: <CADkTA4M0j9Oy9J_VQj0q936ThtgKWWZyk56QwYL6+fDkxy-dog@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker Compose is broken in the kirkstone branch
To: k4230r6@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007ed3fa06311b1faf"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Mar 2025 18:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9172

--0000000000007ed3fa06311b1faf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:58=E2=80=AFAM Christian Ege via lists.yoctoprojec=
t.org
<k4230r6=3Dgmail.com@lists.yoctoproject.org> wrote:

> Hej, just a heads up, I have created a two bugfixes on my GitHub repo,
> unfortunately is sending mails to Mailing lists behind a corporate firewa=
ll
> a real pain.
>

I can handle fetching and applying the patches, it isn't the preferred
workflow, but it is doable.


> -
> https://github.com/graugans/meta-virtualization/commit/d410a33c570f3cf087=
dc06dcc9ab8f8045189a11
>

The first patch is fine.



> -
> https://github.com/graugans/meta-virtualization/commit/4149812ca9581a313d=
e27c45a0f2dfa7bd8f53df
>
>

But the second one needs a tweak to the patch itself.  The patch that is
being applied to the build
need to have your Signed-off-by: along with an Upstream-status: field.

But otherwise, it looks ok and I can get it merged with a v2.

Bruce



> I also have created a test repo to verify this:
>
> https://github.com/graugans/meta-docker-compose
>
> I hope that's okay for you guys to pull in the changes.
>
> Best
> Christian
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9170):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9170
> Mute This Topic: https://lists.yoctoproject.org/mt/111767639/1050810
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

--0000000000007ed3fa06311b1faf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 21, 2025 at 3:58=
=E2=80=AFAM Christian Ege via <a href=3D"http://lists.yoctoproject.org">lis=
ts.yoctoproject.org</a> &lt;k4230r6=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div>Hej, just a heads up, I=
 have created a two bugfixes on my GitHub repo, unfortunately is sending ma=
ils to Mailing lists behind a corporate firewall a real pain.</div></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I can handle fetching and applying the patches, it isn&#39;t the prefe=
rred workflow, but it is doable.</div></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>- <a href=3D"https://github.com/graugans/meta-virtualization/commit/d4=
10a33c570f3cf087dc06dcc9ab8f8045189a11" rel=3D"noopener" target=3D"_blank">=
https://github.com/graugans/meta-virtualization/commit/d410a33c570f3cf087dc=
06dcc9ab8f8045189a11</a></div>
<div></div></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">The first patch is fine.</div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div>- <a href=3D"h=
ttps://github.com/graugans/meta-virtualization/commit/4149812ca9581a313de27=
c45a0f2dfa7bd8f53df" rel=3D"noopener" target=3D"_blank">https://github.com/=
graugans/meta-virtualization/commit/4149812ca9581a313de27c45a0f2dfa7bd8f53d=
f</a></div>
<div>=C2=A0</div></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">But the second one needs a tweak to the patch=
 itself.=C2=A0 The patch that is being applied to the build</div><div class=
=3D"gmail_default" style=3D"font-size:small">need to have your Signed-off-b=
y: along with an Upstream-status: field.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">But otherwise, it looks ok and I can get it merged with a v=
2.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>I also have created a test repo to verify this:</div>
<div>=C2=A0</div>
<div><a href=3D"https://github.com/graugans/meta-docker-compose" rel=3D"noo=
pener" target=3D"_blank">https://github.com/graugans/meta-docker-compose</a=
></div>
<div>=C2=A0</div>
<div>I hope that&#39;s okay for you guys to pull in the changes.</div>
<div>=C2=A0</div>
<div>Best</div>
<div>Christian</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9170): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9170" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9170</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111767639/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111767639/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000007ed3fa06311b1faf--

