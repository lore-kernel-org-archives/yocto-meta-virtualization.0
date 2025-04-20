Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A31AC369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 21:37:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4262.1745185021071336047
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 14:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPbrTibu;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30572effb26so3092917a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745185020; x=1745789820; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vL8mXuwg7tBZ4AhSr+cnxQGj0mdofLPAhGanrSC03As=;
        b=dPbrTibuEJG/Blv+BcYqiVNLv0UyXnUJfomG+lFvjPtpO8rBonKBXHH/ch+rp8J5Xu
         sonnCBGIySZcGt3zKj1llX6HznFASLuNg0j8pOPqMsQx0dOkXQZR7GQUOuAnGY4FLaia
         6Ma9OSnl0nyNVDauRwwNOkNt75fHmj/qrNV7o6UTtJBRdqbmT/nU2o4TwEMNL4CyGrC5
         WTjfZRtVxwGGx1c303QseSmV6fJcpMpxTnxmyQd4Oy/Fh8t4/ztqeFLCm5XSCV+4VAVp
         1WFPHBoO9pEWIQSlR3i3F8JA54/gNQ61YjhqJSgiAIdwX8TVsMxepd6hf8lmyHzC2lkR
         b9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745185020; x=1745789820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL8mXuwg7tBZ4AhSr+cnxQGj0mdofLPAhGanrSC03As=;
        b=JNYILYC9jlGyboCMbqQEg39Di9gzu47H+7y36myu81du+y9UxJJQvzdDMXoTrLIoQQ
         Nd/bJ+pqI+R6jxGs20f/lcO/dg+DPT06Q2qI5cw6lxtEQUm4ZRIX/l7P+OrYIoXZImJU
         WvpvURo1CUVm5mQy2pJ/LrKtIvcZhwilf7rzSGMikCCSkwUwwKavG1o34KWoF28tXFN8
         Al9NoNm6vYFlq/4i5hgyXVWfKMyqdkM/uoUwvNsxdp1OonKIARM4fWv56gd9X4o20eZB
         Q02TFYZ7raAWr+Hg99YNO4EwfLUT08XqUMjHAQNdfIq5Yf6LYNNSyAxMLQ9BeZe1ifgq
         gz8A==
X-Forwarded-Encrypted: i=1; AJvYcCWV4x0d5Y3J6C2c37X2E5moXojJk2I07N4Jc8cFV0ZDpQD6mqLdl6yU8SL4Hj+umAzVnFI1TSkKv/2LunL8Rfi6ggyz@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwF2/JfC2BKcoLOVZHgPGQKxAWGnrt8E5kqQRpu5wSZ01HNYxLl
	rTE64usDFHUakkqHQetBy0jVC3+pvhdiLoBcARog8N3pcevdvn+eg7S5Ff938zHb2w0fzNngsCT
	u3KxTOgNyS8BzxoFV7uJxKGXNoko=
X-Gm-Gg: ASbGnctmB53/8khADvaHIJhh5CSVLXtlPdYwXpIiVvSMCLewb+iJtdIEZxhO17DNoYB
	oal0PMEBoa11mPfsi8b+ohEUxqSZd6EZjt3vWRHUQ1kZNS+foJ8Gb0cAJY8BsrmgBC8T+WBuLZL
	Hz+YvrwH51+lVkwIUEqWUomw==
X-Google-Smtp-Source: AGHT+IELDCCoPc5lmLkibMCYSQsUdquaMzlZllTsJrmtTM4n/ihOHt0JC+/84gP9T3DNdYLaAUPCkWnrYLegqtyZujQ=
X-Received: by 2002:a17:90b:57e6:b0:2ff:58c7:a71f with SMTP id
 98e67ed59e1d1-3087bbbb887mr11734378a91.32.1745185020359; Sun, 20 Apr 2025
 14:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250420124619.3820627-1-pkj@axis.com> <1838231AE405029D.21966@lists.yoctoproject.org>
In-Reply-To: <1838231AE405029D.21966@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Apr 2025 17:36:49 -0400
X-Gm-Features: ATxdqUGZCdHq-L1Kn22sCUCO1COkd8CxtgQKkfwQafZ6Gs_NdBGAzBtKvKjigzk
Message-ID: <CADkTA4MUB+j5iht=X+B+kgxGdhBqRhG_DVHJpKZFHs4_VArGiQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Correct the version (4.45.1+)
To: bruce.ashfield@gmail.com
Cc: peter.kjellerstedt@axis.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000034bd0606333c8d06"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 21:37:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9234

--00000000000034bd0606333c8d06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 5:10=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Sun, Apr 20, 2025 at 8:46=E2=80=AFAM Peter Kjellerstedt via
> lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.=
org>
> wrote:
>
>> The current version of yq is actually based on 4.45.1.
>>
>> Also remove ${SRCREV_yq} from PV to allow `devtool modify yq` to work.
>> And remove the do_compile:prepend(). It is not needed and removing it
>> allows yq to be built after devtooling it.
>
>
> I will fix the PV bump, but I don't need most of the other parts.
>
> I'm not a fan of pedantic "just because" changes. If nothing is
> Broken, I just leave things as they are.
>
> The do_compile prepend still seems to be needed in on one
> of my builders as well, I'll investigate that more later, and can
> Drop it once I understand what is going on.
>
>
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>
>> In addition to the changes in this commit, I would also suggest setting
>> SRCREV_FORMAT =3D "default" to only include the SHA-1 for yq in PV. I do
>> not see the reason to include the SHA-1 for the color module when the
>> SHA-1s for all the other modules are not included.
>
>
> I'll also leave that as-is, I really should list them all, but chose it t=
o
> be
> A better representative multi scm SRCREV.
> I've never seen "default" documented anywhere. Do you have a link
> to why I'd use / consider it ?
>
>
>
>>
>>
>>  recipes-devtools/yq/yq_git.bb | 28 +++++++---------------------
>>  1 file changed, 7 insertions(+), 21 deletions(-)
>>
>> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/
>> yq_git.bb
>> index 0e9d36ca..f934e2b2 100644
>> --- a/recipes-devtools/yq/yq_git.bb
>> +++ b/recipes-devtools/yq/yq_git.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY =3D "a lightweight and portable command-line YAML processor "
>> +SUMMARY =3D "A lightweight and portable command-line YAML processor"
>>  HOMEPAGE =3D "https://github.com/mikefarah/yq"
>>
>>  LICENSE =3D "MIT"
>> @@ -81,32 +81,18 @@ SRC_URI +=3D "git://
>> github.com/alecthomas/participle;name=3Dv2;protocol=3Dhttps;nobran
>>  SRCREV_mousetrap =3D "4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
>>  SRC_URI +=3D "git://
>> github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor/github.com/inconshr=
eveable/mousetrap
>> <http://github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D/vendor/githu=
b.com/inconshreveable/mousetrap>
>> "
>>
>> -PV =3D "4.30.8+git${SRCREV_yq}"
>> +PV =3D "4.45.1+git"
>>
>>  GO_IMPORT =3D "github.com/mikefarah/yq"
>> +export GO111MODULE =3D "off"
>>
>>  inherit go ptest
>>
>> -do_compile:prepend() {
>> -    # arrange for some of the golang built ins to be found
>> -    (
>> -       cd ${WORKDIR}/build/src/
>> -       ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/
>> golang.org .
>> -
>> -       cd ${WORKDIR}/build/
>> -       ln -sf ${UNPACKDIR}/build/vendor .
>> -    )
>> -
>> -    # arrange for the fetched dependencies to be found
>> -    export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
>> -    export GO111MODULE=3Doff
>> -}
>> -
>>  do_install_ptest() {
>>      install -d ${D}${PTEST_PATH}/tests
>> -    cp -r ${S}/src/github.com/mikefarah/yq/scripts/*
>> ${D}${PTEST_PATH}/tests
>> -    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/*
>> ${D}${PTEST_PATH}/tests
>> -    cp -r ${S}/src/github.com/mikefarah/yq/examples
>> ${D}${PTEST_PATH}/tests
>> +    cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/tests
>> +    cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/*
>> ${D}${PTEST_PATH}/tests
>> +    cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests
>
> I like that change as well.
>
> I'll split up the commit here and see if I can get the bits I want.
>
I've chopped up the commit with git and grabbed the least footprint parts
of the change.

Once the dust settles on the release, I'll look at the do_compile:prepend()
to understand why one of my builds blew up (could be some mix of branches,
or something equally incorrect).

I'll stage that part of the commit on master-next so that I can't forget.

Bruce


> Cheers,
>
> Bruce
>
>
>>  }
>>
>>  RDEPENDS:${PN}-ptest +=3D " \
>> @@ -114,7 +100,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>>  "
>>
>>  RDEPENDS:${PN}-dev +=3D " \
>> -     bash \
>> +    bash \
>>  "
>>
>>  BBCLASSEXTEND =3D "native"
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
> View/Reply Online (#9233):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9233
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

--00000000000034bd0606333c8d06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 20, 2025 at 5:10=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sun, Apr 20, 2025 at 8:46=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http=
://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt=
;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.yoctoproject.org" ta=
rget=3D"_blank">axis.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">The current version of yq is=
 actually based on 4.45.1.<br>
<br>
Also remove ${SRCREV_yq} from PV to allow `devtool modify yq` to work.<br>
And remove the do_compile:prepend(). It is not needed and removing it<br>
allows yq to be built after devtooling it.<span class=3D"gmail_default" sty=
le=3D"font-size:small"></span></blockquote><div>=C2=A0</div><div><span clas=
s=3D"gmail_default" style=3D"font-size:small"></span></div><div style=3D"fo=
nt-size:small">I will fix the PV bump, but I don&#39;t need most of the oth=
er parts.</div><div style=3D"font-size:small"><br></div><div style=3D"font-=
size:small">I&#39;m not a fan of pedantic &quot;just because&quot; changes.=
 If nothing is</div><div style=3D"font-size:small">Broken, I just leave thi=
ngs as they are.</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">The do_compile prepend still seems to be needed in on =
one</div><div style=3D"font-size:small">of my builders as well, I&#39;ll in=
vestigate that more later, and can</div><div style=3D"font-size:small">Drop=
 it once I understand what is going on.</div><div style=3D"font-size:small"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
y I&#39;d use / consider it ?</span></div><div style=3D"font-size:small"><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<span class=3D"gmail_default" style=3D"font-size:small"></span></blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
<div style=3D"font-size:small">I like that change as well.</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">I&#39;ll spli=
t up the commit here and see if I can get the bits I want.<span class=3D"gm=
ail_default" style=3D"font-size:small"></span></div></div></div></div></blo=
ckquote><div><span class=3D"gmail_default" style=3D"font-size:small"></span=
></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve chop=
ped up the commit with git and grabbed the least footprint parts of the cha=
nge.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Once the dust settle=
s on the release, I&#39;ll look at the do_compile:prepend() to understand w=
hy one of my builds blew up (could be some mix of branches, or something eq=
ually incorrect).</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;l=
l stage that part of the commit on master-next so that I can&#39;t forget.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div style=3D"font-size:small"><br></div><div style=3D"font-siz=
e:small">Cheers,</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Bruce</div><div style=3D"font-size:small"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9233): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9233" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9233</a><br>
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

--00000000000034bd0606333c8d06--

