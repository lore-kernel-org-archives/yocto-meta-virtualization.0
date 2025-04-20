Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF47C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 21:11:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.3924.1745183453867280123
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 14:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdLmyukt;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b00e3c87713so2786151a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745183453; x=1745788253; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rB8KpBJoT4da0lC2JrQY/g2c317vEg47/uqR9TrI0Q=;
        b=MdLmyuktkkuu1JUyQFFJwP3ZjZPcwnvIVjvx8XGcLYEuljncBZcFLV+6nXk79yk/xj
         vqGy25SvGUSjWoxl1LDbmAn7uKiy0OVT0is/xGAM2hi5dpAp6IPXvJCuAFmuSldHsq69
         93N02rva9WZH1QdEwCJkvOQ43kNx63iHsYevozOkNiSfBJTd+LmkTOOGUIOSy8tZ35jG
         blpromDLCC5cRa7D/tDQwP6PmSWyWyiWjiffNBEuyu1H70cqJHqG7dIDKpQDg4OGu59Z
         jZPI5t+3PGNNotdhvcgo5dsg6rLNv4JKIH/0X/p/JrePG4zhltf7ZJn8msJy8WkF1gGb
         m+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745183453; x=1745788253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rB8KpBJoT4da0lC2JrQY/g2c317vEg47/uqR9TrI0Q=;
        b=cccfk34ArY8AsQoTvDToRSHa01i53QghgLfwDlQ/JrbTQJsEjpkkvzI7fiPrheuVwn
         wKr8mXW5nGk661CRIVmN9KXSEa4UVjsJoIo+7rlOYMblMsSRw1WdnzaHS8+83qy4u+On
         SZt9X/+IzvakKkBwiCQ3e+PV31f59soIALa+48dgxdqn/9oF93UoGBAAxlzWTeVpK+ob
         aHVskcwL7w+aFm/c1Mo4LDU9WVZjB8CLBgRr/wyGdajQ1os/dkOfID785vOf2lydtrAS
         /C/0QrPPJT77UtPkAjY2xbp0iADoppDhoKDNUvH++XZSsYmmvz7QwGKBjyf6rIjK95rR
         Msng==
X-Gm-Message-State: AOJu0YxMZrCNCfGtdDG1eg+2glDwH1ZeOfLHzlXKyJm4kNDuaXeMXyt8
	+zjtCtwzBvR4yzHBBuC4C3VEm3NP7iLbPZjLPG+mNPolwDVMNES4I2uibrCLRYVlk6dwqCoEYlX
	pQt1wo3Nfl0qbxaOFTSBvNqssGbk=
X-Gm-Gg: ASbGnctdOo9u3Rk4FH9rRQ8GBJmhr0L1Xs37qrqY+6gVxhahNJGxxHjaSHGf3ZwCZ9V
	1yGpgHrnH9BXJ4vpaq8FjRuWn84Lfb2Nd06wKvMuDoWhDp5IqsHgboc+xw7alLTt2VPgWiORAmp
	jqLTPrqTTV9uHwOA0TjaTdHw==
X-Google-Smtp-Source: AGHT+IFcLUofK0wFt8yadEUctQa/7K/LKqkHqnLicRFisdiw4HkA6LsuFFdiQjP3ohoQzL8vybBVk9NED+1AuK003hM=
X-Received: by 2002:a17:90b:58ec:b0:2f4:432d:250d with SMTP id
 98e67ed59e1d1-3087bb6986bmr13748966a91.21.1745183452957; Sun, 20 Apr 2025
 14:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250420124619.3820627-1-pkj@axis.com>
In-Reply-To: <20250420124619.3820627-1-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Apr 2025 17:10:42 -0400
X-Gm-Features: ATxdqUFus3OUp7hTCAhMjBDTq0ZwAs99LmjXhbFt2v9oMLCqrl9N0LNg863Zl_U
Message-ID: <CADkTA4Pss=+gZNVF5D8v21=r227TvF3CQ=6C7rWySYOEz6KEEw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Correct the version (4.45.1+)
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c8160d06333c2f25"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 21:11:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9233

--000000000000c8160d06333c2f25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 8:46=E2=80=AFAM Peter Kjellerstedt via
lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.or=
g>
wrote:

> The current version of yq is actually based on 4.45.1.
>
> Also remove ${SRCREV_yq} from PV to allow `devtool modify yq` to work.
> And remove the do_compile:prepend(). It is not needed and removing it
> allows yq to be built after devtooling it.


I will fix the PV bump, but I don't need most of the other parts.

I'm not a fan of pedantic "just because" changes. If nothing is
Broken, I just leave things as they are.

The do_compile prepend still seems to be needed in on one
of my builders as well, I'll investigate that more later, and can
Drop it once I understand what is going on.


>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> In addition to the changes in this commit, I would also suggest setting
> SRCREV_FORMAT =3D "default" to only include the SHA-1 for yq in PV. I do
> not see the reason to include the SHA-1 for the color module when the
> SHA-1s for all the other modules are not included.


I'll also leave that as-is, I really should list them all, but chose it to
be
A better representative multi scm SRCREV.
I've never seen "default" documented anywhere. Do you have a link
to why I'd use / consider it ?



>
>
>  recipes-devtools/yq/yq_git.bb | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
>
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.b=
b
> index 0e9d36ca..f934e2b2 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "a lightweight and portable command-line YAML processor "
> +SUMMARY =3D "A lightweight and portable command-line YAML processor"
>  HOMEPAGE =3D "https://github.com/mikefarah/yq"
>
>  LICENSE =3D "MIT"
> @@ -81,32 +81,18 @@ SRC_URI +=3D "git://
> github.com/alecthomas/participle;name=3Dv2;protocol=3Dhttps;nobran
>  SRCREV_mousetrap =3D "4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
>  SRC_URI +=3D "git://
> github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor/github.com/inconshre=
veable/mousetrap
> <http://github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D/vendor/github.c=
om/inconshreveable/mousetrap>
> "
>
> -PV =3D "4.30.8+git${SRCREV_yq}"
> +PV =3D "4.45.1+git"
>
>  GO_IMPORT =3D "github.com/mikefarah/yq"
> +export GO111MODULE =3D "off"
>
>  inherit go ptest
>
> -do_compile:prepend() {
> -    # arrange for some of the golang built ins to be found
> -    (
> -       cd ${WORKDIR}/build/src/
> -       ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/
> golang.org .
> -
> -       cd ${WORKDIR}/build/
> -       ln -sf ${UNPACKDIR}/build/vendor .
> -    )
> -
> -    # arrange for the fetched dependencies to be found
> -    export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
> -    export GO111MODULE=3Doff
> -}
> -
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/scripts/*
> ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/*
> ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/examples
> ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_PATH}/tes=
ts
> +    cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests

I like that change as well.

I'll split up the commit here and see if I can get the bits I want.

Cheers,

Bruce


>  }
>
>  RDEPENDS:${PN}-ptest +=3D " \
> @@ -114,7 +100,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>  "
>
>  RDEPENDS:${PN}-dev +=3D " \
> -     bash \
> +    bash \
>  "
>
>  BBCLASSEXTEND =3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9232):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9232
> Mute This Topic: https://lists.yoctoproject.org/mt/112360308/1050810
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

--000000000000c8160d06333c2f25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 20, 2025 at 8:46=E2=80=
=AFAM Peter Kjellerstedt via <a href=3D"http://lists.yoctoproject.org" targ=
et=3D"_blank">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=
=3D"mailto:axis.com@lists.yoctoproject.org" target=3D"_blank">axis.com@list=
s.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The current version of yq is actually based on 4.45.1.<br=
>
<br>
Also remove ${SRCREV_yq} from PV to allow `devtool modify yq` to work.<br>
And remove the do_compile:prepend(). It is not needed and removing it<br>
allows yq to be built after devtooling it.<span class=3D"gmail_default" sty=
le=3D"font-size:small"></span></blockquote><div>=C2=A0</div><div><span clas=
s=3D"gmail_default" style=3D"font-size:small"></span></div><div class=3D"gm=
ail_default" style=3D"font-size:small">I will fix the PV bump, but I don&#3=
9;t need most of the other parts.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;m not a fan of pedantic &quot;just because&quot; changes. =
If nothing is</div><div class=3D"gmail_default" style=3D"font-size:small">B=
roken, I just leave things as they are.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">The do_compile prepend still seems to be needed in on one</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">of my builders as=
 well, I&#39;ll investigate that more later, and can</div><div class=3D"gma=
il_default" style=3D"font-size:small">Drop it once I understand what is goi=
ng on.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
In addition to the changes in this commit, I would also suggest setting<br>
SRCREV_FORMAT =3D &quot;default&quot; to only include the SHA-1 for yq in P=
V. I do<br>
not see the reason to include the SHA-1 for the color module when the<br>
SHA-1s for all the other modules are not included.<span class=3D"gmail_defa=
ult" style=3D"font-size:small"></span></blockquote><div><span class=3D"gmai=
l_default" style=3D"font-size:small"><br></span></div><div><span class=3D"g=
mail_default" style=3D"font-size:small">I&#39;ll also leave that as-is, I r=
eally should list them all, but chose it to be</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small">A better representative multi =
scm SRCREV</span>. <span class=3D"gmail_default" style=3D"font-size:small">=
</span></div><div><span class=3D"gmail_default" style=3D"font-size:small"><=
/span></div><div>I&#39;ve never seen &quot;default&quot; documented<span cl=
ass=3D"gmail_default" style=3D"font-size:small"> a</span>nywhere. Do you ha=
ve a link<span class=3D"gmail_default" style=3D"font-size:small"></span></d=
iv><div> to=C2=A0<span class=3D"gmail_default" style=3D"font-size:small">wh=
y I&#39;d use / consider it ?</span></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:sm=
all"></span></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
<br>
=C2=A0recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a> | 28 +++++++---------------------<br>
=C2=A01 file changed, 7 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">yq_git.bb</a> b/recipes-devtools/yq/<a href=3D"http=
://yq_git.bb" rel=3D"noreferrer" target=3D"_blank">yq_git.bb</a><br>
index 0e9d36ca..f934e2b2 100644<br>
--- a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a><br>
+++ b/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a><br>
@@ -1,4 +1,4 @@<br>
-SUMMARY =3D &quot;a lightweight and portable command-line YAML processor &=
quot;<br>
+SUMMARY =3D &quot;A lightweight and portable command-line YAML processor&q=
uot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/mikefarah/yq" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/mikefarah/yq</a>&quot;<br=
>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
@@ -81,32 +81,18 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/a=
lecthomas/participle;name=3Dv2;protocol=3Dhttps;nobran" rel=3D"noreferrer" =
target=3D"_blank">github.com/alecthomas/participle;name=3Dv2;protocol=3Dhtt=
ps;nobran</a><br>
=C2=A0SRCREV_mousetrap =3D &quot;4e8053ee7ef85a6bd26368364a6d27f1641c1d21&q=
uot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/inconshreveable=
/mousetrap;name=3Dmousetrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
GO_SRCURI_DESTSUFFIX%7D/vendor/github.com/inconshreveable/mousetrap" rel=3D=
"noreferrer" target=3D"_blank">github.com/inconshreveable/mousetrap;name=3D=
mousetrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX=
}/vendor/github.com/inconshreveable/mousetrap</a>&quot;<br>
<br>
-PV =3D &quot;4.30.8+git${SRCREV_yq}&quot;<br>
+PV =3D &quot;4.45.1+git&quot;<br>
<br>
=C2=A0GO_IMPORT =3D &quot;<a href=3D"http://github.com/mikefarah/yq" rel=3D=
"noreferrer" target=3D"_blank">github.com/mikefarah/yq</a>&quot;<br>
+export GO111MODULE =3D &quot;off&quot;<br>
<br>
=C2=A0inherit go ptest<br>
<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 # arrange for some of the golang built ins to be found<br>
-=C2=A0 =C2=A0 (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build/src/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/s=
rc/cmd/vendor/<a href=3D"http://golang.org" rel=3D"noreferrer" target=3D"_b=
lank">golang.org</a> .<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UNPACKDIR}/build/vendor .<br>
-=C2=A0 =C2=A0 )<br>
-<br>
-=C2=A0 =C2=A0 # arrange for the fetched dependencies to be found<br>
-=C2=A0 =C2=A0 export GOPATH=3D&quot;${GOPATH}:${WORKDIR}/build/vendor/&quo=
t;<br>
-=C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
-}<br>
-<br>
=C2=A0do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/scr=
ipts/*" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq/script=
s/*</a> ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/acc=
eptance_tests/*" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/=
yq/acceptance_tests/*</a> ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/exa=
mples" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq/example=
s</a> ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/test=
s<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_P=
ATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests=
<span class=3D"gmail_default" style=3D"font-size:small"></span></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small"></span></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I like that change a=
s well.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll split up=
 the commit here and see if I can get the bits I want.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
@@ -114,7 +100,7 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-dev +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0bash \<br>
+=C2=A0 =C2=A0 bash \<br>
=C2=A0&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9232): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9232" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9232</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112360308/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112360308/1050810</a><br>
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
</div>

--000000000000c8160d06333c2f25--

