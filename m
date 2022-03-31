Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D7C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 16:38:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.1.1648744700041104661
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 09:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmOboA7X;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bh17so476922ejb.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdQvtmUICcNY64uWNSmOQ5tgdHwNBEm7NpZavSS1cvQ=;
        b=FmOboA7XA4a2f1aaWIGr/27nXe8+PHASm3v3WtPqKl9XbbxVOE4sSInEqJcvC0e8y1
         gobw9vlTW+GCbhwUUT+DFtdilCV0qda22VzC9fcwLeCmhALaQ1ZzcrGnmY8NBPNTM5rp
         acRiy7GTCXV2nb8d3lurLyfrt4IciEnwIDdbaQminD3/LgbpC+dUcf6U+T6+ubmg83nn
         6cL4vhdjWAXyy4vpIj9J9aY7WUNnbExGxiyPzxMpoccBnUwQKWgr0slKAmFRfJ08EsXJ
         5XVpXpeT1SoofES1IetmZJCmZcagJwRE9iPIUkCfNnp5JQEK0VmpZK6+ts/IZXRB7p6q
         bU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdQvtmUICcNY64uWNSmOQ5tgdHwNBEm7NpZavSS1cvQ=;
        b=I/2hlFBXr+AAjGuOy8i1Zza0N6hgxC3iRbVQl8bnwZSf65EXRnze2QRqvKn0Urntn6
         9Z0SZ66VXOauf6jyloagTmoXvhuU7rRu2c4jBGRfiYVfYjzLPGncTBqCVYSPSNftr+Fp
         UhBy+Vjv1L/0NSVCoibJcuVkxBBncuXy9cRDzKK+FB1gQSAN+8VP698uydDrE4XSpd+d
         pfDphlHoR6RxpeUkQAhVZithxpUXXgVH8axNPU2ewzvcrxwACD3r0O1jeSGjRQaLKGoh
         1Lz1NwboA+xxmOQZDKM+TJf+CCienegQuguMC4iQdF2Ct46i9hai7I098PiDpIaOiZiE
         AcKQ==
X-Gm-Message-State: AOAM531uk7lzggZ515kt01dx704Kp30kwXQd1rMKV+4Vy14HYec5NA5o
	JXOQz0Rdx2p5UvlI+EH8OUeEnxVOum2ubr5VcTo=
X-Google-Smtp-Source: 
 ABdhPJyW9gVy9i4IUPBR3ZrxG7p3Vasn6qYZQHi0mq9y1oI0HDCTr5vMp5MIc51a9lsz/LwDybdc82Usa5TynNBwTN4=
X-Received: by 2002:a17:907:3f29:b0:6df:7eac:7fa4 with SMTP id
 hq41-20020a1709073f2900b006df7eac7fa4mr5736610ejc.391.1648744695329; Thu, 31
 Mar 2022 09:38:15 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AM6PR08MB34610BFDE294473E6CFBAA7C92E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB34610BFDE294473E6CFBAA7C92E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Mar 2022 12:38:04 -0400
Message-ID: 
 <CADkTA4M26YRe4pH_pA=3xtYNf8S9d1gL9zv2cuE1xxk_j9jGjA@mail.gmail.com>
Subject: Re: k3s build issues on master
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e8b2e005db864959"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 16:38:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7121

--000000000000e8b2e005db864959
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 12:22 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:

> Hi Bruce,
>
> Whilst investigating a build problem on our CI related to sstate mirror o=
f
> the k3s recipe, I found that the commit "k3s: update to 1.23.1" (8cba0652=
09dd668afe939f878da340a017ecdd7d)
> didn't change the PV and SRCREV_k3s variables correctly.
>
> I changed those values to v1.23.1+k3s1
> and 08d538fb3a04a0fe904b34cf04f7e21191b82449 respectively and now I'm
> getting the following do_compile error:
> ```
> go: inconsistent vendoring in
> /kas_build_dir/tmp/work/neoversen1-poky-linux/k3s/v1.23.3+k3s1-r0/k3s-v1.=
23.3+k3s1/src/import:
>     github.com/google/cadvisor@v0.43.0: is explicitly required in go.mod,
> but not marked as explicit in vendor/modules.txt
> [...]
>     k8s.io/sample-controller: is marked as replaced by
> github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6=
-k3s1
> in vendor/modules.txt, but replaced by
> github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.23.3=
-k3s1
> in go.mod
>
>     To ignore the vendor directory, use -mod=3Dreadonly or -mod=3Dmod.
>     To sync the vendor directory, run:
>         go mod vendor
> ```
>
>
The short log is wrong, the SRCREV and PV are correct. There's some
fundamental issues with 1.23.x that prevented it from building inside or
outside of bitbake, so I scaled back the version bump at the last minute to
stay in 1.22.x series.

And yes, there's no more vendoring in k3s, so you can't just bump the
SRCREV and PV, we have to adjust all of the git clones and shuffling to
make it build.

I have some more changes to that recipe pending, so I'll do a minor
cleanup, with a shortlog that makes things clear.

Cheers,

Bruce



> Unfortunately, I have zero knowledge in go and I have no idea how I could
> fix this.
>

> Diego Sueiro
> Staff Software Developer =E2=80=93 ARM =E2=80=93 Automotive and Industria=
l Solutions
> (CE-OSS)
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e8b2e005db864959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 12:22 PM Diego Sueiro &lt;<=
a href=3D"mailto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Whilst investigating a build problem on our CI related to sstate mirror of =
the k3s recipe, I found that the commit &quot;<span style=3D"color:rgb(51,5=
1,51);font-family:sans-serif;font-size:16.6667px;background-color:rgb(255,2=
55,255);display:inline">k3s:
 update to 1.23.1&quot;</span><span style=3D"color:rgb(51,51,51);font-famil=
y:sans-serif;font-size:16.6667px;font-weight:700;background-color:rgb(255,2=
55,255);display:inline">=C2=A0</span>(8cba065209dd668afe939f878da340a017ecd=
d7d) didn&#39;t change the PV and=C2=A0SRCREV_k3s
 variables correctly.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I changed those values to=C2=A0v1.23.1+k3s1 and=C2=A008d538fb3a04a0fe904b34=
cf04f7e21191b82449 respectively and now I&#39;m getting the following do_co=
mpile error:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
```</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
go: inconsistent vendoring in /kas_build_dir/tmp/work/neoversen1-poky-linux=
/k3s/v1.23.3+k3s1-r0/k3s-v1.23.3+k3s1/src/import:<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0 <a href=3D"http://github.com/google/cadvisor@v0.43.0" target=
=3D"_blank">github.com/google/cadvisor@v0.43.0</a>: is explicitly required =
in go.mod, but not marked as explicit in vendor/modules.txt<br>
<span><span style=3D"background-color:rgb(255,255,255);display:inline">[...=
]</span></span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span><span style=3D"background-color:rgb(255,255,255);display:inline">=C2=
=A0 =C2=A0 <a href=3D"http://k8s.io/sample-controller" target=3D"_blank">k8=
s.io/sample-controller</a>: is marked as replaced by <a href=3D"http://gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k3s1"=
 target=3D"_blank">github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-c=
ontroller@v1.22.6-k3s1</a> in vendor/modules.txt, but replaced by <a href=
=3D"http://github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controlle=
r@v1.23.3-k3s1" target=3D"_blank">github.com/k3s-io/kubernetes/staging/src/=
k8s.io/sample-controller@v1.23.3-k3s1</a>
 in go.mod
<div><br>
</div>
<div>=C2=A0 =C2=A0 To ignore the vendor directory, use -mod=3Dreadonly or -=
mod=3Dmod.</div>
<div>=C2=A0 =C2=A0 To sync the vendor directory, run:</div>
<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 go mod vendor</span></span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
```</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br></div></div></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">The short log is wrong, the SRCREV and PV are =
correct. There&#39;s some fundamental issues with 1.23.x that prevented it =
from building inside or outside of bitbake, so I scaled back the version bu=
mp at the last minute to stay in 1.22.x series.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">And yes, there&#39;s no more vendoring in k3s, so yo=
u can&#39;t just bump the SRCREV and PV, we have to adjust all of the git c=
lones and shuffling to make it build.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">I have some more changes to that recipe pending, so I&#39;ll d=
o a minor cleanup, with a shortlog that makes things clear.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce<br></div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-fami=
ly:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.<span style=3D"font-family:Arial,Helvetica,sans-serif;font-size:sma=
ll;color:rgb(34,34,34)">=C2=A0</span><br></div></div></blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div style=3D"fon=
t-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)=
">
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_-1049742980418175207gmail-m_-8072067739783875034Signature">
<div>
<div></div>
<div id=3D"m_-1049742980418175207gmail-m_-8072067739783875034divtagdefaultw=
rapper" dir=3D"ltr" style=3D"font-size:12pt;color:rgb(0,0,0);font-family:Ca=
libri,Helvetica,sans-serif">
<p style=3D"margin-top:0px;margin-bottom:0px"><span lang=3D"PT-BR" style=3D=
"font-size:11pt;font-family:Calibri,sans-serif">Diego Sueiro<br>
Staff Software Developer =E2=80=93 ARM <span style=3D"background-color:rgb(=
255,255,255);display:inline">
=E2=80=93=C2=A0</span>Automotive and Industrial Solutions (CE-OSS)</span><b=
r>
</p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>

--000000000000e8b2e005db864959--

