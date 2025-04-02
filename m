Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36211C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:24:50 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.5647.1743593082844110113
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 04:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCPEcEjp;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736c062b1f5so8509b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593082; x=1744197882; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVpVszuzDi5Ol0AhXJkO14HKuFr46vRqOMWuzOEsSUA=;
        b=FCPEcEjpze6xztatG5mZkb1iItJZ3mwJhvpZh795WiKL3QXkxyRWvtWOxHTKwT7++z
         S/KC9Z5I9VU2nZemOy/nPv5z3YN6YEJdq6T2Af/QrubjTFo6QrGYvKLDzmSdNG0N8wgM
         RUaH94NXBBXQuMrU2nReExhPMBboEy+PXegiTblBw0Qhn78qhqyY+6MsJGuulkjVX9DP
         U6R57qjaGVIekL2pEBUpDZp22Cz1nvbb2V2BM/fnkTYxv4CXrl8gn8mFayjUFBhrhVCV
         M5hODKsM3Gqupa8lpknTyYFo+OEV2yVKyW+f5yCpyY/vd1GaRYgJTnBbw/pvJ6T8lL2M
         CoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593082; x=1744197882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVpVszuzDi5Ol0AhXJkO14HKuFr46vRqOMWuzOEsSUA=;
        b=Tt6GXdtwLMaTeTHrfWfMPazaRhqIM5PjXr7Ei0jD+bG8WwQDbtQSq5vv2EuE3jg2+H
         lgD3ITN6rDlDGtmjuKdM+pHWwzb9SM8zzWoQnh8zyzXMWLl1QSeM5Tym9n75Go4d0aOM
         NK7ZxDcKzs7XYtjakWbkPPZG83+Cya+qeS5M2/zTaeOfHYaaJo7IX8etwTsm9r7pn6hD
         GqDNNgLl5VbbuMzJjOv8d25Yy9P0W3tDpBs2CA5WvkgHzb/dN+Y6Jf0+rluqG0DkylaU
         i7o08XsCakuHMNX3C2vwENaHiBUy/7A1ErE36n1ifuECdArQrHK69N9aTF/V1mmawxFt
         JT0g==
X-Gm-Message-State: AOJu0YzfW5df2ZeRkv63Xhh9L92wpOXnfuqE3p82zbuAieT5Y6Ca1P9l
	BMGF0BINiRy8bLy9JarfjD7P8N28Kcpul4G/T4D231BsOqsrnhm+TKZGL9k1815Gn1by7F25HqB
	SFKjGN62JCkkxCjNES2B1MFkMuw0=
X-Gm-Gg: ASbGncteYy9AuOUFzZeI/Z+T7lzzhwQta9tkYk7DaeKxOcGFx4iuU9slcjnQwM/faSH
	+ohEimxE72rJA36AQ3bmbkTH+MFj/p3xNt/IhKQGXLXNWpWfO4edW6odVc+W1gb2ds/o/OD3cZL
	ZG9yg4O3mfxrxB+jyf3Jllra/LOQ==
X-Google-Smtp-Source: AGHT+IHFfFzsx7iEJiojZnkbk0MSBpzqL4dLxEu08Isn44KLD9haA/ye1rU4Eb1kmWLi/zfbF5NJzqS3+8t3qjxyCuI=
X-Received: by 2002:a05:6a00:1489:b0:736:55ec:ea8b with SMTP id
 d2e1a72fcca58-73980455486mr27582867b3a.24.1743593081824; Wed, 02 Apr 2025
 04:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <a5b5e19262e51cd9b14e65f42efc3367b1af99e2.camel@linuxfoundation.org>
In-Reply-To: <a5b5e19262e51cd9b14e65f42efc3367b1af99e2.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Apr 2025 07:24:32 -0400
X-Gm-Features: AQ5f1Jr5MeVo6GegDw0CEyR31JpKkf7ClR6knpidyNzbtWxgsWmjvtyCEXKTGhY
Message-ID: <CADkTA4OhVfOX0VPz_JcV3FzJ553Smd8OOAMb6xkHzD-cSGSsGw@mail.gmail.com>
Subject: Re: Whitespace syntax warnings for meta-virtualization
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000466ebd0631c9e6b8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 11:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9189

--000000000000466ebd0631c9e6b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:01=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi Bruce,
>
> I just wanted to give a headsup that there is a patch for bitbake that
> adds warnings for whitespace syntax which we're likely to deprecate:
>
> https://lists.openembedded.org/g/bitbake-devel/message/17508
>
> I've posted it so people can start seeing how bad some other layers
> look. I did sort out OE-Core/meta-oe, at least on the most part.
>
> For meta-virtualization, this results in ~1300 warnings:
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1253/s=
teps/12/logs/warnings
>
> Most of these look like they might be script generated, so a small
> tweak to those generator scripts might address many of them (he says
> optimistically!).
>

Yes, very much script generated for the go recipes. I'll fix them in tree
and
then fix the script after.


> Many of the others are isolated to a handful of files which can likely
> be cleaned up relatively easily too.
>

A script should also sort that out as well.


>
> I wanted to give a headsup of the issue and offer that I'm happy to try
> and help resolve it if that is helpful. I know you sometimes prefer
> your own patches so just let me know if any help is useful. I also
> wanted to ask how you wanted to handle it before everyone starts
> sending patches.
>
>
My only concern is that it will cause a bit of a "history wall" in the
code, but there's no way to avoid that.



> I do appreciate we're in the middle of release. Personally, I'm in a
> lull while core is in testing so I've switched to trying to clean up a
> few different ongoing development threads that were deferred until post
> release. I appreciate I'm therefore a bit ahead of where others are.
> This isn't meant to be any kind of pressure, just a headsup and a
> question about if/whether/how any help makes sense, partly to avoid you
> getting a load of patches you might not want.
>

I'll do a mass conversion myself to fix up the whitespace issues,
unless you already have one that you are locally testing in that case,
feel free to send it, and then I'll fixup the stragglers.

I assume this will land in master of bitbake shortly ? I haven't
branched meta-virt for release yet, and won't for a bit. But I don't
mind a patch like this in both as it isn't changing functionality and
will make backporting fixes easier.

Bruce



> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000466ebd0631c9e6b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 2, 2025 at 7:01=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Bruce,<br>
<br>
I just wanted to give a headsup that there is a patch for bitbake that<br>
adds warnings for whitespace syntax which we&#39;re likely to deprecate:<br=
>
<br>
<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/17508" re=
l=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/bitbake=
-devel/message/17508</a><br>
<br>
I&#39;ve posted it so people can start seeing how bad some other layers<br>
look. I did sort out OE-Core/meta-oe, at least on the most part.<br>
<br>
For meta-virtualization, this results in ~1300 warnings:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/1253/steps/12/logs/warnings" rel=3D"noreferrer" target=3D"_blank">https:=
//autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1253/steps/12/=
logs/warnings</a><br>
<br>
Most of these look like they might be script generated, so a small<br>
tweak to those generator scripts might address many of them (he says<br>
optimistically!).<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small"> Yes, very much script generated for the =
go recipes. I&#39;ll fix them in tree and</div><div class=3D"gmail_default"=
 style=3D"font-size:small">then fix the script after.</div></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Many of the others are isolated to a handful of files which can likely<br>
be cleaned up relatively easily too.<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">A script should also s=
ort that out as well.</div></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
I wanted to give a headsup of the issue and offer that I&#39;m happy to try=
<br>
and help resolve it if that is helpful. I know you sometimes prefer<br>
your own patches so just let me know if any help is useful. I also<br>
wanted to ask how you wanted to handle it before everyone starts<br>
sending patches.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">My only concern is that it will cause a bit of a &quot;his=
tory wall&quot; in the</div><div class=3D"gmail_default" style=3D"font-size=
:small">code, but there&#39;s no way to avoid that.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I do appreciate we&#39;re in the middle of release. Personally, I&#39;m in =
a<br>
lull while core is in testing so I&#39;ve switched to trying to clean up a<=
br>
few different ongoing development threads that were deferred until post<br>
release. I appreciate I&#39;m therefore a bit ahead of where others are.<br=
>
This isn&#39;t meant to be any kind of pressure, just a headsup and a<br>
question about if/whether/how any help makes sense, partly to avoid you<br>
getting a load of patches you might not want.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll do a=
 mass conversion myself to fix up the whitespace issues,</div><div class=3D=
"gmail_default" style=3D"font-size:small">unless you already have one that =
you are locally testing in that case,</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">feel free to send it, and then I&#39;ll fixup the st=
ragglers.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I assume this w=
ill land in master of bitbake shortly ? I haven&#39;t</div><div class=3D"gm=
ail_default" style=3D"font-size:small">branched meta-virt for release yet, =
and won&#39;t for a bit. But I don&#39;t</div><div class=3D"gmail_default" =
style=3D"font-size:small">mind a patch like this in both as it isn&#39;t ch=
anging functionality and</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">will make backporting fixes easier.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000466ebd0631c9e6b8--

