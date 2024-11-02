Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15410E677E5
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:13:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.11212.1730520814363727302
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVPHkD/L;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso2054609a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520814; x=1731125614; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DGuBZnfTvamTGDFIQ50BXwUI3Az06DdACqqYrgxB+XY=;
        b=iVPHkD/LPJDHe/yi3Leun/F3CF4IcBRDIQ3fauLqhSxR6czhl4dWuubx+/NLXrbAx5
         XkCqHDddPWAuozUPLqwxb2OXWMBbnkQasvkTIs0WOIKtRlU6lV3piWt6rqO1LiIgOHzi
         Au3ZP4LWzgVnmMzCGGN7u5tj4ZkluNlkl9F3K3Dsfwjz9Dg0AMQnYrm1qzWyEcpGkG1f
         AUz5XohG4cKAuJc6p5qDa5iCecF9vpOopopjcITOyXoH+pOMHBQxJbeK0TdR6TgMiYRW
         /huYqgpePQxmV9s/JOxbyE5nkUhcCqTRzPj1eY6D1vux1vyyuguZXRPyL2BUy6VRu89+
         R6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520814; x=1731125614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGuBZnfTvamTGDFIQ50BXwUI3Az06DdACqqYrgxB+XY=;
        b=IizcMoFSHoGiWrQLRTdWABlU/PGR+r92Ydk5O3sqlk6/sBqjZDdUtuG1jE/TlllEJj
         Z4ribsbzlOZ0xizZf6tvbnTMEM5Zvkb+0ldbhSPIr0QWfmxzDbZexPwJClhptPFTK1jq
         0JKjVdCJ8xgUin5bURQic2tQI1mnbsfw7KjOjAosY7p9wxz3JPmFmxBZv8yAF5tXHABZ
         0+og3fBW7N0rkhec5Lre4W+cw6X/R7gcbtqnLUsm4FmYMcFNREX+7SjMlBp3qCi9nZ3p
         voz7K3aY6r6LyLutDMuFxdDdjwC6ume1AqZXj5Ezu9iBaCIq4Pe7osrtaDWk3dOlbHKs
         yTAA==
X-Forwarded-Encrypted: i=1; AJvYcCVoc8IT0y97rAu2ftZGw1o9Rnd4O8fznKUYMPHPPpg7HI7NcnxgwopPBMNiOScJuTGVouExfrd76NvPAZr/33YD3ekp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxOgHzI+VrZpRUI0h9oOvOatCsITGWJ5AxwhmIsNY3stPkLSOwY
	xC4b9MNpqtkM3Odt7p1VcPc2OsfqQylmB2DvxUeUCgQCrHm+foRgc5Aee9AQ8U/eEEMl52i/4Tz
	JRQxB7TmBG+FlFT6W80od4H9GoEH09w==
X-Google-Smtp-Source: AGHT+IGx6UZgWRv1TiD9eDo9tNN9C1UHtR3YVXJlxKwkDtjRiyfYjq95EKpgCSO6XDyDEb013pXsere3rmaXwh8YHBU=
X-Received: by 2002:a17:902:d511:b0:20c:bea0:8d10 with SMTP id
 d9443c01a7336-210f751ae6emr193457915ad.20.1730520813456; Fri, 01 Nov 2024
 21:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
 <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com>
 <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org> <180391C2E0114A47.6352@lists.yoctoproject.org>
 <1803A46D49AD0D53.1077@lists.yoctoproject.org>
In-Reply-To: <1803A46D49AD0D53.1077@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Nov 2024 00:13:22 -0400
Message-ID: <CADkTA4N_j57wcmcQ=xESam+V2kbp7E79CVo9+qyi3bVH7ZYBVQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git hash
To: bruce.ashfield@gmail.com
Cc: Javier Tia <javier.tia@linaro.org>, meta-virtualization@lists.yoctoproject.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005cd42d0625e64609"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8955

--0000000000005cd42d0625e64609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 4:44=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Oct 31, 2024 at 11:02=E2=80=AFAM Bruce Ashfield via lists.yoctopr=
oject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Javier Tia <javier.tia@linaro.or=
g> wrote:
>>
>>> Hi Bruce,
>>>
>>> On 10/30/24 9:37 PM, Bruce Ashfield wrote:
>>> > On Wed, Oct 30, 2024 at 8:38=E2=80=AFPM Javier Tia via lists.yoctopro=
ject.org
>>> <http://lists.yoctoproject.org> <javier.tia=3D
>>> linaro.org@lists.yoctoproject.org <mailto:
>>> linaro.org@lists.yoctoproject.org>> wrote:
>>> >
>>> >     upx recipe fails with:
>>> >
>>> >     ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find
>>> revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from
>>> upstream
>>> >     ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download
>>> failed: FetchError Fetcher failure for URL: 'gitsm://
>>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/v=
algrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nob=
ranch=3D1
>>> <
>>> http://github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dv=
endor/valgrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=
=3D1;nobranch=3D1>'.
>>> Unable to fetch URL from any source.
>>> >
>>> >     Likely, upstream rewrote the Git history.
>>> >
>>> >
>>> > I'll wait until I can reproduce this one myself:
>>> >
>>> > bitbake -c cleanall upx; bitbake upx
>>> >
>>> > I can also clone upx, reset it to the revision I'm currently using in
>>> meta-virt and do a git submodule init without issues.
>>> >
>>> > Just worked fine here. Were you doing anything different than a
>>> regular build when you hit it ?
>>>
>>> No, I am aware of it.
>>>
>>> For me, is easy to reproduce. Clone poky master, add meta-virtualizatio=
n
>>> layer, add virtualization to DISTRO_FEATURES, change MACHINE to
>>> 'genericarm64' and `bitbake upx -c cleanall && bitbake upx` will do it.
>>>
>>>
>> Exactly the same thing works fine for me.
>>
>> I'll continue to debug it here. I'll likely just update upx to tip, but
>> until I see the failure in my builds, I can't be sure I've fixed anythin=
g!
>>
>
> It looks like I was being fed a cached repository from a mirror. When I
> switched configurations (I switched builders), I can see it now.
>
> Although, I have no idea why my manual clones were working, since they
> don't use that infrastructure. I'm going to debug that a bit more.
>
> I'll get this fixed on Friday (assuming I satisfy my manual clone
> curiosity).
>

I went a different way with this. I've had "issues" with this git
repository in the past (failing fetcher tests, etc)

I've already done one switch from gitsm to individual git fetches and then
back to gitsm.

I've gone back to individual fetches, since I tested the tip of the tree
and it is still broken with gitsm fetching.

This worked on all my builders, let me know if you still see issues.

Bruce



>
> Bruce
>
>
>
>>
>> Bruce
>>
>>
>>
>>> For future reference here is the complete log:
>>>
>>> ```
>>> $ bitbake upx
>>> Loading cache: 100%
>>> |######################################################################=
#####################################################|
>>> Time: 0:00:00
>>> Loaded 4974 entries from dependency cache.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION           =3D "2.9.1"
>>> BUILD_SYS            =3D "x86_64-linux"
>>> NATIVELSBSTRING      =3D "universal"
>>> TARGET_SYS           =3D "aarch64-poky-linux"
>>> MACHINE              =3D "genericarm64"
>>> DISTRO               =3D "poky"
>>> DISTRO_VERSION       =3D "5.1"
>>> TUNE_FEATURES        =3D "aarch64 armv8a crc"
>>> TARGET_FPU           =3D ""
>>> meta
>>> meta-poky
>>> meta-yocto-bsp       =3D "master:c83c0600f67b0806e571d9fcd6c1c267d756f5=
4c"
>>> meta-oe
>>> meta-python          =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcd=
da"
>>> meta-networking
>>> meta-filesystems     =3D "master:793557a317dd0393d9a68d0aa79e041d7bfdcd=
da"
>>> meta-virtualization  =3D "master:72ea52031c045bb6b4e13856f324b3ec28e333=
df"
>>>
>>> Sstate summary: Wanted 245 Local 0 Mirrors 0 Missed 245 Current 0 (0%
>>> match, 0% complete)##########################################          =
   |
>>> ETA:  0:00:00
>>> Removing 10 stale sstate objects for arch armv8a: 100%
>>> |######################################################################=
##################|
>>> Time: 0:00:00
>>> Removing 4 stale sstate objects for arch genericarm64: 100%
>>> |######################################################################=
#############|
>>> Time: 0:00:00
>>> Removing 96 stale sstate objects for arch x86_64: 100%
>>> |######################################################################=
##################|
>>> Time: 0:00:00
>>> NOTE: Executing Tasks
>>> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
>>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/v=
algrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nob=
ranch=3D1,
>>> attempting MIRRORS if available
>>> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find
>>> revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from
>>> upstream
>>> ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed:
>>> FetchError Fetcher failure for URL: 'gitsm://
>>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/v=
algrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nob=
ranch=3D1'.
>>> Unable to fetch URL from any source.
>>> WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://
>>> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel, attempt=
ing
>>> MIRRORS if available
>>> ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure for URL: 'gitsm://
>>> github.com/upx/upx-vendor-valgrind.git;protocol=3Dhttps;name=3Dvendor/v=
algrind;subpath=3Dvendor/valgrind;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nob=
ranch=3D1'.
>>> Unable to fetch URL from any source.
>>> ERROR: upx-4.2.4+git-r0 do_fetch: Bitbake Fetcher Error:
>>> FetchError('Unable to fetch URL from any source.', 'gitsm://
>>> github.com/upx/upx;protocol=3Dhttps;;name=3Dupx;branch=3Ddevel')
>>> ERROR: Logfile of failure stored in:
>>> /yocto-dev/build/tmp/work/armv8a-poky-linux/upx/4.2.4+git/temp/log.do_f=
etch.54216
>>> ERROR: Task
>>> (/yocto-dev/meta-virtualization/recipes-extended/upx/upx_git.bb:do_fetc=
h)
>>> failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 328 tasks of which 0 didn't need to be
>>> rerun and 1 failed.
>>> ```
>>>
>>> =C2=BB Javier Tia =F0=9F=96=8B
>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>>
>>
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
> View/Reply Online (#8949):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8949
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

--0000000000005cd42d0625e64609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 4:44=E2=80=AFPM Bruce Ashfi=
eld via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 31, 2024 at 11:02=E2=80=AFAM B=
ruce Ashfield via <a href=3D"http://lists.yoctoproject.org" target=3D"_blan=
k">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.=
com@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Oct 31, 2024 at 9:26=E2=80=AFAM Javier Tia &lt;<a href=3D"mailto=
:javier.tia@linaro.org" target=3D"_blank">javier.tia@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruce,<br=
>
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
blockquote><div><br></div><div><div style=3D"font-size:small">It looks like=
 I was being fed a cached repository=C2=A0from a mirror. When I switched co=
nfigurations (I switched builders), I can see it now.</div><div style=3D"fo=
nt-size:small"><br></div><div style=3D"font-size:small">Although, I have no=
 idea why my manual clones were working, since they don&#39;t use that infr=
astructure. I&#39;m going to debug that a bit more.</div><div style=3D"font=
-size:small"><br></div><div style=3D"font-size:small">I&#39;ll get this fix=
ed on Friday (assuming I satisfy my manual clone curiosity).</div></div></d=
iv></div></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I went a different way with this. I&#39;ve had &quot;=
issues&quot; with this git repository in the past (failing fetcher tests, e=
tc)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve already done=
 one switch from gitsm to individual git fetches and then back to gitsm.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I&#39;ve gone back to indiv=
idual fetches, since I tested the tip of the tree and it is still broken wi=
th gitsm fetching.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">This w=
orked on all my builders, let me know if you still see issues.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div styl=
e=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
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
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8949): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8949" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8949</a><br>
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

--0000000000005cd42d0625e64609--

