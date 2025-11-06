Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2A7CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:16:58 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16460.1762438612576745205
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPxPWxp6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34077439166so1131791a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762438612; x=1763043412; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwGVLf7X39HW+ZJH4PNeJinGT/1QE5sTCRt02qjAh4k=;
        b=UPxPWxp6AnE174GtUXGnGa5hGTBcyq46kCveSODUbdS7DgG4BilWhni3USqKeRJv8L
         k5Yx1xmCSTI1fAlxWO1WbFPw6HkrwpeyQ+Jo2jHxenNA4g/gFT45MEJbQl7c9BJvS1fw
         OWj7/a4ZsmFpeIbtFB6IPKNcixrj5T0KRoGNrI+3ybcDC7q7pyH3eZIyAxVQnGbkT5QJ
         v4IhiHUqfyMgvkh/rfAFBeSXRwD7WSQXEVgW4k9F6mqglw15gURHXu+D2t6we4jwCSa4
         xNE0dzXtPHblouYUZ+uS89yv91cZ3zzW0S9cTO6bImlmJQq9vbUQxe7M+UPaDkdl0xNl
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438612; x=1763043412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwGVLf7X39HW+ZJH4PNeJinGT/1QE5sTCRt02qjAh4k=;
        b=Fr8UMc2q4uY/xPD9r4BVQ6Q5Vqg9dbqhV0+/lLpbXG5UTfOdn0oTjGNKuPBUKaWd05
         bxnRL/ii96e4gmuPd/HUiyKVIH15J7MaapcBHp9oOy8j1onZ5+Ec9bTcHwV1D7NcY1/P
         4QokQvkQO8oM0Fj3QXu88elSiqAmbyLgpOhPTX/ft7/oB7WzO4hbmBeoB12J37kXg/+a
         zadAGWMEdoF7V6n9j7vZagjcBfGlGIG/EBFpJdDHUglKzIbQGkmsd7FZQ8jyEDInru3E
         Xxfpb0J0PT5hWBgl9eLwaIBpN81KpUShRO2fIicYEuyROLnJ23Blwd/eGhCkPf1ezteJ
         GFPQ==
X-Gm-Message-State: AOJu0YxiOfys6U5K8apZu98kqbVcFY+jLsNhCEiDeLsrp+mIPD+H+A/e
	zQK/i1TWyO1sAoHQT+Rpqx33ZJ7gJjqehEXVV3i0o04ysx7jrvrZeXIs2uOn9szSunP/uc9VQoH
	yrBa/lMhEJjfAx5mwblGY/EM/8HJlLFcNGgi9
X-Gm-Gg: ASbGnctngtRRNqlZDkpauuZ18Bz8paYgdfnacAf7ubs3PucYhXXQglMNLlbNmn6+TCB
	CinPIiX83+k419m3skjx1w9qAnwTmGigRKU7G2J89Bf2QcEifSNIB6JP6fgxpIYeh1MpuHPsLxh
	uEYSpdCL+blAJLMZJQSsjVjcsQl/RyCf/Chfnv9VwDYRWw4ubM06/HJ3IxExzWmk/xIpjZdBLmH
	ffl2wcgKUWzzB5EyjWc/gzWUMFO5ZzkoiD6QKUgAXj6ut88krqyLgThoLzCHw==
X-Google-Smtp-Source: AGHT+IEoeNvDq9smrd1lp+Js0mONJe6i5rTWTW1wEqbYFTFxMUozas2ijmwAH9wrxz0JFDSRcHHR2QlkjmrvH6JQ2zs=
X-Received: by 2002:a17:90b:268d:b0:341:8ac7:24d3 with SMTP id
 98e67ed59e1d1-341a7008c4bmr9433091a91.34.1762438611572; Thu, 06 Nov 2025
 06:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20251105201525.288881-1-tom.hochstein@oss.nxp.com>
 <aQwl4Wli3oqH6ZgV@gmail.com> <518aeb51-780f-4115-9b31-4ef7d25a3675@oss.nxp.com>
In-Reply-To: <518aeb51-780f-4115-9b31-4ef7d25a3675@oss.nxp.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Nov 2025 09:16:39 -0500
X-Gm-Features: AWmQ_bn0fgYz9RCtKfoHWIRcWQdqkJQ87kIWlPtAmckze6xN_LR1C2tdPislq8g
Message-ID: <CADkTA4Omo+B9VH9fJDQSvTpS9a_jw27efqsZyhEjOwSac2WdBw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
To: Tom Hochstein <tom.hochstein@oss.nxp.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006199c10642edb77b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:16:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9430

--0000000000006199c10642edb77b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 8:07=E2=80=AFAM Tom Hochstein <tom.hochstein@oss.nxp=
.com>
wrote:

>
> On 11/5/2025 10:36 PM, Bruce Ashfield wrote:
>
> In message: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-pyt=
hon
> on 05/11/2025 Tom Hochstein via lists.yoctoproject.org wrote:
>
>
> @@ -46,8 +46,8 @@ do_compile:append() {
>               # the syroot staged pkgconfig entries. So we clear the sysr=
oot
>               # for just this portion.
>               export PKG_CONFIG_SYSROOT_DIR=3D
> -             cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
> -               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py =
build
> +             cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +             ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py bu=
ild
>
> If the cd in it's own command fails, so should have the one in
> the &&
>
> If one is failing and the other isn't when the directory doesn't
> exist, something strange is up with set -e in the routines, or
> am I not seeing something that change more than the new variable
> and the removal of the && ?
>
> Bruce
>
> The cd with the && does fail, and it prevents the command on the
> right-hand-side. The problem is the && causes the same behavior as when
> using if, which is to assume that the logic is aware of the failure
> possibility and does not need the engine to perform the automatic
> exit-on-error. The script continues to the end, finds no other failure, a=
nd
> returns good status.
>

I wasn't clear, I'm quite aware of what && does in shell scripting. I just
misunderstood the change in intent of the check in my rush late last night.
We actually had intended for that to continue, or it wouldn't have been
written with the &&

I tend to prefer proper tests and informative error messages versus the
exit, since even when that fails on the cd command, someone seeing the
error message will have very little idea what caused it. I'll comment on
the new patch so my suggestion will be on that version.

Bruce



> Tom
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9426): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9426
> Mute This Topic: https://lists.yoctoproject.org/mt/116141416/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006199c10642edb77b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at 8:07=E2=80=
=AFAM Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.com" target=
=3D"_blank">tom.hochstein@oss.nxp.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 11/5/2025 10:36 PM, Bruce Ashfield
      wrote:<span style=3D"white-space:pre-wrap">
</span></div>
    <blockquote type=3D"cite">
      <pre>In message: [meta-virtualization][PATCH] libvirt: Fix missing li=
bvirt-python
on 05/11/2025 Tom Hochstein via <a href=3D"http://lists.yoctoproject.org" t=
arget=3D"_blank">lists.yoctoproject.org</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre>@@ -46,8 +46,8 @@ do_compile:append() {
              # the syroot staged pkgconfig entries. So we clear the sysroo=
t
              # for just this portion.
              export PKG_CONFIG_SYSROOT_DIR=3D
-             cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &amp;&=
amp; \
-               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py bu=
ild
+             cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+             ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py buil=
d
</pre>
      </blockquote>
      <pre>If the cd in it&#39;s own command fails, so should have the one =
in
the &amp;&amp;

If one is failing and the other isn&#39;t when the directory doesn&#39;t
exist, something strange is up with set -e in the routines, or
am I not seeing something that change more than the new variable
and the removal of the &amp;&amp; ?

Bruce
</pre>
    </blockquote>
    <p>The cd with the &amp;&amp; does fail, and it prevents the command
      on the right-hand-side. The problem is the &amp;&amp; causes the
      same behavior as when using if, which is to assume that the logic
      is aware of the failure possibility and does not need the engine
      to perform the automatic exit-on-error. The script continues to
      the end, finds no other failure, and returns good status.=C2=A0</p></=
div></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I wasn&#39;t clear, I&#39;m quite aware of what &amp;&amp;=
 does in shell scripting. I just misunderstood the change in intent of the =
check in my rush late last night. We actually had intended for that to cont=
inue, or it wouldn&#39;t have been written with the &amp;&amp;</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">I tend to prefer proper tests and inf=
ormative error messages versus the exit, since even when that fails on the =
cd command, someone seeing the error message will have very little idea wha=
t caused it. I&#39;ll comment on the new patch so my suggestion will be on =
that version.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>
    <p>Tom</p>
    <blockquote type=3D"cite">
      <pre></pre>
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#9426): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9426" target=3D"_blank">https://lists.yoctoproject.=
org/g/meta-virtualization/message/9426</a>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116141416/105=
0810" target=3D"_blank">https://lists.yoctoproject.org/mt/116141416/1050810=
</a>
Group Owner: <a href=3D"mailto:meta-virtualization+owner@lists.yoctoproject=
.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org</a=
>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualiza=
tion/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blan=
k">bruce.ashfield@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre></pre>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--0000000000006199c10642edb77b--

