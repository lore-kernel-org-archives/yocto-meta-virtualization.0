Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61451C43219
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5348.1649422392019952922
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 05:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5eaSGk3;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id r13so17176599ejd.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 05:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZdAJ24mv2o2Ko66Cj+VdGQ8x5Xf6Rhc66k20G5F56bg=;
        b=X5eaSGk3cvLHDFuEE54lINt+i6206t02I6pLiqfOEDOPGr2hdH/DNTuyjR5AGZkx/Y
         AMXu9Beu8tAsIWkp/kii4/xUAbZGni6AvlAJkZw+rzEkSnJLgnfCHDBd0tuXAVjX91p0
         NJqKTk0U7VBdqorid1FYYIBxXEC5l+WTAwifTtYq4fQ2bbe9BHutu+h5w+CjVIk1u2SA
         tf7Ok3Pwk9YsJAhjjuhfvTVTT430bQSc0HvhhMFTCSXZBhnUwq25jH6C9pJc0RS4F9Ao
         LxjMoRxKvtGYKxfpNRfex9RJv5X0mq6RMj3vOcPhDMdqbDD0WpduljZVzCuvJ0ir0Jo+
         aNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZdAJ24mv2o2Ko66Cj+VdGQ8x5Xf6Rhc66k20G5F56bg=;
        b=QLFq05Z072f5U4/DTTU7UvKVHoAj2c7htF7nGsPu9/8nbWYLSlMt+OPuT/c4TDz1Ud
         tfX16LRQ0ryHZT5u6Vm7BzXeY+oKKEYn3TZq/1zSlmkavE8uzS/wNbU6zhyA7XXOwZVU
         kH7S8ri6t3mZlCom+TfjjW8q0Jo7yQYtb5VpAAJY8I2ph1ssHAOESh33PzieDKY+9pVy
         obgAPYMcJMGDa3+nUap3hlP5iB5UPJsAdsTa5m041DmKriWTeEvqAP/B0vML20VVTAvx
         2pqwxePeYu2a7h7kZ7N4EJGAfqyVibLXPhwOxtZvBjXp0Ka/CMRoVfWq5+ke+vcBss8C
         LCvA==
X-Gm-Message-State: AOAM5336Xh41EdvExgg2y0SFSdKHiSql+HxnNBtoyFHuv70hAGiX4V1z
	jnLnhY+te/NOvmzPI0Y0kxNR++JGiiJwGiqGa5Q=
X-Google-Smtp-Source: 
 ABdhPJw5E/lYz5L6oeyMjXmL2qaZq7IdHJfbV1YNCUGneNe1dgdy3o8BuQLsQJpHwt9umqUcvsxgu2WYkHVoZeW4MsI=
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr18628801ejc.711.1649422390293; Fri, 08
 Apr 2022 05:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
In-Reply-To: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 08:52:59 -0400
Message-ID: 
 <CADkTA4NbbSRkDHTGAUXY79EseLiWnvKWy+hCa3hoUxFdRTFtyw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: do not use a go file as patch
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000a87a7c05dc241359"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7135

--000000000000a87a7c05dc241359
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> Compiling k3s failed with:
> do_patch: Importing patch 'github.com.andreyvit.diff' with striplevel '1'
>
> The problem is that github.com/andreyvit/diff ends up as
> github.com.andreyvit.diff
> in the download folder which than matches the test in patch.py.
>
>
I've built this K3S hundreds of times, and have never seen this, so I won't
apply this until I figure out what is the difference between your
environment and mine.

Can you share more details about your build environment, etc.



> Not sure how you create this huge SRC_URI list. Probably it would be the
> best to add the apply=no to all urls.
>
>
Eh, no. I'm not going to append that to all the URIs just because of one
outlier that matched.

Bruce



> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
> k3s_git.bb
> index e2a3ffc..53a8677 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -219,7 +219,7 @@ SRC_URI += "git://
> github.com/alexflint/go-filemutex;name=go-filemutex;protocol=h
>  # github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883
>  # [1] git ls-remote https://github.com/andreyvit/diff
> c7f18ee00883bfd3b00e0a2bf7607827e0148ad4
>  SRCREV_diff="c7f18ee00883bfd3b00e0a2bf7607827e0148ad4"
> -SRC_URI += "git://
> github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff
> <http://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/andreyvit/diff>
> "
> +SRC_URI += "git://
> github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff;apply=no
> <http://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/andreyvit/diff;apply=no>
> "
>
>  # github.com/andybalholm/cascadia v1.0.0
>  # [1] git ls-remote https://github.com/andybalholm/cascadia
> 901648c87902174f774fac311d7f176f8647bdaa
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7134):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7134
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

--000000000000a87a7c05dc241359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer &lt=
;<a href=3D"mailto:adrian.freihofer@gmail.com">adrian.freihofer@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Co=
mpiling k3s failed with:<br>
do_patch: Importing patch &#39;github.com.andreyvit.diff&#39; with striplev=
el &#39;1&#39;<br>
<br>
The problem is that <a href=3D"http://github.com/andreyvit/diff" rel=3D"nor=
eferrer" target=3D"_blank">github.com/andreyvit/diff</a> ends up as github.=
com.andreyvit.diff<br>
in the download folder which than matches the test in patch.py.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;ve built this K3S hundreds of times, and have never =
seen this, so I won&#39;t apply this until I figure out what is the differe=
nce between your environment and mine.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Can you share more details=C2=A0about your build environment,=
 etc.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Not sure how you create this huge SRC_URI list. Probably it would be the<br=
>
best to add the apply=3Dno to all urls.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Eh, no. I&#39;m not going to append that to all the URIs j=
ust because of one outlier that matched.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7134): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7134" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7134</a><br>
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
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000a87a7c05dc241359--

