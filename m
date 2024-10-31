Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD67E67483
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:44:40 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.22810.1730407471002250965
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 13:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+RfqxVF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso937356a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730407470; x=1731012270; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/HseNpUA8CxDeHKuj1OjQAuw0RBVqItus5bIYSeLFk=;
        b=U+RfqxVFE1bzc9EgHIm/R88IO9dIDtunfp0CAMgQbdzzIUxODH54USfQNnJlkyiP1P
         vZskXtEMrYEuoJOTtTNPOLN3CSZA3IzMVk2KiyrbP2GVSCuElYiOJIVZb0w2b7Pg3gX3
         JjogBJWIchNRAjPMXX3N42uD46jRiA/1WLY5pUh5I6ubt2N++HQpswQkAF2Fe7yviiid
         wJC1Cqz7sshymwAqBu2szjNUlYqqAOzRKQ1qkQa2+WbDoZn68qqrgrkLTomrT2CbjiTg
         LberqxxdVYUu96bwVhQzCxeGHzQ89z+8QjtVJEmqO1/XWk+oQd9nToj+5pahkIl5oWP5
         mXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730407470; x=1731012270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/HseNpUA8CxDeHKuj1OjQAuw0RBVqItus5bIYSeLFk=;
        b=r2GK4I+rJ8FDz8jxncOvDY3mnAm+oggXUZEQRdsuav3V9n/BC3NMimq6TqcVwd75Aw
         zuAr5JKrh/Dl7jq0/gWxaLQyL4dfvKSSMp1E1zcfeFCTzXPI/vh7qEqkZgoLgzV9bXem
         4D4kgZoYzADSejKznXhg/hrTSZPIzKzIxFNDC6Pf/uW5laBsciQyXAHifuw2Dt9/cQnr
         rR89iZRkulzbvjKSdq2t5RXYqNaRjB46MOFfVXPgxDjlxLVemh59ZXwkf/0apaGPvetd
         PGlLRaZsDyl++H3fNkx7rVcAR3n7Hg8ZLO5JOv+FSiXN07m8gzASARUNVBLHXWhpFt2u
         VLZg==
X-Forwarded-Encrypted: i=1; AJvYcCUo3Sp6WJC0T3ujNpzdCP0WAmXTNSbwSVLHyino/7UCAdMWZBUYGVPK9uRmNcy4Kx3qozia7bPSwsZ9HCcXH5V4BKOS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyy4pGzUxn7PjWvHkOYOmiT+8iXTUOGYdxFY2VHxKkyIX68hysD
	H5lDMp+UvZorEhOBDK1Zgs4OPAW7eZKzyVJ88gIe59gMVljOQkg6b+aI5idzvXlMFN1aPffXGhJ
	AEsZdyDYMyw5C0aeXSdkRpHmiW7g=
X-Google-Smtp-Source: AGHT+IFzh4f1CXO9+5nIXLz4fab4nHgaU6UjEkGil7T1vukmKdrkjbDwWNSINXr+oWJPmnSfJITEa6LR456MDCJfnvI=
X-Received: by 2002:a17:90b:53c5:b0:2d8:b043:9414 with SMTP id
 98e67ed59e1d1-2e93e0fcd7cmr5678955a91.18.1730407469987; Thu, 31 Oct 2024
 13:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
 <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com>
 <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org> <180391C2E0114A47.6352@lists.yoctoproject.org>
In-Reply-To: <180391C2E0114A47.6352@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Oct 2024 16:44:18 -0400
Message-ID: <CADkTA4OHHLZv4Fy3w9A1xEOHQuoyMBYGb+VGLaQa3uybND2aGw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git hash
To: bruce.ashfield@gmail.com
Cc: Javier Tia <javier.tia@linaro.org>, meta-virtualization@lists.yoctoproject.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000090bf5e0625cbe223"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 20:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8949

--00000000000090bf5e0625cbe223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 11:02=E2=80=AFAM Bruce Ashfield via lists.yoctoproj=
ect.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Javier Tia <javier.tia@linaro.org=
> wrote:
>
>> Hi Bruce,
>>
>> On 10/30/24 9:37 PM, Bruce Ashfield wrote:
>> > On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via lists.yoctoproj=
ect.org <
>> http://lists.yoctoproject.org> <javier.tia=3D
>> linaro.org@lists.yoctoproject.org <mailto:
>> linaro.org@lists.yoctoproject.org>> wrote:
>> >
>> >     upx recipe fails with:
>> >
>> >     ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find
>> revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from
>> upstream
>> >     ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed=
:
>> FetchError Fetcher failure for URL: 'gitsm://
>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/va=
lgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobr=
anch=3D1
>> <
>> http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dve=
ndor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=
=3D1;nobranch=3D1>'.
>> Unable to fetch URL from any source.
>> >
>> >     Likely, upstream rewrote the Git history.
>> >
>> >
>> > I'll wait until I can reproduce this one myself:
>> >
>> > bitbake -c cleanall upx; bitbake upx
>> >
>> > I can also clone upx, reset it to the revision I'm currently using in
>> meta-virt and do a git submodule init without issues.
>> >
>> > Just worked fine here. Were you doing anything different than a regula=
r
>> build when you hit it ?
>>
>> No, I am aware of it.
>>
>> For me, is easy to reproduce. Clone poky master, add meta-virtualization
>> layer, add virtualization to DISTRO_FEATURES, change MACHINE to
>> 'genericarm64' and `bitbake upx -c cleanall && bitbake upx` will do it.
>>
>>
> Exactly the same thing works fine for me.
>
> I'll continue to debug it here. I'll likely just update upx to tip, but
> until I see the failure in my builds, I can't be sure I've fixed anything=
!
>

It looks like I was being fed a cached repository from a mirror. When I
switched configurations (I switched builders), I can see it now.

Although, I have no idea why my manual clones were working, since they
don't use that infrastructure. I'm going to debug that a bit more.

I'll get this fixed on Friday (assuming I satisfy my manual clone
curiosity).

Bruce



>
> Bruce
>
>
>
>> For future reference here is the complete log:
>>
>> ```
>> $ bitbake upx
>> Loading cache: 100%
>> |#######################################################################=
####################################################|
>> Time: 0:00:00
>> Loaded 4974 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           =3D "2.9.1"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "aarch64-poky-linux"
>> MACHINE              =3D "genericarm64"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D "5.1"
>> TUNE_FEATURES        =3D "aarch64 armv8a crc"
>> TARGET_FPU           =3D ""
>> meta
>> meta-poky
>> meta-yocto-bsp       =3D "master:c83c0600f67b0806e571d9fcd6c1c267d756f54=
c"
>> meta-oe
>> meta-python          =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcdd=
a"
>> meta-networking
>> meta-filesystems     =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcdd=
a"
>> meta-virtualization  =3D "master:72ea52031c045bb6b4e13856f324b3ec28e333d=
f"
>>
>> Sstate summary: Wanted 245 Local 0 Mirrors 0 Missed 245 Current 0 (0%
>> match, 0% complete)##########################################           =
  |
>> ETA:  0:00:00
>> Removing 10 stale sstate objects for arch armv8a: 100%
>> |#######################################################################=
#################|
>> Time: 0:00:00
>> Removing 4 stale sstate objects for arch genericarm64: 100%
>> |#######################################################################=
############|
>> Time: 0:00:00
>> Removing 96 stale sstate objects for arch x86_64: 100%
>> |#######################################################################=
#################|
>> Time: 0:00:00
>> NOTE: Executing Tasks
>> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/va=
lgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobr=
anch=3D1,
>> attempting MIRRORS if available
>> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find
>> revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from
>> upstream
>> ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed:
>> FetchError Fetcher failure for URL: 'gitsm://
>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/va=
lgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobr=
anch=3D1'.
>> Unable to fetch URL from any source.
>> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
>> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel, attempti=
ng
>> MIRRORS if available
>> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure for URL: 'gitsm://
>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/va=
lgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobr=
anch=3D1'.
>> Unable to fetch URL from any source.
>> ERROR: upx-4.2.4+git-r0 do_fetch: Bitbake Fetcher Error:
>> FetchError('Unable to fetch URL from any source.', 'gitsm://
>> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel')
>> ERROR: Logfile of failure stored in:
>> /yocto-dev/build/tmp/work/armv8a-poky-linux/upx/4.2.4+git/temp/log.do_fe=
tch.54216
>> ERROR: Task
>> (/yocto-dev/meta-virtualization/recipes-extended/upx/upx_git.bb:do_fetch=
)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 328 tasks of which 0 didn't need to be
>> rerun and 1 failed.
>> ```
>>
>> =C2=BB Javier Tia =F0=9F=96=8B
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8947):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8947
> Mute This Topic: https://lists.yoctoproject.org/mt/109307127/1050810
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

--00000000000090bf5e0625cbe223
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 11:02=E2=80=AFAM Bruce Ashf=
ield via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</=
a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org"=
>gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Ja=
vier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" target=3D"_blank">jav=
ier.tia@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Bruce,<br>
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
<br></blockquote><div><br></div><div><div style=3D"font-size:small">Exactly=
 the same thing works fine for me.</div><div style=3D"font-size:small"><br>=
</div><div style=3D"font-size:small">I&#39;ll continue to debug it here. I&=
#39;ll likely just update upx to tip, but until I see the failure in my bui=
lds, I can&#39;t be sure I&#39;ve fixed anything!</div></div></div></div></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">It looks like I was being fed a cached repository=C2=A0from a mi=
rror. When I switched configurations (I switched builders), I can see it no=
w.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Although, I have no id=
ea why my manual clones were working, since they don&#39;t use that infrast=
ructure. I&#39;m going to debug that a bit more.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">I&#39;ll get this fixed on Friday (assuming I satis=
fy my manual clone curiosity).</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div st=
yle=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8947): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8947" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8947</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109307127/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109307127/1050810</a><br>
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

--00000000000090bf5e0625cbe223--

