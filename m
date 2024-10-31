Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801EDD767DA
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 15:02:28 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.14623.1730386947894866212
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 08:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A97D+xXt;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720c2db824eso446555b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730386947; x=1730991747; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L8TjkHHPbN65mw1IYltn1aGZpyGTYlqcBZiuR9c5SaM=;
        b=A97D+xXtHMZOBgfEeDlhmufiL3ar2J+aoeyDzoX/peRUL19qtFxoAC0zv/D2Am2cKE
         5mhN76ooJsa+m2fG6IdDzDNSuzbf4kVbP0eicC8ZEnzI9x9WKUL4L1ELwj9WWMRm5W3t
         6yQlgRjA9lCbx6u7PK3Dd38yvMRkyGB6HBxz7wdeEMRg6WT+Ua3GYkQAwuZnw5wk3prq
         ugJI/rqdY9v64JL8XgTVZm0cq2kl805MGXLcNRtqDMHlaYrkqPEXfyFpJ8E0UsQ/sMTR
         korV7QVHqIbc1buU/NtFL3oT4u0EyIouG2OOScaH+rQ3f6dSnx3U9KPKRJXufQp/cfGh
         GogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386947; x=1730991747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8TjkHHPbN65mw1IYltn1aGZpyGTYlqcBZiuR9c5SaM=;
        b=gU32LzOoeI5pZO91v1h+B6QIQqCqNWnEi2kNfUMZLBUoxMlWlXCyuUTIhIchnyZOOJ
         j/WrfYhKw7CMYWMa3RuAhF6WZUus2o6wzH+bfnlfi+RInQImF3VXGl5kAGMH3rKG301+
         VHtRAXjcPZLDzmHOTKa6SHyv3DsBkKTDJgaNoc/oFjGAwMAidiquwQ1K1/VQYejRhvP9
         EwboHjcxgs8uZ5gDsb2UA9u+oApLclG/S3DLHB0m2JJcqyyIMoScSv2hET5Ae5J+Bx+5
         7R1bJW3+iq5h9OekMIQc9hHj5uyRYl3WoyeItyKjkB8lTDRRhWcTVhHlEbfH9psxomP8
         62DA==
X-Gm-Message-State: AOJu0YzZL8vp5/yf7vJoZKS1uwWs3Vy7teEIA6Qx4oCkWDl9YiIFrJrk
	bpYpDcHcN520/6RrT+DnGBeVp3hmDqiZ+5ITYUWzOrBOSe/rI85lsahEGlSjXzWiv272DpJxxUq
	3rjj7Eo/cVMDvmzP7jMExn+AwaGM=
X-Google-Smtp-Source: AGHT+IHokdM4xWEuOnyeem/Mfya+3YdOPc+TUj5aR1csPAECse/XzeonDOrgVJup2nEOANRpFkvqSOVdJzfgLehbUHc=
X-Received: by 2002:a05:6a00:8cf:b0:71e:587d:f276 with SMTP id
 d2e1a72fcca58-72063093364mr25035040b3a.25.1730386947136; Thu, 31 Oct 2024
 08:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
 <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com> <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org>
In-Reply-To: <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Oct 2024 11:02:15 -0400
Message-ID: <CADkTA4MUU3ow6oDdg5WSqZHPbqZqozUc0mHXr853-z7cyUcCjw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git hash
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004ee4610625c71b13"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 15:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8947

--0000000000004ee4610625c71b13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Javier Tia <javier.tia@linaro.org> =
wrote:

> Hi Bruce,
>
> On 10/30/24 9:37 PM, Bruce Ashfield wrote:
> > On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via lists.yoctoproje=
ct.org <
> http://lists.yoctoproject.org> <javier.tia=3D
> linaro.org@lists.yoctoproject.org <mailto:
> linaro.org@lists.yoctoproject.org>> wrote:
> >
> >     upx recipe fails with:
> >
> >     ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find
> revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from
> upstream
> >     ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed:
> FetchError Fetcher failure for URL: 'gitsm://
> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/val=
grind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobra=
nch=3D1
> <
> http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dven=
dor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D=
1;nobranch=3D1>'.
> Unable to fetch URL from any source.
> >
> >     Likely, upstream rewrote the Git history.
> >
> >
> > I'll wait until I can reproduce this one myself:
> >
> > bitbake -c cleanall upx; bitbake upx
> >
> > I can also clone upx, reset it to the revision I'm currently using in
> meta-virt and do a git submodule init without issues.
> >
> > Just worked fine here. Were you doing anything different than a regular
> build when you hit it ?
>
> No, I am aware of it.
>
> For me, is easy to reproduce. Clone poky master, add meta-virtualization
> layer, add virtualization to DISTRO_FEATURES, change MACHINE to
> 'genericarm64' and `bitbake upx -c cleanall && bitbake upx` will do it.
>
>
Exactly the same thing works fine for me.

I'll continue to debug it here. I'll likely just update upx to tip, but
until I see the failure in my builds, I can't be sure I've fixed anything!

Bruce



> For future reference here is the complete log:
>
> ```
> $ bitbake upx
> Loading cache: 100%
> |########################################################################=
###################################################|
> Time: 0:00:00
> Loaded 4974 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.9.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "genericarm64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "5.1"
> TUNE_FEATURES        =3D "aarch64 armv8a crc"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "master:c83c0600f67b0806e571d9fcd6c1c267d756f54c=
"
> meta-oe
> meta-python          =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcdda=
"
> meta-networking
> meta-filesystems     =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcdda=
"
> meta-virtualization  =3D "master:72ea52031c045bb6b4e13856f324b3ec28e333df=
"
>
> Sstate summary: Wanted 245 Local 0 Mirrors 0 Missed 245 Current 0 (0%
> match, 0% complete)##########################################            =
 |
> ETA:  0:00:00
> Removing 10 stale sstate objects for arch armv8a: 100%
> |########################################################################=
################|
> Time: 0:00:00
> Removing 4 stale sstate objects for arch genericarm64: 100%
> |########################################################################=
###########|
> Time: 0:00:00
> Removing 96 stale sstate objects for arch x86_64: 100%
> |########################################################################=
################|
> Time: 0:00:00
> NOTE: Executing Tasks
> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/val=
grind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobra=
nch=3D1,
> attempting MIRRORS if available
> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revisio=
n
> 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
> ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed:
> FetchError Fetcher failure for URL: 'gitsm://
> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/val=
grind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobra=
nch=3D1'.
> Unable to fetch URL from any source.
> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel, attemptin=
g
> MIRRORS if available
> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure for URL: 'gitsm://
> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/val=
grind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobra=
nch=3D1'.
> Unable to fetch URL from any source.
> ERROR: upx-4.2.4+git-r0 do_fetch: Bitbake Fetcher Error:
> FetchError('Unable to fetch URL from any source.', 'gitsm://
> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel')
> ERROR: Logfile of failure stored in:
> /yocto-dev/build/tmp/work/armv8a-poky-linux/upx/4.2.4+git/temp/log.do_fet=
ch.54216
> ERROR: Task
> (/yocto-dev/meta-virtualization/recipes-extended/upx/upx_git.bb:do_fetch)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 328 tasks of which 0 didn't need to be
> rerun and 1 failed.
> ```
>
> =C2=BB Javier Tia =F0=9F=96=8B
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004ee4610625c71b13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Javier Tia =
&lt;<a href=3D"mailto:javier.tia@linaro.org">javier.tia@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruce,=
<br>
<br>
On 10/30/24 9:37 PM, Bruce Ashfield wrote:<br>
&gt; On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via <a href=3D"http=
://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yocto=
project.org</a> &lt;<a href=3D"http://lists.yoctoproject.org" rel=3D"norefe=
rrer" target=3D"_blank">http://lists.yoctoproject.org</a>&gt; &lt;javier.ti=
a=3D<a href=3D"mailto:linaro.org@lists.yoctoproject.org" target=3D"_blank">=
linaro.org@lists.yoctoproject.org</a> &lt;mailto:<a href=3D"mailto:linaro.o=
rg@lists.yoctoproject.org" target=3D"_blank">linaro.org@lists.yoctoproject.=
org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0upx recipe fails with:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: =
Unable to find revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch=
=C2=A0 even from upstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule =
download failed: FetchError Fetcher failure for URL: &#39;gitsm://<a href=
=3D"http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dv=
endor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=
=3D1;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/upx/upx-=
vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpath=3Dvendo=
r/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1</a> &lt;<a hr=
ef=3D"http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=
=3Dvendor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;barecl=
one=3D1;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">http://github.co=
m/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpa=
th=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1</a>=
&gt;&#39;. Unable to fetch URL from any source.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Likely, upstream rewrote the Git history.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ll wait until I can reproduce this one myself:<br>
&gt; <br>
&gt; bitbake -c cleanall upx; bitbake upx<br>
&gt; <br>
&gt; I can also clone upx, reset it to the revision I&#39;m currently using=
 in meta-virt and do a git submodule init without issues.<br>
&gt; <br>
&gt; Just worked fine here. Were you doing anything different than a regula=
r build when you hit it ?<br>
<br>
No, I am aware of it.<br>
<br>
For me, is easy to reproduce. Clone poky master, add meta-virtualization la=
yer, add virtualization to DISTRO_FEATURES, change MACHINE to &#39;generica=
rm64&#39; and `bitbake upx -c cleanall &amp;&amp; bitbake upx` will do it.<=
br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Exactly the same thing works fine for me.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I&#39;ll continue to debug it here. I&#3=
9;ll likely just update upx to tip, but until I see the failure in my build=
s, I can&#39;t be sure I&#39;ve fixed anything!</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
For future reference here is the complete log:<br>
<br>
```<br>
$ bitbake upx<br>
Loading cache: 100% |######################################################=
#####################################################################| Time=
: 0:00:00<br>
Loaded 4974 entries from dependency cache.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.9.1&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64-poky-l=
inux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;genericar=
m64&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;5.1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8a crc&quot;=
<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:c83c0600f67b0806e=
571d9fcd6c1c267d756f54c&quot;<br>
meta-oe<br>
meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:793557a317dd=
0393d9a68d0aa79e041d7bfdcdda&quot;<br>
meta-networking<br>
meta-filesystems=C2=A0 =C2=A0 =C2=A0=3D &quot;master:793557a317dd0393d9a68d=
0aa79e041d7bfdcdda&quot;<br>
meta-virtualization=C2=A0 =3D &quot;master:72ea52031c045bb6b4e13856f324b3ec=
28e333df&quot;<br>
<br>
Sstate summary: Wanted 245 Local 0 Mirrors 0 Missed 245 Current 0 (0% match=
, 0% complete)##########################################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Removing 10 stale sstate objects for arch armv8a: 100% |###################=
#####################################################################| Time=
: 0:00:00<br>
Removing 4 stale sstate objects for arch genericarm64: 100% |##############=
#####################################################################| Time=
: 0:00:00<br>
Removing 96 stale sstate objects for arch x86_64: 100% |###################=
#####################################################################| Time=
: 0:00:00<br>
NOTE: Executing Tasks<br>
WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://<a href=3D"=
http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendo=
r/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;=
nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/upx/upx-vendo=
r-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpath=3Dvendor/val=
grind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1</a>, attempting MI=
RRORS if available<br>
ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision =
5221596a608acbc8efed1e54f758bab1908ce7a8 in branch=C2=A0 even from upstream=
<br>
ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchEr=
ror Fetcher failure for URL: &#39;gitsm://<a href=3D"http://github.com/upx/=
upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpath=3Dv=
endor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1" rel=3D"n=
oreferrer" target=3D"_blank">github.com/upx/upx-vendor-valgrind.git;protoco=
l=3Dhttps;name=3Dvendor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=
=3DTrue;bareclone=3D1;nobranch=3D1</a>&#39;. Unable to fetch URL from any s=
ource.<br>
WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://<a href=3D"=
http://github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel" rel=
=3D"noreferrer" target=3D"_blank">github.com/upx/upx;protocol=3Dhttps;;name=
=3Dupx;branch=3Ddevel</a>, attempting MIRRORS if available<br>
ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure for URL: &#39;gitsm://<a =
href=3D"http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=
=3Dvendor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;barecl=
one=3D1;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/upx/u=
px-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/valgrind;subpath=3Dve=
ndor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1</a>&#39;. =
Unable to fetch URL from any source.<br>
ERROR: upx-4.2.4+git-r0 do_fetch: Bitbake Fetcher Error: FetchError(&#39;Un=
able to fetch URL from any source.&#39;, &#39;gitsm://<a href=3D"http://git=
hub.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel" rel=3D"norefer=
rer" target=3D"_blank">github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;bran=
ch=3Ddevel</a>&#39;)<br>
ERROR: Logfile of failure stored in: /yocto-dev/build/tmp/work/armv8a-poky-=
linux/upx/4.2.4+git/temp/log.do_fetch.54216<br>
ERROR: Task (/yocto-dev/meta-virtualization/recipes-extended/upx/upx_git.bb=
:do_fetch) failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 328 tasks of which 0 didn&#39;t need to be r=
erun and 1 failed.<br>
```<br>
<br>
=C2=BB Javier Tia =F0=9F=96=8B<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000004ee4610625c71b13--

