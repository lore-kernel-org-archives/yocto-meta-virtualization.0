Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD8DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:28:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3760.1742498927117160179
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 12:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZwkZ79x;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30185d00446so1671843a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742498926; x=1743103726; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzRbdbi7GksWmXkkzsPGEH2xRe9bPIAQVYqoUkXsvnc=;
        b=JZwkZ79xxqPKC8tURs+ekCMAfs7RrLkD5Kg/k9i7iYfe18eJXgtt+F2XYTkwBR/6WT
         buBATP6iShvMn8ETzRY+17+R2sX82G4CLCDPTQwiPW2TdAMG5jVooPOV4kDCp1zcJttD
         JObHiYWQTB3wXPrCi58WUSObXEpFGh1aB7r2MQDWIMvVdXvxXpoG8T6jyNy4c6lJ9faC
         sU+cV2ihMzdqDlT9/vv6u+dq3jZRLhpHeCCS3O7S0wKQjj4Tz/+B4u9S0oiBSi5Q/LPK
         44++JuaoHjWMaQpjWPo+jg9VFeUg9XntH1/Bgs/aISm1zaY/hIq7CdTW6q5cbGXvVd/B
         OKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742498926; x=1743103726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzRbdbi7GksWmXkkzsPGEH2xRe9bPIAQVYqoUkXsvnc=;
        b=BSJf2vZgx4qnf7Qqsb6s+l5TeqUyU/tBlIW1UYM0vLb5/c3SAheTXvy9sS1FeAVDP2
         8FsTzW9cqtDTiG6E93DWdwq+QUoO2WfjCc60t9XqG3A7m/kqn5K0+OqYxJirdB3J/8u7
         qP1L/22Kst86hg9OkZq0U+TVs6B6rZWOkIrOZHNBPZMG4ckSy82TkcY55IjFj8j8mkB5
         wx9GslXzp3eadarkrvS3jIcw+yeN6IkhB9yaWt1Mhm6soW3SVnSML/Lef1/DoZOfBHOr
         fcCk1KLMe+nT6I2BQc8nh1gK4SNY5pJQ5Zioas5M3AiyPD9ikac8nzLN+zIxqkMmm77n
         15/g==
X-Gm-Message-State: AOJu0YzKU5ZxUOeFqAhzd1MjOUrc8XLgJy3v0+81rdE90c4ZPIsUrfDK
	AvQKHZW5NlX6wpPLoXKiabkwUGCL9fzNOfNjGfmWuUDsRJwKJyv8uJur2R6aYpuvd6ZTOdjldlb
	SUm0YEOO7fEZJ0GxTpRUNWjs/Px2KUXulf2TUbA==
X-Gm-Gg: ASbGncs+v5X5Vny8nnJ6d2RTXFcECU9Mevbx/RtFYbmYZn+lsntv2RAvEl4ZkgQveM4
	1pWEfO3++9I4C6WXgIgvWIxKFB3KunDMJ6WkwRuzx7aVNy0/EAWbbR+ABonovwQb11KWBVQjxa8
	CdnTgkeZpIShF6tLPhcA+SDM0TgJA=
X-Google-Smtp-Source: AGHT+IHiL3ldrJz2x7W+WfwUJmrGcl9cc3tcxJFZYCoTLRbXSNzcRLXYn2Hr5UwOVHUmPdpgYCs+xdjcaC1ZEfTf2eQ=
X-Received: by 2002:a17:90b:4b42:b0:2f9:d0cd:3403 with SMTP id
 98e67ed59e1d1-3030f3efba0mr1007498a91.16.1742498926229; Thu, 20 Mar 2025
 12:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250311065659.886554-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20250311065659.886554-1-peng.zhang1.cn@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Mar 2025 15:28:35 -0400
X-Gm-Features: AQ5f1JoJ2bXtZ8MvzgCLvKB67NV3dJILgc86AYvI43OvbG4-6hp3bV8h2jQOLEE
Message-ID: <CADkTA4NunB_=Y6Z4iO050D-YB9ORtrBpwsTGUR33aOwopXbvkw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cri-o: Add CONTAINER_DEFAULT_RUNTIME
 to run-ptest
To: peng.zhang1.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008501620630cb25ca"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 19:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9167

--0000000000008501620630cb25ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't forgotten about this, I'm just overloaded trying to complete some
package upgrades and will get to pending patches shortly.

Bruce

On Tue, Mar 11, 2025 at 2:57=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.yoctoproject.org <peng.zhang1.cn=3Dwindriver.com@lists.yoctoproject.o=
rg>
wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> CRI-O version 1.31 and later defaults to crun instead of runc.
> This change cause ptests to fail if crun is not installed on the
> target system, as the test runner verifies the runtime's availability
> using 'command -v "$CONTAINER_DEFAULT_RUNTIME"'.
>
> Additionally, CRI-O specifies the runtime via the
> VIRTUAL-RUNTIME_container_runtime variable as a dependency.
>
> This commit explicitly sets the CONTAINER_DEFAULT_RUNTIME environment
> variable within the run-ptest script, based on the value of
> VIRTUAL-RUNTIME_container_runtime. This ensures ptests execute with
> the expected container runtime.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb
> b/recipes-containers/cri-o/cri-o_git.bb
> index 1ef32ab0..4622e8d7 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -117,6 +117,16 @@ do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/bin
>      cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
>      cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
> +    # CRI-O testing changed the default container runtime from runc to
> crun in version 1.31+.
> +    # To maintain compatibility with older tests expecting runc, and to
> allow for other custom runtimes,
> +    # this section explicitly sets CONTAINER_DEFAULT_RUNTIME in the
> run-ptest script.
> +    # The value is determined by the VIRTUAL-RUNTIME_container_runtime
> variable.
> +    if [ "${VIRTUAL-RUNTIME_container_runtime}" =3D "virtual-runc" ]; th=
en
> +        sed -i '/^.\/test\/test_runner/iexport
> CONTAINER_DEFAULT_RUNTIME=3Drunc' ${D}${PTEST_PATH}/run-ptest
> +    else
> +        sed -i '/^.\/test\/test_runner/iexport
> CONTAINER_DEFAULT_RUNTIME=3D${VIRTUAL-RUNTIME_container_runtime}'
> ${D}${PTEST_PATH}/run-ptest
> +    fi
> +
>  }
>
>  FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9162):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9162
> Mute This Topic: https://lists.yoctoproject.org/mt/111635727/1050810
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

--0000000000008501620630cb25ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail_default">I haven&#39;t forgotten about this, I&#39;m just =
overloaded trying to complete some package upgrades and will get to pending=
 patches shortly.</div><div class=3D"gmail_default"><br></div><div class=3D=
"gmail_default">Bruce</div></div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11, 2025=
 at 2:57=E2=80=AFAM Zhang, Peng (Paul) (CN) via <a href=3D"http://lists.yoc=
toproject.org">lists.yoctoproject.org</a> &lt;<a href=3D"http://peng.zhang1=
.cn">peng.zhang1.cn</a>=3D<a href=3D"mailto:windriver.com@lists.yoctoprojec=
t.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">From: Zhang Peng &lt;<a href=3D"=
mailto:peng.zhang1.cn@windriver.com" target=3D"_blank">peng.zhang1.cn@windr=
iver.com</a>&gt;<br>
<br>
CRI-O version 1.31 and later defaults to crun instead of runc.<br>
This change cause ptests to fail if crun is not installed on the<br>
target system, as the test runner verifies the runtime&#39;s availability<b=
r>
using &#39;command -v &quot;$CONTAINER_DEFAULT_RUNTIME&quot;&#39;.<br>
<br>
Additionally, CRI-O specifies the runtime via the<br>
VIRTUAL-RUNTIME_container_runtime variable as a dependency.<br>
<br>
This commit explicitly sets the CONTAINER_DEFAULT_RUNTIME environment<br>
variable within the run-ptest script, based on the value of<br>
VIRTUAL-RUNTIME_container_runtime. This ensures ptests execute with<br>
the expected container runtime.<br>
<br>
Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a> | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> b/recipes-containers/cri=
-o/<a href=3D"http://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri=
-o_git.bb</a><br>
index 1ef32ab0..4622e8d7 100644<br>
--- a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
+++ b/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
@@ -117,6 +117,16 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/bin<br>
=C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/test ${D}${PTEST_PATH}<br>
=C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 # CRI-O testing changed the default container runtime from r=
unc to crun in version 1.31+.<br>
+=C2=A0 =C2=A0 # To maintain compatibility with older tests expecting runc,=
 and to allow for other custom runtimes,<br>
+=C2=A0 =C2=A0 # this section explicitly sets CONTAINER_DEFAULT_RUNTIME in =
the run-ptest script.<br>
+=C2=A0 =C2=A0 # The value is determined by the VIRTUAL-RUNTIME_container_r=
untime variable.<br>
+=C2=A0 =C2=A0 if [ &quot;${VIRTUAL-RUNTIME_container_runtime}&quot; =3D &q=
uot;virtual-runc&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^.\/test\/test_runner/iexport CON=
TAINER_DEFAULT_RUNTIME=3Drunc&#39; ${D}${PTEST_PATH}/run-ptest<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^.\/test\/test_runner/iexport CON=
TAINER_DEFAULT_RUNTIME=3D${VIRTUAL-RUNTIME_container_runtime}&#39; ${D}${PT=
EST_PATH}/run-ptest<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0}<br>
<br>
=C2=A0FILES:${PN}-config =3D &quot;${sysconfdir}/crio/config/*&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9162): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9162" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9162</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111635727/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111635727/1050810</a><br>
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
rek II<br><br></div>

--0000000000008501620630cb25ca--

