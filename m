Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABB6CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:46:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.32893.1759754779606507917
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 05:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dH1E/6iE;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2697899a202so39656695ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759754779; x=1760359579; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NvzdNYtX/ObT9zIDnc1/Jy5qIKuU3KOHK+bJffuwIE=;
        b=dH1E/6iEVxqknpg8/Uxu0qSqsUKFPClW6HQJaa96JZ9zfZTVfHpQA6BgtdancSKPlC
         lU/vSIdk14SnoTw55J20qQZGtpUtVnqEhwbbWGhW/J0ROtL7jHiWVGwLvJu075jfc9j4
         20XxdOl9hXGwJiKcctlSKyMkdv7KHnIeiT1odsBnUHkNBxSmhHtMX0I1cj64qMIOCO7X
         55O2j24VMMnvp2F4wYOkqLgDB+qXRQNmVb7WBdwgkHtcQH0nU6tCztt2qBQRsMPYKpG4
         /iV5C4RjQs9mgYCU/U9BvqLXg0YSJngeJDffKRxOOJiHNHPS1bjTTA4bmElsHsCWGH7N
         SJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754779; x=1760359579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NvzdNYtX/ObT9zIDnc1/Jy5qIKuU3KOHK+bJffuwIE=;
        b=fA5FOdjHCdtbeqepiyUAOHVrA03AGhiccHqjdO/u1pz750JhKVYQEEV111XgcanBRH
         XCu3rNKGYWgidG1ABkO2iQDpQ6+yZeTIbuA5XhnrDvYBPAmdDxAvIOt2le4tU9ryxBwi
         qCwhZ61iqdMItRftzFgJU1loIZkLNFwijIbX3dcdCNoXXa9WZ10ybONcRrIo+m3RLjRy
         5zUJgSYNic01lvmLnM1JaiKoMckUga+sNpPuG6B29V2MN885Za4vVx/n08Ib4t9jtAnN
         c/iIidG9Qair3zsGPt6KIht43CBxvSTIp4VOcmi+w1d4eRe34T9e8GBJnp3Ep5ybN9Au
         FRPA==
X-Gm-Message-State: AOJu0YwIMdiJ7UgWg4a5V6aaD6YFFkRiI789R57FBubt0B0LyKr4LosO
	mSE8RtFwzlvKHpBAkn3jnrW51/Ie+pHHScpBmnNrYK3gOAKjevnDi/8k/88hq5EdDzUmbrrI+qf
	B3pu+9S+6dsyzUU4FliyG4nP8IfXJ1HI=
X-Gm-Gg: ASbGncsB/G/hYlusGPwU9A0I5Mrpw40/kICGFnp1plU1RC57jdaev8y+jm/MDsiuefo
	knKTs5ufEKQipvyFYmNsgigLQq04LzCyt+CGO+g+luzTWQgY8xt9iehqlPPg9YsWQnxQ1BOE6Z0
	Ut+VcckqyQtNYjgK3EESE3G1mS4umvDVRSZNL1nUDDjeGAkQdoLTZkDvhE8kGMH7oFEgFr6Elv3
	n1X0gbHYzK+LpienxzCTDw4m/KAKOorM0pFe1TqhFCmMLSZdZ8WsKNURHeYGSnG
X-Google-Smtp-Source: AGHT+IHuMUgvWlpHOy4NBs7iC7+0opqOEXu3MqHUxTcCL06aPfbfh3E9Pmj30OVp5duMdyBEnQdNsL0XlBCIpZpgdyA=
X-Received: by 2002:a17:902:f706:b0:265:f460:ab26 with SMTP id
 d9443c01a7336-28e8d00a51emr204789695ad.3.1759754778762; Mon, 06 Oct 2025
 05:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251006044924.875740-1-divya.chellam@windriver.com> <20251006044924.875740-2-divya.chellam@windriver.com>
In-Reply-To: <20251006044924.875740-2-divya.chellam@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Oct 2025 08:46:06 -0400
X-Gm-Features: AS18NWB-DvGdMwDHBeJXT_Eoz1XmQF12CpyoC53cKO4oXdxHJFWGs7kWLH31RiM
Message-ID: <CADkTA4M5TqDLonBhHHoWfofyxXxPUNBpaDPX9_dHVq5z6fRCuw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] podman: update to v5.6.2
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007ae30506407cd634"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 12:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9413

--0000000000007ae30506407cd634
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the changes, but I already have a full set of package
updates under test.

Once M3 releases, I'll start pushing them to the branches.

Bruce

On Mon, Oct 6, 2025 at 12:49=E2=80=AFAM dchellam via lists.yoctoproject.org
<Divya.Chellam=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
>
> This includes cve for CVE-2025-9566
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://github.com/containers/podman/releases/tag/v5.6.1
> https://github.com/containers/podman/releases/tag/v5.6.2
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index c5e7b49d..89ee9a7c 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -16,7 +16,7 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "41224eb949be6fa380c11d8ef66c099462d2507f"
> +SRCREV =3D "9dd5e1ed33830612bc200d7a13db00af6ab865a4"
>  SRC_URI =3D " \
>      git://
> github.com/containers/libpod.git;branch=3Dv5.6;protocol=3Dhttps;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/containers/libpod.git;branch=3Dv5.6;protocol=3Dhttps;d=
estsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> 'file://50-podman-rootless.conf', '', d)} \
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D3d9b931fa23ab1cacd0087f9e2ee12
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "v5.6.0"
> +PV =3D "v5.6.2"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9412):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9412
> Mute This Topic: https://lists.yoctoproject.org/mt/115612862/1050810
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

--0000000000007ae30506407cd634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks for the changes, but I already have a full set of package updates=C2=A0=
under test.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Once M3=
 releases, I&#39;ll start pushing them to the branches.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct=
 6, 2025 at 12:49=E2=80=AFAM dchellam via <a href=3D"http://lists.yoctoproj=
ect.org">lists.yoctoproject.org</a> &lt;Divya.Chellam=3D<a href=3D"mailto:w=
indriver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windriver.com" target=
=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
<br>
This includes cve for CVE-2025-9566<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://github.com/containers/podman/releases/tag/v5.6.1" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/containers/podman/release=
s/tag/v5.6.1</a><br>
<a href=3D"https://github.com/containers/podman/releases/tag/v5.6.2" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/containers/podman/release=
s/tag/v5.6.2</a><br>
<br>
Signed-off-by: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windriver.=
com" target=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index c5e7b49d..89ee9a7c 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -16,7 +16,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext-native \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;41224eb949be6fa380c11d8ef66c099462d2507f&quot;<br>
+SRCREV =3D &quot;9dd5e1ed33830612bc200d7a13db00af6ab865a4&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containers/libpod.gi=
t;branch=3Dv5.6;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D" =
rel=3D"noreferrer" target=3D"_blank">github.com/containers/libpod.git;branc=
h=3Dv5.6;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a> \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;root=
less&#39;, &#39;file://50-podman-rootless.conf&#39;, &#39;&#39;, d)} \<br>
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=
=3D3d9b931fa23ab1cacd0087f9e2ee12<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
-PV =3D &quot;v5.6.0&quot;<br>
+PV =3D &quot;v5.6.2&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2022-2989] =3D &quot;fixed-version: fixed since v4.3.0=
&quot;<br>
=C2=A0CVE_STATUS[CVE-2023-0778] =3D &quot;fixed-version: fixed since v4.5.0=
&quot;<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9412): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9412" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9412</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/115612862/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/115612862/1050810</a><br>
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

--0000000000007ae30506407cd634--

