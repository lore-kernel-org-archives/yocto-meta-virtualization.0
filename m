Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43426C74A5B
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 03:16:09 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.16799.1680146163466237919
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 20:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Htisyx4M;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id j6so9165811ilr.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 20:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680146162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gyW/oVG5ZRty/9lc32SiUTLjRyD/qxU0i6DkHWiEXkM=;
        b=Htisyx4MS+ZH8DIJcPJve6KiJ4XnHhT1jYWd5I82/ZisA96JRzYwQVeyPWc+qTMo5l
         vB5RnPzLINJthc5/eDQQbqLC+RKEUFqF2NYtZ7db/7P14bP7LfFytsHoMaiCLO3Pp96D
         1SDL0NPsc9nmVRrxMXCY+YBpllYUbE0kdyO8+s8PgzFWoKL1DiIihZL2CO3GaOHs/3kp
         inGXsi0Y+IG0CZntRpKgmC0BShoK6uX4/9Tuq8rILd6KbMz0Z+kzwcA8Omu9TH+zbxGC
         NCzO8vymBNhEZ1T1ipvYdtV9ihOsUvVFQMLlanJk4Wa+WUIHr8xlYqflS8CHsMF+ugir
         NaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680146162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyW/oVG5ZRty/9lc32SiUTLjRyD/qxU0i6DkHWiEXkM=;
        b=fBtW191wohrcJzSv5zxacz2mM+KoSJ6Za0d6Vtf9kmTQeYm10G5A92JBwX4ktZ/r2w
         QYSnWpVp5LLjOhVw/fY5cevklwJcdX8WXwAkMTJDsQFa1qYDpZf8kFdFSVH4J7q5Sy8m
         0wPx+yPggOYihtcrpVgms/3iAbNM97r5o0FqzVTy1g8CCwvRVrOkxVzweKWYiYdzpmBl
         wN3oBYby06dKkekui6CPDPpIs3NXcQiqxlE2fjT3Y08t56bLh5DWef8OtLxoAUYvjNbx
         ByzTrE1xlkqDzXdwsIhWuKM3GU9AW+uks0O3Nc6IaNYuhYlJW6Nhve1Yin/1M3hBJ0ZN
         I7MA==
X-Gm-Message-State: AAQBX9ckPJbUgTaBVZ4XpW7uyCx6C3fJNl8aNi7cpy2J0JJqnZzqbPBB
	L5KXMmhnbZU7awpPy/0vfh3fojcN2e44S270W3M=
X-Google-Smtp-Source: AKy350aXpIu8IfN/Xfiwe4y/Ls+8xvOmAgZjcZv7APowGDhhZMP1WwrDwsnnA5gn4PqUES/Kn/P/dkTO9USV24W1qmc=
X-Received: by 2002:a05:6e02:1d9d:b0:315:8de2:2163 with SMTP id
 h29-20020a056e021d9d00b003158de22163mr11157273ila.5.1680146162307; Wed, 29
 Mar 2023 20:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230330024910.40124-1-Qi.Chen@windriver.com>
In-Reply-To: <20230330024910.40124-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Mar 2023 23:15:49 -0400
Message-ID: <CADkTA4PUBBv2di8aX4pfuY0cVFza=29UxaqybosLM+HG6p2aEQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] runc: upgrade to 1.1.5
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002cd5bd05f815832a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 03:16:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7969

--0000000000002cd5bd05f815832a
Content-Type: text/plain; charset="UTF-8"

I already have pending updates to the stacks that are in test now, they'll
be in place in the next week or so.

Bruce

On Wed, Mar 29, 2023, 10:49 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> This upgrade fixes a few CVEs:
> - CVE-2023-27561
> - CVE-2023-25809
> - CVE-2023-28642
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb         | 4 ++--
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index 7288ef0..9bed441 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all
> components
>  #       have been updated to match.
> -SRCREV_runc-docker = "c6781d100a73d2dcef84e9376d85fff02235a2ed"
> +SRCREV_runc-docker = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
>  SRC_URI = "git://
> github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https
> \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>
> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
> -RUNC_VERSION = "1.1.4"
> +RUNC_VERSION = "1.1.5"
>
>  CVE_PRODUCT = "runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> index 8d56ffc..235a01b 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,10 +1,10 @@
>  include runc.inc
>
> -SRCREV = "c6781d100a73d2dcef84e9376d85fff02235a2ed"
> +SRCREV = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
>  SRC_URI = " \
>      git://
> github.com/opencontainers/runc;branch=release-1.1;protocol=https \
>
>  file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>      "
> -RUNC_VERSION = "1.1.4"
> +RUNC_VERSION = "1.1.5"
>
>  CVE_PRODUCT = "runc"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7967):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7967
> Mute This Topic: https://lists.yoctoproject.org/mt/97943449/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002cd5bd05f815832a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I already have pending updates to the stacks that ar=
e in test now, they&#39;ll be in place in the next week or so.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Bruce=C2=A0<br><br><div class=3D"gma=
il_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29=
, 2023, 10:49 PM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Ch=
en@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thi=
s upgrade fixes a few CVEs:<br>
- CVE-2023-27561<br>
- CVE-2023-25809<br>
- CVE-2023-28642<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">runc-opencontainers_git.bb=
</a> | 4 ++--<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/re=
cipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
index 7288ef0..9bed441 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
@@ -2,13 +2,13 @@ include runc.inc<br>
<br>
=C2=A0# Note: this rev is before the required protocol field, update when a=
ll components<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0have been updated to match.<br>
-SRCREV_runc-docker =3D &quot;c6781d100a73d2dcef84e9376d85fff02235a2ed&quot=
;<br>
+SRCREV_runc-docker =3D &quot;f19387a6bec4944c770f7668ab51c4348d9c2f38&quot=
;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc;branch=3Drelease-1.1;name=3Drunc-docker;protocol=3Dhttps" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">github.com/opencontainers/runc;branch=3D=
release-1.1;name=3Drunc-docker;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-sock=
et-dev-null.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-respect-GOBU=
ILDFLAGS-for-runc-and-remove-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-docker-SIGUSR1-d=
aemonize.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-RUNC_VERSION =3D &quot;1.1.4&quot;<br>
+RUNC_VERSION =3D &quot;1.1.5&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_=
git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">runc-opencontainers=
_git.bb</a> b/recipes-containers/runc/<a href=3D"http://runc-opencontainers=
_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">runc-opencontainer=
s_git.bb</a><br>
index 8d56ffc..235a01b 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">runc-opencontainers_git.bb=
</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">runc-opencontainers_git.bb=
</a><br>
@@ -1,10 +1,10 @@<br>
=C2=A0include runc.inc<br>
<br>
-SRCREV =3D &quot;c6781d100a73d2dcef84e9376d85fff02235a2ed&quot;<br>
+SRCREV =3D &quot;f19387a6bec4944c770f7668ab51c4348d9c2f38&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/opencontainers/runc;=
branch=3Drelease-1.1;protocol=3Dhttps" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=3D=
https</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-=
remove-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-RUNC_VERSION =3D &quot;1.1.4&quot;<br>
+RUNC_VERSION =3D &quot;1.1.5&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
-- <br>
2.37.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7967): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7967" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/7967</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97943449/1050=
810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/97943449/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000002cd5bd05f815832a--

