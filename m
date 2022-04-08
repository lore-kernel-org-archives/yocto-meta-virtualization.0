Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3261C4707E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.6713.1649428180747127390
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 07:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E9U02Ply;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id b15so10297557edn.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JW5bIIRLxuA1cVvkVOIF1TPMBUApaD0jn25ozCy04E=;
        b=E9U02PlykZ7CzMFdrtExFhq/DOIJa5ieZqKbtcewxtl8/9W3hCzPM+Wck/2r7B2iC4
         Ha+lK26T/XDCUT4KnXOMoxHaf55i5/d6doAIp0kcWSAqdVf9hmQR9i6yO16T6f7JEzTC
         kQ4GDbyNXYekIiJmo+Xtieim/FxekAe7j6In9RnhoHFKlFBNyIR7+/iDawi6zej4LuiJ
         P1DQuX6DK6tIn0YgLkXHfACm2rYSS6f/2WHPoImPD5azsilI6ztkHZpHc3b4wiGSmaPe
         +W8kVriI1B0an9qXyFzEqliiG0o9srYbtNfymVVeB2chtOhuuhX2ZJiYxegxdV6swz2w
         +hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JW5bIIRLxuA1cVvkVOIF1TPMBUApaD0jn25ozCy04E=;
        b=A2VLRrDxj8VSEYFXsDcQf7sVh0MjHZznLmVc1NWSZ3w0jRMqBZcZobFfUGdaeRRiLP
         izQYl1sRNJaEDV64KFR2cjoB8b2cKgibw9T6sejuqbXfb8U2taT0TTBP1O/G2nfYRUNZ
         RWJpbh8uYLt2aRUpc+ooaMDiUwDnoqgDEgMR1FzFhHhkh33kNCMbgAAB0GuN2amrAEzX
         ryjT+YwD21gb7FOWzxVdDiGBqm8p7JkJ751ui6217DDX30PDOmIc2akhavgbEQUjPvCh
         PTgcNitQEh1dfYLNVllbK6tQBiygw9VI2Fj9qMLi63bvJ3UnlxCcx3jyHZPsLSgwNcTr
         593Q==
X-Gm-Message-State: AOAM5306DEwa4hWNpHtRJKdOjXpLG+xm4ByZUWsH7mY2dojQfvTlO800
	BGs36tUcCc1AHcXWQQD68GBoO9qIwx+YdOt0at8=
X-Google-Smtp-Source: 
 ABdhPJyjrQs8MGsH62jy5hOYWVAcCEi84ULeG5R7UuZTwul22ZigO3/PSchKjI8yViDlR4y0K1dEIrk0XUD0pCzCK3M=
X-Received: by 2002:aa7:c40a:0:b0:41d:c4f:ceeb with SMTP id
 j10-20020aa7c40a000000b0041d0c4fceebmr7494933edq.185.1649428179208; Fri, 08
 Apr 2022 07:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
 <16E3ECED528B7F3F.29738@lists.yoctoproject.org>
In-Reply-To: <16E3ECED528B7F3F.29738@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 10:29:28 -0400
Message-ID: 
 <CADkTA4Nt6_gN3cVY5r5SMJ2ZtfDLO3_N6zQ9+N2Ht0e5p-vD=g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: do not use a go file as patch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
 meta-virtualization@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000b44d4405dc256c6e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7136

--000000000000b44d4405dc256c6e
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 8:53 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
>
>> Compiling k3s failed with:
>> do_patch: Importing patch 'github.com.andreyvit.diff' with striplevel '1'
>>
>> The problem is that github.com/andreyvit/diff ends up as
>> github.com.andreyvit.diff
>> in the download folder which than matches the test in patch.py.
>>
>>
> I've built this K3S hundreds of times, and have never seen this, so I
> won't apply this until I figure out what is the difference between your
> environment and mine.
>
> Can you share more details about your build environment, etc.
>

I am seeing a different fetch issue on a new/fresh machine I brought up
this morning, using the -tip of master for all layers. My cached downloads
were keeping it working on my other machines.

I'll get past that issue and see if I get the patch issue.

Cheers,

Bruce




>
>
>
>> Not sure how you create this huge SRC_URI list. Probably it would be the
>> best to add the apply=no to all urls.
>>
>>
> Eh, no. I'm not going to append that to all the URIs just because of one
> outlier that matched.
>
> Bruce
>
>
>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  recipes-containers/k3s/k3s_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
>> k3s_git.bb
>> index e2a3ffc..53a8677 100644
>> --- a/recipes-containers/k3s/k3s_git.bb
>> +++ b/recipes-containers/k3s/k3s_git.bb
>> @@ -219,7 +219,7 @@ SRC_URI += "git://
>> github.com/alexflint/go-filemutex;name=go-filemutex;protocol=h
>>  # github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883
>>  # [1] git ls-remote https://github.com/andreyvit/diff
>> c7f18ee00883bfd3b00e0a2bf7607827e0148ad4
>>  SRCREV_diff="c7f18ee00883bfd3b00e0a2bf7607827e0148ad4"
>> -SRC_URI += "git://
>> github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff
>> <http://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/andreyvit/diff>
>> "
>> +SRC_URI += "git://
>> github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff;apply=no
>> <http://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/andreyvit/diff;apply=no>
>> "
>>
>>  # github.com/andybalholm/cascadia v1.0.0
>>  # [1] git ls-remote https://github.com/andybalholm/cascadia
>> 901648c87902174f774fac311d7f176f8647bdaa
>> --
>> 2.35.1
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7135):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7135
> Mute This Topic: https://lists.yoctoproject.org/mt/90334188/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b44d4405dc256c6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 8:53 AM Bruce Ashfield via <=
a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproje=
ct.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproj=
ect.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 8, 2=
022 at 8:34 AM Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmai=
l.com" target=3D"_blank">adrian.freihofer@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Compiling k3s failed wit=
h:<br>
do_patch: Importing patch &#39;github.com.andreyvit.diff&#39; with striplev=
el &#39;1&#39;<br>
<br>
The problem is that <a href=3D"http://github.com/andreyvit/diff" rel=3D"nor=
eferrer" target=3D"_blank">github.com/andreyvit/diff</a> ends up as github.=
com.andreyvit.diff<br>
in the download folder which than matches the test in patch.py.<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">I&#39;v=
e built this K3S hundreds of times, and have never seen this, so I won&#39;=
t apply this until I figure out what is the difference between your environ=
ment and mine.</div><div style=3D"font-size:small"><br></div><div style=3D"=
font-size:small">Can you share more details=C2=A0about your build environme=
nt, etc.</div></div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I am seeing a different fetch =
issue on a new/fresh machine I brought up this morning, using the -tip of m=
aster for all layers. My cached=C2=A0downloads were keeping it working on m=
y other machines.</div></div><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I&#39;ll get past that issue and see if I get =
the patch issue.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Not sure how you create this huge SRC_URI list. Probably it would be the<br=
>
best to add the apply=3Dno to all urls.<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">Eh, no.=
 I&#39;m not going to append that to all the URIs just because of one outli=
er that matched.</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"no=
referrer" target=3D"_blank">k3s_git.bb</a> b/recipes-containers/k3s/<a href=
=3D"http://k3s_git.bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a><=
br>
index e2a3ffc..53a8677 100644<br>
--- a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a><br>
+++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a><br>
@@ -219,7 +219,7 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/a=
lexflint/go-filemutex;name=3Dgo-filemutex;protocol=3Dh" rel=3D"noreferrer" =
target=3D"_blank">github.com/alexflint/go-filemutex;name=3Dgo-filemutex;pro=
tocol=3Dh</a><br>
=C2=A0# <a href=3D"http://github.com/andreyvit/diff" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/andreyvit/diff</a> v0.0.0-20170406064948-c7f18ee0=
0883<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/andreyvit/diff" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/andreyvit/diff</a> c7f=
18ee00883bfd3b00e0a2bf7607827e0148ad4 <br>
=C2=A0SRCREV_diff=3D&quot;c7f18ee00883bfd3b00e0a2bf7607827e0148ad4&quot;<br=
>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/andreyvit/diff;name=
=3Ddiff;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/andreyvit/diff" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/andreyvit/diff;name=3Ddiff;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/and=
reyvit/diff</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/andreyvit/diff;name=
=3Ddiff;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/andreyvit/diff;apply=3Dno" rel=3D"noref=
errer" target=3D"_blank">github.com/andreyvit/diff;name=3Ddiff;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/andreyvit/diff;apply=3Dno</a>&quot;<br>
<br>
=C2=A0# <a href=3D"http://github.com/andybalholm/cascadia" rel=3D"noreferre=
r" target=3D"_blank">github.com/andybalholm/cascadia</a> v1.0.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/andybalholm/cascadi=
a" rel=3D"noreferrer" target=3D"_blank">https://github.com/andybalholm/casc=
adia</a> 901648c87902174f774fac311d7f176f8647bdaa <br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7135): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7135" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7135</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90334188/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90334188/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>

--000000000000b44d4405dc256c6e--

