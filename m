Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83044F33A7D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:54:44 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45957.1772722480583957755
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 06:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwOIewRy;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf43014d0so60762385ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 06:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772722480; cv=none;
        d=google.com; s=arc-20240605;
        b=guOGs7EJv/iEXUz2t8TnjJIsJ1mX778/6fyt3rwiZXKGMV9A4U/TU6RxydI4XuJE0D
         aDVAFZ7Cm3FnZH0gEobzpprlsAsCqjDe/XGFKu0/sJnhcb4jYBR3OJmZF0uxk5bcx88K
         vDrsq6PKbxBWFI90V+Vyn+Tn7lwKvbFsg6EJ2H8kE2YJzMEqKrU5XwCgNVyO+WLrCUfw
         s+B2J7m+K0r7kxsVCtZc5TLl79jJgpAwL0MQiEwW5P2anBIPT5FUjfDbbYy3Cq2+96Ib
         3mki/uP78pffhqHsUOgpuW1HcyHukKYzWjGAHB4mXlkuCSz2RCIi7CmGQVW/tP170+q4
         u/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6Q5lS59AOj8ZlYXLt6yH8E0oVTsydat3dlLC4e9PCoo=;
        fh=vvozKkZ8g/dvnqFnDWZNMT3SYeUiv/22wRTBrqDPZ9I=;
        b=M+vOLoB0uhVppaIJYqBFdnDjianPPrP9Ul46ay4vExpukucnGGqs/Z9YmR4gv6vpVm
         hphMNcbZoJ3b2oM+6GR7NVsSy1CZ474QIpLfDaloWfZWshWgn1SioPpzI9Uj/IYsoOVW
         n/QBFNWJA7n9jEbuZnENE/TzhJncYmy5n0bHnjcEFCkr31Qw6SSlwxUAnCOecOa4LVQe
         /DDB5Wm+0OmWQ7yHNQnNu/q2G/D/TZTlTMdLkiNgfOSq/T03aUUOZC6Z6wfKvraiMLws
         58N/6kRHbdDI5+OplJUGiErHZneGKC0EIBdVhxvubdiyTVJqggJuVZ2HuTTcO5wZxHzR
         uKuA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722480; x=1773327280; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q5lS59AOj8ZlYXLt6yH8E0oVTsydat3dlLC4e9PCoo=;
        b=FwOIewRy16iy9iLWjCvezZuKco1LxFBkd84QU79rMR4EAVInRMg+DxYRfhRQ5Z52eK
         ivNXdJGIDOSSkiGcu4j1COOHEniY17ADCE8Yjv6m5UvuJsg2mW688oSwO2EVsDi7Xnzo
         Yi0CTZez4kNlBL8Sfiq3avErjX8G/+ejNhJzKRv4JL/ZoLJIP8i7ZI+9h3as821+mlKJ
         nEDpO8WUZVuie7bgkLadRqdOb7Qe3Nm02uQ7XA5ipWs5mCm0n7+xIws2BuUbRnCxj7Ke
         gDxw/1x/yYljlvvu8Ht4QM+r92xCpd+/LKYxCLMOQlGdBPQCsXs4s5ffrc0rYO2PGldd
         801g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722480; x=1773327280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q5lS59AOj8ZlYXLt6yH8E0oVTsydat3dlLC4e9PCoo=;
        b=Ikj6UAuD63+Ney1lqrGDy6R6joY0smdoe/qI338vS999Ii+UfUUjIBgKN4KYBzWB/i
         loE7HrPVccCGmZD5sXAh7w9OmOgKpI+4Ulz1ZRPkCnf95Bqeqtr81KsJYwQfq2KNtoFu
         1ECCd2+qXz1aD7BeyBH9kbHlWhoa/Bafw8CvVbot3sKPSlt78oah4McXh4Sw4wPD/VEE
         hQ8hZ3KKIQOfiafm4PymeLAZ2npP0YT8NKXx9901Fw2zkAGXzag+eBXCv56socpYfXQW
         p7NTUf7OD5SyneLmR6kq623NXZSLjvXKfUC7DQf6FwIMaUnz0W+efe7I/BWX9bEYK8ZF
         R5OQ==
X-Gm-Message-State: AOJu0YzSWm3TswPs0sTRYLs+tIOY+nfYtpCiagjWe3EhILhEvJBUlv3u
	3324+mCtbziL/4mdjerxteIBgirdf39LKDY498uyWEggmYlHg+bv33tjlnUsRM/Twu7WoBBqDUx
	1d4cQ5B0hJEGvxf9l4Zq+bLJXHpdTO7M=
X-Gm-Gg: ATEYQzySREybZ/J9mlGR1rcMFtSykwLMks0pQhyA2aKxRZb7x5gKZLKVTKTb5xmRt7h
	uc8f4dKmuGalRwFfnUfd/KL+IgocvDP2bSyHByodmGTmVvfBGaa9o700FjTU+CTLw5CGw166IrG
	obLsKuR369DF8wZKBfGtIZeU5MhD4p6lK4ltbabeC5pnD5s8jMM32SDyuV0JER7ZXKqDhmAx0vu
	XJfVEKUDRuYbpotvhQmmRqf/3RAF8QzfpS6iVayroaBiqgdAlTKnRjIWqmT06PFDc95z9fmRoA/
	pWQYyOST5aQRBHnJXt2PrRtsRUrpHSx6GsdWjVAX
X-Received: by 2002:a17:902:db02:b0:2ae:483f:b23c with SMTP id
 d9443c01a7336-2ae6aaae9ddmr64790865ad.36.1772722479906; Thu, 05 Mar 2026
 06:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20260305043012.1186651-1-dmitry.baryshkov@oss.qualcomm.com>
 <CADkTA4PUr4idtuhR784CP_GEtUjsaz12rk69JZHCC8zhqSgR_g@mail.gmail.com> <CAO9ioeW95p_ot-jDUgot=1VcRhLAaYdwg8-jW_hjo+NE3SmO7w@mail.gmail.com>
In-Reply-To: <CAO9ioeW95p_ot-jDUgot=1VcRhLAaYdwg8-jW_hjo+NE3SmO7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Mar 2026 09:54:25 -0500
X-Gm-Features: AaiRm523rdy6fUlx7nxutvPVTBMvde37PXkztxiRxjGkwcYljwH3q2HXY-F4D14
Message-ID: <CADkTA4NsrvuoTzOaxDq8pozw_OuZB2XGp3Eaje2jHEDTwKH99g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-guest-bundle: require "xen" DISTRO_FEATURE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b342df064c481da3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9621

--000000000000b342df064c481da3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 9:26=E2=80=AFAM Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> wrote:

> On 05/03/2026 06:46, Bruce Ashfield wrote:
> >
> >
> > On Wed, Mar 4, 2026 at 11:30=E2=80=AFPM Dmitry Baryshkov via
> > lists.yoctoproject.org <http://lists.yoctoproject.org>
> > <dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org
> > <mailto:oss.qualcomm.com@lists.yoctoproject.org>> wrote:
> >
> >     Building guest bundles makes sense only if "xen" feature is enabled
> in
> >     DISTRO_FEATURES. Skip all Xen guest bundle recipes if it is not a
> part
> >     of the DISTRO_FEATURES.
> >
> >
> > Sure, but you are just describing what is in the patch.
> >
> > What problem was this actually causing ?
>
> When building world (or when running yocto-check-layers against a
> layer depending on meta-virtualization):
>
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'example-xen-guest-bundle', 'xen-guest-image-minimal']
>

Aha. That's what needs to be in the commit message!

I'd prefer the feature check in the recipes themselves (and clearly
I missed some when doing the work).

Distro / feature requirements just aren't visible enough when they
are in a bbclass versus the recipe (from my point of view).

In fact, I don't even think the recipes make sense in a world build
at all, and I should probably just bulk exclude them.

Thoughts ?

Bruce



>
>
>
> --
> With best wishes
> Dmitry
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b342df064c481da3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2026 at 9:26=
=E2=80=AFAM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qua=
lcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 05/03/2026 06:46, Bruce Ashf=
ield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 4, 2026 at 11:30=E2=80=AFPM Dmitry Baryshkov via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;<a href=3D"http://lists.yoctoprojec=
t.org" rel=3D"noreferrer" target=3D"_blank">http://lists.yoctoproject.org</=
a>&gt;<br>
&gt; &lt;dmitry.baryshkov=3D<a href=3D"mailto:oss.qualcomm.com@lists.yoctop=
roject.org" target=3D"_blank">oss.qualcomm.com@lists.yoctoproject.org</a><b=
r>
&gt; &lt;mailto:<a href=3D"mailto:oss.qualcomm.com@lists.yoctoproject.org" =
target=3D"_blank">oss.qualcomm.com@lists.yoctoproject.org</a>&gt;&gt; wrote=
:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Building guest bundles makes sense only if &quot;xe=
n&quot; feature is enabled in<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES. Skip all Xen guest bundle recipes =
if it is not a part<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the DISTRO_FEATURES.<br>
&gt;<br>
&gt;<br>
&gt; Sure, but you are just describing what is in the patch.<br>
&gt;<br>
&gt; What problem was this actually causing ?<br>
<br>
When building world (or when running yocto-check-layers against a<br>
layer depending on meta-virtualization):<br>
<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
<br>
&#39;example-xen-guest-bundle&#39;, &#39;xen-guest-image-minimal&#39;]<br><=
/blockquote><div><br><div class=3D"gmail_default" style=3D"font-size:small"=
>Aha. That&#39;s what needs to be in the commit message!</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I&#39;d prefer the feature check in the rec=
ipes themselves (and clearly</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I missed some when doing the work).=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Distro / feature requirements just aren&#39;=
t visible enough when they</div><div class=3D"gmail_default" style=3D"font-=
size:small">are in a bbclass versus the recipe (from my point of view).</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">In fact, I don&#39;t even th=
ink the recipes make sense in a world build</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">at all, and I should probably just bulk exclud=
e them.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Thoughts ?</div><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
--<br>
With best wishes<br>
Dmitry<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b342df064c481da3--

