Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCDAC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:04:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.20841.1684483470326003956
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P72PmcN1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f42c865534so28292815e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483468; x=1687075468;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrGOVm/2O9baiBC+qz+4HQ6+duMBsMMwwX58bnfAv5E=;
        b=P72PmcN14Luk3+sc4dzpum4ukzf3dvgWK4D8kbp0Q/24mQ88gFbUTk8XDHcaxT4Rtg
         THrRhRbmRsPY87UQXWlRVutBlPr2Qd3KE0riFIfJ6ZItzuLSfHIasgBRNnjhNl43DVzX
         /iSUj0+gIgCrp3PFu9SS25nk8EivaoNnqmTQy46KvtKKUpvgVYDnKXnRJjwKc4UxF3Y3
         hRlEyptAPHtCcp9/tc5ACDG6NQw4tZLXztWYtqNf9Dnu+HfzorsT4UDV5gNt45Yq/852
         QjS/Ub5AjA/klwJmjwYVbRfKXuFLhWAYuyw6LOoJtZWuUayvEHb1i279mbL8kqgLkxEc
         p5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483468; x=1687075468;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrGOVm/2O9baiBC+qz+4HQ6+duMBsMMwwX58bnfAv5E=;
        b=lz2MKCsN7eyTWf+R+NFxoiAQpMv2mWU5lr/O6NpS47dSwjq7hG4jNuUg9rXHV4ZkIy
         lv7zWalO+ohoBv1/s+KnEbmzN4wOfEMVFG/pxiiC4WEaluZMCMTtCsXB+KWeH08ZpHCR
         aH2mw0f+qfhTgYamUKKbSQcyvCZ3YwAnkxhKwPQFdsXX9FKX75yl5b56uW97DKZeHsLP
         5e4ZwFkB4pkaUQ/V3tei91GMW9DqJi0LtnvMZPOWYzEH1+Yql09QbZ26wbN26e557tjk
         j1T1dd4t1QIliPI7sXiLAEVCSL3+AopGo0rSk4mPeOrcQ2rmugu7gVdrAetExODv6smz
         cBKQ==
X-Gm-Message-State: AC+VfDxsBBPrNkQ6/Co7OWr6JuhI0/a7uRCXAY1uU9JLymte8TzuMOl4
	HPh/Bm2/dxk88IH/DCzLg8QcFmoFfQnGJRRFuUgfr9Ln
X-Google-Smtp-Source: ACHHUZ7iUaSK9/KGWSbGGALqw7oNbMZNFFUMFr720R8UqPNWqblW1duuPm7p/Gx+ONZAe5sSkk+8V33Udp3e4eE85zk=
X-Received: by 2002:a05:600c:364b:b0:3f4:1a97:ab1d with SMTP id
 y11-20020a05600c364b00b003f41a97ab1dmr686001wmq.1.1684483468282; Fri, 19 May
 2023 01:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230519072844.4366-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519072844.4366-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:34:16 +0530
Message-ID: <CAJM8miWsCHRN=B9f-7umuseNgKpWOuygK+4+oyV-gnF0ucNY=g@mail.gmail.com>
Subject: meta-virtualization][PATCH 3/7] lxc: update to 4.0.10 and switch to git
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c1cd7d05fc075e18"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:04:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8067

--000000000000c1cd7d05fc075e18
Content-Type: text/plain; charset="UTF-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To more easily pull in fixes / backports from newer versions, switching
to git. This also allows bisecting and easier support when we run into
upgrade issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 47f9bdaa9ea883b23f596342033ecebd905c890e)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 recipes-containers/lxc/{lxc_4.0.9.bb => lxc_git.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename recipes-containers/lxc/{lxc_4.0.9.bb => lxc_git.bb} (96%)

diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/
lxc_git.bb
similarity index 96%
rename from recipes-containers/lxc/lxc_4.0.9.bb
rename to recipes-containers/lxc/lxc_git.bb
index 8b165e2..76e0493 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash
libgcc"

 RDEPENDS_${PN}-networking += "iptables"

-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz
\
+SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0 \
        file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
        file://run-ptest \
        file://lxc-fix-B-S.patch \
@@ -52,12 +52,10 @@ SRC_URI = "
http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
        "

-SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
-SRC_URI[sha256sum] =
"1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c793ab3c62b86f37e52b"
+SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
+PV = "4.0.10+git${SRCPV}"

-
-
-S = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/git"

 # Let's not configure for the host distro.
 #
-- 
2.17.1

--000000000000c1cd7d05fc075e18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote">From: Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"norefe=
rrer">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
To more easily pull in fixes / backports from newer versions, switching<br>
to git. This also allows bisecting and easier support when we run into<br>
upgrade issues.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 47f9bdaa9ea883b23f596342033ecebd905c890e)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/{<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a> =3D&gt; <a href=3D"http=
://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lxc_git.bb</=
a>} | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
=C2=A0rename recipes-containers/lxc/{<a href=3D"http://lxc_4.0.9.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a> =3D&gt; <a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lxc_=
git.bb</a>} (96%)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a> b/recipes-contain=
ers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">lxc_git.bb</a><br>
similarity index 96%<br>
rename from recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
rename to recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">lxc_git.bb</a><br>
index 8b165e2..76e0493 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnut=
ls bash libgcc&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-networking +=3D &quot;iptables&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/$%7BBPN%=
7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz</a> \<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/lxc.git;branch=3D=
stable-4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/lxc/=
lxc.git;branch=3Dstable-4.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-1.0.0-disable-udhcp-from-busybox-tem=
plate.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-fix-B-S.patch \<br>
@@ -52,12 +52,10 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org=
/downloads/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">http://linuxcontainers.org/downloads/${BPN}/${BPN}-=
${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://enable_seccomp_profile_when_compil=
ed_libseccomp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;365fcca985038910e19a1e0fff15ed07&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c=
793ab3c62b86f37e52b&quot;<br>
+SRCREV =3D &quot;cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874&quot;<br>
+PV =3D &quot;4.0.10+git${SRCPV}&quot;<br>
<br>
-<br>
-<br>
-S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0# Let&#39;s not configure for the host distro.<br>
=C2=A0#<br>
-- <br>
2.17.1<br>
<br>
</div></div></div>

--000000000000c1cd7d05fc075e18--

