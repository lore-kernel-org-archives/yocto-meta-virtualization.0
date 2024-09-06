Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB80CCE7B17
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:45:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.35404.1725630344810441113
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 06:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iMaX6iQ/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d885019558so1529911a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725630344; x=1726235144; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b8nK3V0i5BU5no9nM/kXqzmK+vzHGe8YkHVYfdNclmM=;
        b=iMaX6iQ/ssU+P/KYYq7lEh6BNGPC2cCmFohZJBOjvIQryNbDD5E66mecHVsWnIMGCN
         n/1WzwPZ706R5RBeX/aaCnpO9vy7KtGYrV/X+BG9xsUinAeJ8mUzMS9uIgO3n8Yzzjs6
         8BbqvOti8IimsvhypCYhLqsS0zs833Ad7gmLgQTpx4F8xJGo78hWZoizfPHIbMSdKSJg
         AHHMthcCh7zUT7IOw+hdTchu4Ewz0cBISy4u7Ifxx1whXR7rudoqLbvmYXtI1SzFLuv3
         mvG+0pe0cTc+MZu56zUegJOpHZF9USFyy9hhZ7jX15BnHmbVOhGBVParpAjb/UkTRAKi
         SWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630344; x=1726235144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8nK3V0i5BU5no9nM/kXqzmK+vzHGe8YkHVYfdNclmM=;
        b=D2XU/WFE7zg5zkqxo1z/d/I/QWblfjeESKlh7hKDp0crDHlcGTF8hjtyr8w4cXdC0/
         B8d4vSxN8Hk0+LyGGwhI562/nHLMp2NB00bV/w7/705uTwMM/21Cz5bvYtdrIZjfiBKc
         HYUdVgy6cmoHmCP9jbHGRW/t4YCdI9e4hrvaAHxjmX7nonZ/Atl9aro8B/O79ONt88zO
         b0//II7GZUEqhLK72fE+Bt4RnWJ/wKvJn7gh2HTw+WkD3Xr+sms6WRb2PpzMgdLsY7M9
         H3RKRyuNFO07LBnSMCtEFzfxgZTejgUMK3D8/R44yHB/lsyLMRcCM9ABr4BGuVS/LNJQ
         sdBw==
X-Gm-Message-State: AOJu0YxbLCVEDHY/afx6thPVvNn2/9+WjJMU5Ak/2GY09fKglGvTSxSZ
	xfxlpIYq54TKHa3d6Sd2oX8Wr8ITF4YZTPo+40XhjcjGFnSCJMWhA1tyGh3gK+oJzMYHxrl1LUh
	TlsHVvkbstaUZWK+RyZk6f5zTorwQYg==
X-Google-Smtp-Source: AGHT+IFBikp4PPZQOlRGHVD6ikXRGLjvQRMlMwB9uKYjRFxw+Iju7TpR9QZPphnX9zUw+M0S0TC5Tdh/EFgUVWubXUU=
X-Received: by 2002:a17:90b:3015:b0:2d6:1981:bbf7 with SMTP id
 98e67ed59e1d1-2dad5181bfemr3071986a91.32.1725630344000; Fri, 06 Sep 2024
 06:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv340PmSBG6jC-qjPm4kBVeVYfWLukgyBh3pt+wXE+eC52w@mail.gmail.com>
In-Reply-To: <CAAfyv340PmSBG6jC-qjPm4kBVeVYfWLukgyBh3pt+wXE+eC52w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Sep 2024 09:45:32 -0400
Message-ID: <CADkTA4M4Qsnxa29FfgNqN7Zds+a7_+WYKrgpCjBfjF0Ox+-FvQ@mail.gmail.com>
Subject: Re: [meta-virtualization] meta-cloud-services: fluentd issue
To: marek.belisko@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000aaffa40621739fa4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 13:45:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8874

--000000000000aaffa40621739fa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 7:12=E2=80=AFAM Marek Belisko via lists.yoctoproject=
.org
<marek.belisko=3Dgmail.com@lists.yoctoproject.org> wrote:

> Hi,
>
> I'm including meta-cloud-services to my project in order to have a fluent=
d
> package in my image. When I run the build I'm getting various error that
> libraries have incorrect format (e.g.):
>
> ERROR: strptime-0.2.5-r0 do_populate_sysroot: Fatal errors occurred in
> subprocesses:
> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment',
> '--remove-section=3D.note', '--strip-unneeded',
> '/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/=
ext/strptime/strptime.so']'
> returned non-zero exit status 1.
> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the forma=
t
> of the input file
> `/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/=
ext/strptime/strptime.so'
> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment',
> '--remove-section=3D.note', '--strip-unneeded',
> '/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/=
lib/strptime/strptime.so']'
> returned non-zero exit status 1.
> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the forma=
t
> of the input file
> `/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/=
lib/strptime/strptime.so'
> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment',
> '--remove-section=3D.note', '--strip-unneeded',
> '/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_64-li=
nux/3.1.0/strptime-0.2.5/strptime/strptime.so']'
> returned non-zero exit status 1.
> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the forma=
t
> of the input file
> `/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/str=
ptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_64-li=
nux/3.1.0/strptime-0.2.5/strptime/strptime.so'
>
> and when I check the library it's compiled for x86_64 while my target is
> arm64.
>
> I'm using kirkstone branch. Am  I doing something wrong?
>

I'm overdue to update the recipes. in meta-cloud-services, so I can have a
look at
this when I get to that. Typically, most of my m-c-s has been for x86
targets, so
Clearly there are some cross compile issues still lurking in some of the
recipes.

Bruce



>
> Thanks and BR,
>
> marek
>
>
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8871):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8871
> Mute This Topic: https://lists.yoctoproject.org/mt/108302254/1050810
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

--000000000000aaffa40621739fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 6, 2024 at 7:12=E2=80=AFAM Marek Belisk=
o via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;marek.belisko=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gma=
il.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I&#39;=
m including=C2=A0meta-cloud-services to my project in order to have a fluen=
td package in my image. When I run the build I&#39;m getting various error =
that libraries have incorrect format (e.g.):<br><br></div><div>ERROR: strpt=
ime-0.2.5-r0 do_populate_sysroot: Fatal errors occurred in subprocesses:<br=
>Command &#39;[&#39;aarch64-poky-linux-strip&#39;, &#39;--remove-section=3D=
.comment&#39;, &#39;--remove-section=3D.note&#39;, &#39;--strip-unneeded&#3=
9;, &#39;/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-lin=
ux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-=
0.2.5/ext/strptime/strptime.so&#39;]&#39; returned non-zero exit status 1.<=
br>Subprocess output:aarch64-poky-linux-strip: Unable to recognise the form=
at of the input file `/data/projects/test-build/build/tmp/work/cortexa53-cr=
ypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/g=
ems/strptime-0.2.5/ext/strptime/strptime.so&#39;<br>Command &#39;[&#39;aarc=
h64-poky-linux-strip&#39;, &#39;--remove-section=3D.comment&#39;, &#39;--re=
move-section=3D.note&#39;, &#39;--strip-unneeded&#39;, &#39;/data/projects/=
test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sys=
root-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/strptime/strpt=
ime.so&#39;]&#39; returned non-zero exit status 1.<br>Subprocess output:aar=
ch64-poky-linux-strip: Unable to recognise the format of the input file `/d=
ata/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime=
/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/s=
trptime/strptime.so&#39;<br>Command &#39;[&#39;aarch64-poky-linux-strip&#39=
;, &#39;--remove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39=
;, &#39;--strip-unneeded&#39;, &#39;/data/projects/test-build/build/tmp/wor=
k/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/rub=
y/gems/3.1.0/extensions/x86_64-linux/3.1.0/strptime-0.2.5/strptime/strptime=
.so&#39;]&#39; returned non-zero exit status 1.<br>Subprocess output:aarch6=
4-poky-linux-strip: Unable to recognise the format of the input file `/data=
/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.=
2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_64-linux/3.1.=
0/strptime-0.2.5/strptime/strptime.so&#39;</div><div><br></div><div>and whe=
n I check the library it&#39;s compiled=C2=A0for x86_64 while my target is =
arm64.</div><div><br></div><div>I&#39;m using kirkstone branch. Am=C2=A0 I =
doing something wrong?=C2=A0=C2=A0</div></div></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m overdue =
to update the recipes. in meta-cloud-services, so I can have a look at</div=
><div class=3D"gmail_default" style=3D"font-size:small">this when I get to =
that. Typically, most of my m-c-s has been for x86 targets, so</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Clearly there are some cros=
s compile issues still lurking in some of the recipes.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div>=
<div>Thanks and BR,</div><div><br></div><div>marek</div><div><br></div><div=
><br></div><div><div><br></div><span class=3D"gmail_signature_prefix">-- </=
span><br><div dir=3D"ltr" class=3D"gmail_signature">as simple and primitive=
 as possible<br>-------------------------------------------------<br>Marek =
Belisko - OPEN-NANDRA<br>Freelance Developer<br><br>Ruska Nova Ves 219 | Pr=
esov, 08005 Slovak Republic<br>Tel: +421 915 052 184<br>skype: marekwhite<b=
r>twitter: #opennandra<br>web: <a href=3D"http://open-nandra.com" target=3D=
"_blank">http://open-nandra.com</a></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8871): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8871" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8871</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/108302254/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/108302254/1050810</a><br>
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
r></div></div>

--000000000000aaffa40621739fa4--

