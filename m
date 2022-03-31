Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9E5C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:36:31 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.800.1648751790502702824
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hj569qsP;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id x34so310948ede.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RwKYaDbQdvcJSEth50ddzHmCF/TeFTIikqmMEQLZpA8=;
        b=Hj569qsPzxX6rbq5kjj8mFQnyK7T0/J2o5T+4J2UlvAgiqFXDi4EnRH0bDGLEvyPCJ
         ZUnQLVfMhqln0weoPgLwPDlb85fHjgw/BHsFfZ8c4rp8krWi55zMC6nA5MN+/N2JQqD/
         a6bMpNRUFUaejuFZXVTOyYJnBU2ZYV96LLAQM41lpNTaALya9OjKfybE5hyMdojUWbMY
         FKa8/Wnemt1mxxo1nMJ1D9SwJ5LLJPKLVd7Qld1AXuwcx2QfFd4V24zsF96Ws4kZZ8Mu
         VGI9/UAheiB81t2f8bRR0bYoy0bZf4ZmAhfhoIq2giWM1ajvAxwqsiSza8L6p28hhkG7
         6OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RwKYaDbQdvcJSEth50ddzHmCF/TeFTIikqmMEQLZpA8=;
        b=LLNJ2ql2HL9AzG9Iif8O/QJqglwh8eIUkkt3y1SGN1mgKw6ZCp4TYkJ7CzSj2pXKr7
         2l+qpHDV6vFy934w8eYaqdX26o3PWcvngqAhXxqtvEYMGNtq0nMHQ1grX5E5Kc8a+gX3
         Xa25jXVj1jkgAdUTnTeK9qJOmAyvY+cCr5TVmR/HCcIRIYZb55fXyb0kpgJ4uGaDrAKa
         lKy/Mm1J0I/jnxlEKrcwz7ar4BRevgCJkZKqPXd/bxGALsp56oR4W+DirGNaQb2Bc0d6
         pIeaxGH718ioND1AY8ZPpuLLLOrwcD97Wai0hi7AXCQp3c5ND3/59JB3dyHXF+KzRcIF
         k0rg==
X-Gm-Message-State: AOAM530EtmR4Ckz1tlphp+fQJSoWmwKA6L8ZjTnNA5lmU4fCBdYyB9w0
	de4OpSsynT0x2qOyhOVF3aZ6x/Ng6bsnU/944Qs=
X-Google-Smtp-Source: 
 ABdhPJxi4TSHScyyq7u+MeWdtikijWMspRbKNFHGoquz4A2mE86QzGUjxTPdR+RNmcIfo4rqDui9pzD3Q1JJJDsruC4=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr17388125edb.288.1648751788556; Thu, 31
 Mar 2022 11:36:28 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AM6PR08MB34610BFDE294473E6CFBAA7C92E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4M26YRe4pH_pA=3xtYNf8S9d1gL9zv2cuE1xxk_j9jGjA@mail.gmail.com>
 <AM6PR08MB3461DAC003FA7137609FBD0192E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB3461DAC003FA7137609FBD0192E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Mar 2022 14:36:17 -0400
Message-ID: 
 <CADkTA4MwCuZUxjP5iLVC8p9TJCBjCC04Nd6QbWL2L1fNWg-X9g@mail.gmail.com>
Subject: Re: k3s build issues on master
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000ae03b805db87f0b5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:36:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7123

--000000000000ae03b805db87f0b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 2:05 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:

> Hi Bruce,
> ------------------------------
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* 31 March 2022 17:38
> *To:* Diego Sueiro <Diego.Sueiro@arm.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>; nd <nd@arm.com>
> *Subject:* Re: k3s build issues on master
>
>
>
> On Thu, Mar 31, 2022 at 12:22 PM Diego Sueiro <Diego.Sueiro@arm.com>
> wrote:
>
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
> The short log is wrong, the SRCREV and PV are correct. There's some
> fundamental issues with 1.23.x that prevented it from building inside or
> outside of bitbake, so I scaled back the version bump at the last minute =
to
> stay in 1.22.x series.
>
>
> In this case it seems that thev1.22.6+k3s1
> <https://github.com/k3s-io/k3s/tree/v1.22.6%2Bk3s1> tag is pointing
> to 3228d9cb9a4727d48f60de4f1ab472f7c50df904.
>

The SRCREV is as intended. It is not intended to be that tag exactly, it is
the tip of the 1.22.x branch (and that's what all of them have been
throughout the history of the recipes).

We can use +git${SRCPV} in the recipe, but honestly, that's not the biggest
challenge with the go mod chaos, but I'll add it as part of my next update.

Cheers,

Bruce



>
> Cheers,
>
> Diego
>
> And yes, there's no more vendoring in k3s, so you can't just bump the
> SRCREV and PV, we have to adjust all of the git clones and shuffling to
> make it build.
>
> I have some more changes to that recipe pending, so I'll do a minor
> cleanup, with a shortlog that makes things clear.
>
>
> Cheers,
>
> Bruce
>
>
>
> Unfortunately, I have zero knowledge in go and I have no idea how I could
> fix this.
>
>
> Diego Sueiro
> Staff Software Developer =E2=80=93 ARM =E2=80=93 Automotive and Industria=
l Solutions
> (CE-OSS)
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ae03b805db87f0b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 2:05 PM Diego Sueiro &lt;<a=
 href=3D"mailto:Diego.Sueiro@arm.com">Diego.Sueiro@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Bruce,</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-4522974944649000124divRplyFwdMsg" dir=3D"ltr"><font fac=
e=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>Fro=
m:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targe=
t=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>Sent:</b> 31 March 2022 17:38<br>
<b>To:</b> Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com" target=
=3D"_blank">Diego.Sueiro@arm.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=
=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">me=
ta-virtualization@lists.yoctoproject.org</a>&gt;; nd &lt;<a href=3D"mailto:=
nd@arm.com" target=3D"_blank">nd@arm.com</a>&gt;<br>
<b>Subject:</b> Re: k3s build issues on master</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Mar 31, 2022 at 12:22 PM Diego Sueiro &lt;<a href=
=3D"mailto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.com</a>=
&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
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
55,255);display:inline">k3s: update
 to 1.23.1&quot;</span><span style=3D"color:rgb(51,51,51);font-family:sans-=
serif;font-size:16.6667px;font-weight:700;background-color:rgb(255,255,255)=
;display:inline">=C2=A0</span>(8cba065209dd668afe939f878da340a017ecdd7d) di=
dn&#39;t change the PV and=C2=A0SRCREV_k3s variables
 correctly.</div>
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
=3D"_blank">
github.com/google/cadvisor@v0.43.0</a>: is explicitly required in go.mod, b=
ut not marked as explicit in vendor/modules.txt<br>
<span><span style=3D"background-color:rgb(255,255,255);display:inline">[...=
]</span></span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span><span style=3D"background-color:rgb(255,255,255);display:inline">=C2=
=A0 =C2=A0 <a href=3D"http://k8s.io/sample-controller" target=3D"_blank">
k8s.io/sample-controller</a>: is marked as replaced by <a href=3D"http://gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k3s=
1" target=3D"_blank">
github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k=
3s1</a> in vendor/modules.txt, but replaced by
<a href=3D"http://github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-co=
ntroller@v1.23.3-k3s1" target=3D"_blank">
github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.23.3-k=
3s1</a> in go.mod
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
<br>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<blockquote style=3D"border-left:3px solid rgb(200,200,200);border-top-colo=
r:rgb(200,200,200);border-right-color:rgb(200,200,200);border-bottom-color:=
rgb(200,200,200);padding-left:1ex;margin-left:0.8ex;color:rgb(102,102,102)"=
>
<div style=3D"font-size:small">The short log is wrong, the SRCREV and PV ar=
e correct. There&#39;s some fundamental issues with 1.23.x that prevented i=
t from building inside or outside of bitbake, so I scaled back the version =
bump at the last
 minute to stay in 1.22.x series.</div>
</blockquote>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">In this case it seems that the<a href=3D"htt=
ps://github.com/k3s-io/k3s/tree/v1.22.6%2Bk3s1" style=3D"box-sizing:border-=
box;background-color:rgb(255,255,255);font-family:-apple-system,BlinkMacSys=
temFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px" id=3D"gmail-m_-452297=
4944649000124LPlnk380860" target=3D"_blank"><span style=3D"box-sizing:borde=
r-box;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width=
:125px;vertical-align:top"><span style=3D"box-sizing:border-box;font-size:9=
.75pt;color:rgb(0,0,0);background-color:rgba(0,0,0,0);margin-left:4px">v1.2=
2.6+k3s1</span></span></a>=C2=A0tag
 is pointing to=C2=A03228d9cb9a4727d48f60de4f1ab472f7c50df904.</div></div><=
/div></div></div></div></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">The SRCREV is as intended. It is not in=
tended to be that tag exactly, it is the tip of the 1.22.x branch (and that=
&#39;s what all of them have been throughout the history of the recipes).</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">We can use=C2=A0+git${SRCP=
V} in the recipe, but honestly, that&#39;s not the biggest challenge with t=
he go mod chaos, but I&#39;ll add it as part of my next update.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Cheers,</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Diego</div>
<div style=3D"font-size:small"><br>
</div>
<blockquote style=3D"border-left:3px solid rgb(200,200,200);border-top-colo=
r:rgb(200,200,200);border-right-color:rgb(200,200,200);border-bottom-color:=
rgb(200,200,200);padding-left:1ex;margin-left:0.8ex;color:rgb(102,102,102)"=
>
<div style=3D"font-size:small">And yes, there&#39;s no more vendoring in k3=
s, so you can&#39;t just bump the SRCREV and PV, we have to adjust all of t=
he git clones and shuffling to make it build.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">I have some more changes to that recipe pend=
ing, so I&#39;ll do a minor cleanup, with a shortlog that makes things clea=
r.</div>
</blockquote>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Cheers,</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce<br>
</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.<span style=3D"font-family:Arial,Helvetica,sans-serif;font-size:sma=
ll;color:rgb(34,34,34)">=C2=A0</span><br>
</div>
</div>
</blockquote>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_-4522974944649000124x_m_-1049742980418175207gmail-m_-807=
2067739783875034Signature">
<div>
<div></div>
<div id=3D"gmail-m_-4522974944649000124x_m_-1049742980418175207gmail-m_-807=
2067739783875034divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt;c=
olor:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif">
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
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000ae03b805db87f0b5--

