Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89884E95A89
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:34:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63266.1767098044892149650
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 04:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SB2fj7a6;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso8533603a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Dec 2025 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767098044; x=1767702844; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XEoTq2gncdlI4bIou+GI+cY+2t5JUKT8uqKkjMREjkg=;
        b=SB2fj7a6mmqjNIllNiPnrsz+Y96rWTS7spKDpv6uuJAL6ryWkrlhpdFrqM3Lq602Da
         JAf+vsf+/HYfitTMKWlf+lxQFGQxqqvMxRG36dY+xU7tLhRFnT9FVc/Sd/XET02QKo3F
         4yWpVjiNCODmHC8mOVbxr7wrpqxrpRs3kmgRPsURRw0GlcCoeBUBtoZtz8ybYu6SvsdM
         muWxuTgQW7pfyz/r80gus+qm5AWETsYPeqZf+Tk8Tx6bktu0BwihjGxkWNHFawixpZ7L
         iPEpc45Kzji9yw7+xZInWdrPpux5hbPQcGwlUPKKUn6E6PvwgObPpdEDzIPUXSQJJWg6
         pcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098044; x=1767702844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEoTq2gncdlI4bIou+GI+cY+2t5JUKT8uqKkjMREjkg=;
        b=NzGvW+wQGgpc8BRRRq0sCfwPn8+LxLT+O1dIGPTSYEZmLBTVCHhBHeGfa/yLK+n2uE
         TEoQz1j2vRt9JlgauBkMDW8sGLFh5T7BdFXZJtylspcZCjCJGSVOxeoEYMWTCPMx4OnZ
         FWCknIHIt8Ch+ZxE37hYAuTeSavcFj9xKzyQ1Y93dMyfiagOE4c8HvT/B01MF1uRVzVr
         umH57SrHDHtwu83o7C/Q/nCrrlsdeYgbhM5PwLtXwVoRdRAqXQVDR6CPZjfDMPwUBgEN
         N0kNyFb56SCL6+kLGuyIQlnegm3i2V4yGeBUQ7FmvF/DNhSIwqYIbVhgsQ16ZU3/rk1x
         +Pwg==
X-Forwarded-Encrypted: i=1; AJvYcCXZYGjh1iEUcn3Aqj3aTohu5LNOm1jf1l7kBjiiI2tvwJ/LctAINRWXcMnBaZjc3ldWDfnzl/8Ed+bUzYEgOy82UJ8v@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzKvUkuMQk6odGqxTPfMOnYMaIRZtKcZCQmF/ZdFfUt247xCqsD
	PvBNAgGKy79I3qPx+fjDnjn1NiOWW+bHJjbGNMFB6UIEwRVDEKzAc8ijDLbzy39t4abY9tBIoD6
	nNmcbE626dNb6z2fMOvF2mAYEoVNFsI0=
X-Gm-Gg: AY/fxX49IS32TOgwqRoSDPfk39dArupURr57rE3SUO4QKB4dvV47UdHNkNruBbiJ6ZV
	+ATmKt5MCBML4DxXwL+Y5HGHP5J1zxHq/lWSrnJ/c3gVERkYoaWKf3l4CvWiw5iYTDQk6nbZun8
	7OKh1q+tlq3NWYmW43DwrKSsFl2BEHu43972GHKFVP0nRg6zcBeeW/60oDzn6kArUiuK9JYPNvQ
	xVmKmzG3/HOIDf1fr1fUg5zUhuaD072i2N8nGqVdilFNwOIqFJUQihYuvrCexJBRf5TFw==
X-Google-Smtp-Source: AGHT+IHuONUqzxyIFkgcEyK+bywH48jigFROHS1U6MQtu36+Ph0/vKnPETLuyyvlnN0AOyiXyfXa1SCWsdmYL40FoFQ=
X-Received: by 2002:a17:90b:582c:b0:340:5c27:a096 with SMTP id
 98e67ed59e1d1-34e92113697mr29317998a91.6.1767098043338; Tue, 30 Dec 2025
 04:34:03 -0800 (PST)
MIME-Version: 1.0
References: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <1885E2DCAB6244C8.1706869@lists.yoctoproject.org>
In-Reply-To: <1885E2DCAB6244C8.1706869@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Dec 2025 08:33:51 -0400
X-Gm-Features: AQt7F2p2SXJ6R4cHpYqSbRNDFEDBPzdh-hGPEefugVZ2hJsrXpLNGuZ0mYNsvTk
Message-ID: <CADkTA4OS8wGT5VG=uBpybZamkSWk4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with the new go-mod-vcs
To: bruce.ashfield@gmail.com
Cc: "Chen, Qi" <Qi.Chen@windriver.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000028137b06472a930d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Dec 2025 12:34:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9512

--00000000000028137b06472a930d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 12:11=E2=80=AFAM Bruce Ashfield via lists.yoctoproj=
ect.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Mon, Dec 29, 2025 at 11:23=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com>=
 wrote:
>
>> Hi Bruce,
>>
>>
>>
>> The new go-mod-vcs recently introduced in meta-virt  has some some
>> problems.
>>
>>
>>
>> The first and most significant one is the misuse of
>> BB_GIT_SHALLOW_EXTRA_REFS. It causes fetching failure when shallow tarba=
ll
>> generation is enabled.
>>
>
> I wouldn't call it a misuse, it is actually required to make the support
> work
> and attempt to save some download space. There are thousands of
> dependencies
> for some of the recipes and MANY of them have tags that aren't on
> branches, or
> aren't at the tip of branches, so those refs are there to force a deep
> enough fetch
> or to ensure that bitbake does the same "deshallowing"  as was done durin=
g
> generation.
>
> I could probably switch it out for tag=3D in the different entries. I've
> made that
> tweak and will run some tests.
>
>
>
>> Use the following steps to reproduce the error:
>>
>>    1. Add in local.conf:
>>
>> BB_GENERATE_SHALLOW_TARBALLS =3D "1"
>>
>> BB_GIT_SHALLOW =3D "1"
>>
>>    2. bitbake cni -c fetch
>>
>>
>>
>> Error message: fatal: couldn't find remote ref v0.0.4
>>
>> Root cause: the repos specified in SRC_URI does not contain the required
>> extra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.
>>
> I run with that all the time, I've never seen it, those BB_GIT_SHALLOW_EX=
TRA_REFS
> are
> not magic, they come directly from the repositories during discovery and
> are required to deshallow
> a repository.
>
> My tests with the tag parameter may solve the issue. So stay tuned, I hav=
e
> that and several other
> changes pending. But none of them will be until the end of next week once
> I am back in the office.
>
>
>>
>>
>> The second one is the duplicate entries in SRC_URI. Example: errdefs in
>> docker-compose.
>>
>>
>>
>
> It builds fine here, what issues are you seeing with it ? Are you using V=
CS
> mode ? or hybrid ?
>

There are multiple places that the vcs generator looks for (and removes
duplicates).
I added another and am testing it. So once I fix the shallow clone logic, I
can push
this as well.

I was able to build both modes locally, so it is a cosmetic fix, but
worth doing.

Cheers,

Bruce



>
> You can be assured that anything I pushed has been built many times, and
> has
> been runtime tested. So the first information you need to provide is more
> details
> about what you are building, so I can track down the differences.
>
>
>> The third one is the =E2=80=98shallow=3D1=E2=80=99 parameter in SRC_URI.=
 The problem is
>> that git fetcher does not support such parameter.
>>
>> In fetch2/git.py: ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1"
>>
>> So I guess these could be removed? And switching to use
>> BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=80=9D?
>>
>
> No. I plan to add more support for that later, it just isn't ready yet.
> They will stay.
>
>
>>
>> P.S.
>>
>> I sent a related patch to bitbake:
>> https://lists.openembedded.org/g/bitbake-devel/message/18656
>>
>> The problem in bitbake is revealed by the current SRC_URI settings in
>> meta-virt.
>>
>> If you get similar error, you can apply the above patch.
>>
>
> If I was going to see that error, I would have already ...
>
> Bruce
>
>
>
>>
>>
>> Regards,
>>
>> Qi
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
> View/Reply Online (#9511):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9511
> Mute This Topic: https://lists.yoctoproject.org/mt/116993898/1050810
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

--00000000000028137b06472a930d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 30, 2025 at 12:11=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29, 2025=
 at 11:23=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div>





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Bruce,<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The new go-mod-vcs re=
cently introduced in meta-virt =C2=A0has some some problems.<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The first and most si=
gnificant one is the misuse of BB_GIT_SHALLOW_EXTRA_REFS. It causes fetchin=
g failure when shallow tarball generation is enabled.</span></p></div></div=
></div></blockquote><div><br></div><div><div style=3D"font-size:small">I wo=
uldn&#39;t call it a misuse, it is actually=C2=A0required=C2=A0to make the =
support work</div><div style=3D"font-size:small">and attempt to save some d=
ownload space. There are thousands of dependencies</div><div style=3D"font-=
size:small">for some of the recipes and MANY of them have tags that aren&#3=
9;t on branches, or</div><div style=3D"font-size:small">aren&#39;t at the t=
ip of branches, so those refs are there to force a deep enough fetch</div><=
div style=3D"font-size:small">or to ensure that bitbake does the same &quot=
;deshallowing&quot;=C2=A0 as was done during</div><div style=3D"font-size:s=
mall">generation.</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">I could probably switch it out for tag=3D in the diffe=
rent entries. I&#39;ve made that</div><div style=3D"font-size:small">tweak =
and will run some tests.</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div lang=3D"EN-US"><div><p class=3D"=
MsoNormal"><span style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Use the following ste=
ps to reproduce the error:<u></u><u></u></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li style=3D"margin-left:0in"><span style=3D"font-size:11pt">Add in local.c=
onf:<u></u><u></u></span></li></ol>
<p><span style=3D"font-size:11pt">BB_GENERATE_SHALLOW_TARBALLS =3D &quot;1&=
quot;<u></u><u></u></span></p>
<p><span style=3D"font-size:11pt">BB_GIT_SHALLOW =3D &quot;1&quot;<u></u><u=
></u></span></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li style=3D"margin-left:0in"><span style=3D"font-size:11pt">bitbake cni -c=
 fetch<u></u><u></u></span></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Error message: fatal:=
 couldn&#39;t find remote ref v0.0.4<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Root cause: the repos=
 specified in SRC_URI does not contain the required extra refs specified by=
=C2=A0</span><span style=3D"font-size:14.6667px">BB_GIT_SHALLOW_EXTRA_REFS<=
/span><span style=3D"font-size:11pt">.</span></p></div></div></div></blockq=
uote><div><div style=3D"font-size:small"></div><div style=3D"font-size:smal=
l">I run with that all the time, I&#39;ve never seen it, those=C2=A0<span s=
tyle=3D"font-size:14.6667px">BB_GIT_SHALLOW_EXTRA_REFS are</span></div><div=
 style=3D"font-size:small">not magic, they come directly from the repositor=
ies during discovery and are required to deshallow</div><div style=3D"font-=
size:small">a repository.</div></div><div style=3D"font-size:small"><br></d=
iv><div style=3D"font-size:small">My tests with the tag parameter may solve=
 the issue. So stay tuned, I have that and several other</div><div style=3D=
"font-size:small">changes pending. But none of them will be until the end o=
f next week once I am back in the office.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div><div lang=3D"EN-US"><div><p cla=
ss=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The second one is the=
 duplicate entries in SRC_URI. Example: errdefs in docker-compose.<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0</span><=
/p></div></div></div></blockquote><div><br></div><div><div style=3D"font-si=
ze:small">It builds fine here, what issues are you seeing with it ? Are you=
 using VCS</div></div><div style=3D"font-size:small">mode ? or hybrid ?</di=
v></div></div></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">There are multiple places that the vcs generator=
 looks for (and removes duplicates).</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I added another and am testing it. So once I fix the =
shallow clone logic, I can push</div><div class=3D"gmail_default" style=3D"=
font-size:small">this as well.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I was able to build both modes locally, so it is a cosmetic fix, but =
worth=C2=A0doing.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div style=3D"font-size:small"><br></div><=
div style=3D"font-size:small">You can be assured that anything I pushed has=
 been built many times, and has</div><div style=3D"font-size:small">been ru=
ntime tested. So the first information you need to provide is more details<=
/div><div style=3D"font-size:small">about what you are building, so I can t=
rack down the differences.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div lang=3D"EN-US"><div><p class=3D"MsoNormal=
"><span style=3D"font-size:11pt"><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The third one is the =
=E2=80=98shallow=3D1=E2=80=99 parameter in SRC_URI. The problem is that git=
 fetcher does not support such parameter.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In fetch2/git.py: ud.=
shallow =3D d.getVar(&quot;BB_GIT_SHALLOW&quot;) =3D=3D &quot;1&quot;<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">So I guess these coul=
d be removed? And switching to use BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=
=80=9D?</span></p></div></div></div></blockquote><div><br></div><div><div s=
tyle=3D"font-size:small">No. I plan to add more support for that later, it =
just isn&#39;t ready yet. They will stay.<br><br></div></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div><div lang=3D"EN-US"><div><p class=
=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">P.S.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I sent a related patc=
h to bitbake:
<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/18656" ta=
rget=3D"_blank">https://lists.openembedded.org/g/bitbake-devel/message/1865=
6</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The problem in bitbak=
e is revealed by the current SRC_URI settings in meta-virt.<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">If you get similar er=
ror, you can apply the above patch.</span></p></div></div></div></blockquot=
e><div><br></div><div><div style=3D"font-size:small">If I was going to see =
that error, I would have already ...</div><div style=3D"font-size:small"><b=
r></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div lang=3D"EN-US=
"><div><p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards,<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Qi<u></u><u></u></spa=
n></p>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9511): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9511" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9511</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116993898/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/116993898/1050810</a><br>
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

--00000000000028137b06472a930d--

