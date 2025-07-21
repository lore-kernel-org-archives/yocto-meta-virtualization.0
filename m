Return-Path: <raitosyo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCF5C83F17
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 03:20:09 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.32104.1753068007713667815
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Jul 2025 20:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mw6enn0E;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: raitosyo@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e28058c18cso41027145ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jul 2025 20:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068007; x=1753672807; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03QS4hyio4lKPwFi3n9GEPSJzU4l7m3b1+Lg50CjKqg=;
        b=mw6enn0EfbhuvQDmr+C/wuW5zlbExVmegS5W2cw2o9Uy3AdoSPDXWbN0yXd8fkPtBg
         kkaEAf/8qdyftXDjuhHXn574VTVzuxp9n6qDWrQQ7IAGdOmyv1MX/maA2CHGv5X3SvfI
         eruZ3TNNwYvLflJskLHG4T6Rzzmp+3eb24guoyAQ5+dWtZC2OfSfJAr0Z7OoiUtBf6oa
         ulcMJkiddbubmwiqn0rDOzehcb3hvAYXgHgdcvt71kWmC8N/Wil+sIWEIxKXYV+A95iX
         rTQ3QGHBsNVqbX2mgjEyzrkrEFcaV10OTcQlhcz/aW5Sjpo2CTWp93HSZpOmN25/tZGT
         4EuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068007; x=1753672807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03QS4hyio4lKPwFi3n9GEPSJzU4l7m3b1+Lg50CjKqg=;
        b=FWl9SZD918XlgrZwEvWeqjwIKbsMRGo7I/2OjMtm27HJfb0CU94Hq8Pf8Dm3rtKlO4
         cAb2tGCa3U9PFQvl6vhSHCqtwDR6bma3hKUXB+fi+a6buxeMlmMX49oQ9lgml6iU0nUJ
         7u6cwoiuVkypqCjFfqMhg9NLWHmmWkGFEZU/0dgi0zBEDA2Vk+pGVOc+vXI5FFjSqopD
         tKzU9IcojA03yNJdmpY91RzYO6fKDZjAuA2kTp4H+VpkVjVggVJwHhMILWBYjN+8IR9+
         a5xWGaAbMDPRqf/ktAbkun7BRiY5LIBi79fRjgRZJlEk/HqETGt7kUe3zQr527QRcJGi
         TwLQ==
X-Gm-Message-State: AOJu0YzbkngaU8utl9PCcB1/mD9FFtSlKO8DRQyy8hLwwx58i2vpZuQP
	phkRfU/mXAVnncM9hqsMNr3HI5pG/C1RHugdQkwpnsNqM1izRpZtgA4H0wnzvbTl/Ec8xX9YRPF
	FqxTBepx0s2L7KJjXX6JnQ/hx0yqUqOWxgQ==
X-Gm-Gg: ASbGnctwK20PRf6jpO212/PMIllrWJaydGqt+y89DEuouFL7n9WDxyrpaSTBt6mwMLU
	bZVtRkqat2XkGuggidFUmstG2aN60Rdws8v8gQpLARs+vTSRXLF6y1qyIuMD/PxNEmD4e6ytI0z
	3gcO2Hm8CInLQ0eACjgW2bE4Z25vpX9ltL/3bqbaw/FlPjwQU48zYZ2q9CvdBdqn7za//Elg8Dz
	xGM+T3N5UvWmiLNLIb+eSJnELStrPstGo7oc6C8
X-Google-Smtp-Source: AGHT+IHvcXCn2IJDYvl/6CQgCbXA0FhCEUXdGkSDJ5om+YeAk/atg4MsWXgVFMAfGPQH/caRmh2swtmonMweB4Yv4ZQ=
X-Received: by 2002:a05:6e02:2587:b0:3e2:9f78:3783 with SMTP id
 e9e14a558f8ab-3e29f783956mr91749485ab.21.1753068006626; Sun, 20 Jul 2025
 20:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250718091253.829595-1-raitosyo@gmail.com> <aH2nQblZfyk1OYog@gmail.com>
In-Reply-To: <aH2nQblZfyk1OYog@gmail.com>
From: Ryosuke Saito <raitosyo@gmail.com>
Date: Mon, 21 Jul 2025 12:19:52 +0900
X-Gm-Features: Ac12FXyWsQfZbGZdskDedtqpeeo1wb6CG_Y9xOqnVghmKOvPJFFZXFhpWs2BOoU
Message-ID: <CADTWAOJtZixJ+DKy8L7hErDcHVyrfLLQovzQ8cygN9N4nHAQ1A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] tini: Fix build error with CMake 4+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Ryosuke Saito <ryosuke.saito@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cd594e063a67f3b8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 03:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9325

--000000000000cd594e063a67f3b8
Content-Type: text/plain; charset="UTF-8"

That's fine with me, thanks!

Ryosuke

On Mon, Jul 21, 2025, 11:34 Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> Rather than stacking more backports onto the recipe, I've just
> bumped to -tip (I'm doing more package uprev's anyway), and I'm
> now able to build with the OE CMake bump.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] tini: Fix build error with CMake
> 4+
> on 18/07/2025 Ryosuke Saito via lists.yoctoproject.org wrote:
>
> > From: Ryosuke Saito <ryosuke.saito@linaro.org>
> >
> > Backport patches from https://github.com/krallin/tini to resolve the
> > build error with CMake 4.0 and later.
> >
> > - 0001-chore-bump-minimum-CMake-to-2.8.12.patch
> > - 0001-chore-allow-CMake-though-to-3.10.patch
> >
> > Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> > ---
> >  ...001-chore-allow-CMake-though-to-3.10.patch | 39 +++++++++++++++++++
> >  ...1-chore-bump-minimum-CMake-to-2.8.12.patch | 29 ++++++++++++++
> >  recipes-containers/tini/tini_0.19.0.bb        |  2 +
> >  3 files changed, 70 insertions(+)
> >  create mode 100644
> recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> >  create mode 100644
> recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> >
> > diff --git
> a/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> > new file mode 100644
> > index 000000000000..faea9fb647f9
> > --- /dev/null
> > +++
> b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> > @@ -0,0 +1,39 @@
> > +From bb775aa14cc5072cf687fd7f4edd44df62c06b1d Mon Sep 17 00:00:00 2001
> > +From: Rudi Heitbaum <rudi@heitbaum.com>
> > +Date: Fri, 28 Mar 2025 19:10:02 +1100
> > +Subject: [PATCH] chore: allow CMake though to 3.10
> > +
> > +This is allows the build with cmake-4.0.0 without deprecation warnings.
> > +
> > +use min...max syntax to allow build with newer cmake.
> > +ref:
> https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
> > +
> > +Fixes:
> > +CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> > +  Compatibility with CMake < 3.5 has been removed from CMake.
> > +
> > +  Update the VERSION argument <min> value.  Or, use the <min>...<max>
> syntax
> > +  to tell CMake that the project requires at least <min> but has been
> updated
> > +  to work with policies introduced by <max> or earlier.
> > +
> > +  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> > +
> > +Upstream-Status: Backport [
> https://github.com/krallin/tini/commit/071c715e376e9ee0ac1a196fe8c38bcb61ad385c
> ]
> > +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 9b06fc13f31d..2e5390b84967 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,4 +1,4 @@
> > +-cmake_minimum_required (VERSION 2.8.12)
> > ++cmake_minimum_required (VERSION 2.8.12...3.10)
> > + project (tini C)
> > +
> > + # Config
> > +--
> > +2.34.1
> > +
> > diff --git
> a/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> > new file mode 100644
> > index 000000000000..ec03f7ff16b2
> > --- /dev/null
> > +++
> b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> > @@ -0,0 +1,29 @@
> > +From 0a5449a61b64938354db6efae8465d530d824d37 Mon Sep 17 00:00:00 2001
> > +From: Bjorn Neergaard <bneergaard@mirantis.com>
> > +Date: Fri, 27 Jan 2023 08:07:51 -0700
> > +Subject: [PATCH] chore: bump minimum CMake to 2.8.12
> > +
> > +This is both the last version supported by current CMake, and the
> > +version in use on Enterprise Linux 7.
> > +
> > +Signed-off-by: Bjorn Neergaard <bneergaard@mirantis.com>
> > +
> > +Upstream-Status: Backport [
> https://github.com/krallin/tini/commit/0b44d3665869e46ccbac7414241b8256d6234dc4
> ]
> > +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 4a6cab12fc25..9b06fc13f31d 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,4 +1,4 @@
> > +-cmake_minimum_required (VERSION 2.8.0)
> > ++cmake_minimum_required (VERSION 2.8.12)
> > + project (tini C)
> > +
> > + # Config
> > +--
> > +2.34.1
> > +
> > diff --git a/recipes-containers/tini/tini_0.19.0.bb
> b/recipes-containers/tini/tini_0.19.0.bb
> > index c3ca25d07a4a..9eed4a646cba 100644
> > --- a/recipes-containers/tini/tini_0.19.0.bb
> > +++ b/recipes-containers/tini/tini_0.19.0.bb
> > @@ -10,6 +10,8 @@ SRC_URI = " \
> >
> file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
> >
> file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
> >    file://0001-Support-POSIX-basename-from-musl-libc.patch \
> > +  file://0001-chore-bump-minimum-CMake-to-2.8.12.patch \
> > +  file://0001-chore-allow-CMake-though-to-3.10.patch \
> >    "
> >
> >  LICENSE = "MIT"
> > --
> > 2.50.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9321):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9321
> > Mute This Topic: https://lists.yoctoproject.org/mt/114218116/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--000000000000cd594e063a67f3b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That&#39;s fine with me, thanks!<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Ryosuke</div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 21, 202=
5, 11:34 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Rather than stacking more backports onto the recipe, I=
&#39;ve just<br>
bumped to -tip (I&#39;m doing more package uprev&#39;s anyway), and I&#39;m=
<br>
now able to build with the OE CMake bump.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH] tini: Fix build error with CMake 4=
+<br>
on 18/07/2025 Ryosuke Saito via <a href=3D"http://lists.yoctoproject.org" r=
el=3D"noreferrer noreferrer" target=3D"_blank">lists.yoctoproject.org</a> w=
rote:<br>
<br>
&gt; From: Ryosuke Saito &lt;<a href=3D"mailto:ryosuke.saito@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">ryosuke.saito@linaro.org</a>&gt;<br>
&gt; <br>
&gt; Backport patches from <a href=3D"https://github.com/krallin/tini" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/krallin/tin=
i</a> to resolve the<br>
&gt; build error with CMake 4.0 and later.<br>
&gt; <br>
&gt; - 0001-chore-bump-minimum-CMake-to-2.8.12.patch<br>
&gt; - 0001-chore-allow-CMake-though-to-3.10.patch<br>
&gt; <br>
&gt; Signed-off-by: Ryosuke Saito &lt;<a href=3D"mailto:ryosuke.saito@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">ryosuke.saito@linaro.org</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 ...001-chore-allow-CMake-though-to-3.10.patch | 39 +++++++++++++=
++++++<br>
&gt;=C2=A0 ...1-chore-bump-minimum-CMake-to-2.8.12.patch | 29 +++++++++++++=
+<br>
&gt;=C2=A0 recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tini_0.19.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 70 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-containers/tini/tini/0001-chore-allow=
-CMake-though-to-3.10.patch<br>
&gt;=C2=A0 create mode 100644 recipes-containers/tini/tini/0001-chore-bump-=
minimum-CMake-to-2.8.12.patch<br>
&gt; <br>
&gt; diff --git a/recipes-containers/tini/tini/0001-chore-allow-CMake-thoug=
h-to-3.10.patch b/recipes-containers/tini/tini/0001-chore-allow-CMake-thoug=
h-to-3.10.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..faea9fb647f9<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.=
10.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From bb775aa14cc5072cf687fd7f4edd44df62c06b1d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Rudi Heitbaum &lt;<a href=3D"mailto:rudi@heitbaum.com" target=
=3D"_blank" rel=3D"noreferrer">rudi@heitbaum.com</a>&gt;<br>
&gt; +Date: Fri, 28 Mar 2025 19:10:02 +1100<br>
&gt; +Subject: [PATCH] chore: allow CMake though to 3.10<br>
&gt; +<br>
&gt; +This is allows the build with cmake-4.0.0 without deprecation warning=
s.<br>
&gt; +<br>
&gt; +use min...max syntax to allow build with newer cmake.<br>
&gt; +ref: <a href=3D"https://cmake.org/cmake/help/latest/command/cmake_min=
imum_required.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/cmake.org/cmake/help/latest/command/cmake_minimum_required.html</a><br>
&gt; +<br>
&gt; +Fixes:<br>
&gt; +CMake Error at CMakeLists.txt:1 (cmake_minimum_required):<br>
&gt; +=C2=A0 Compatibility with CMake &lt; 3.5 has been removed from CMake.=
<br>
&gt; +<br>
&gt; +=C2=A0 Update the VERSION argument &lt;min&gt; value.=C2=A0 Or, use t=
he &lt;min&gt;...&lt;max&gt; syntax<br>
&gt; +=C2=A0 to tell CMake that the project requires at least &lt;min&gt; b=
ut has been updated<br>
&gt; +=C2=A0 to work with policies introduced by &lt;max&gt; or earlier.<br=
>
&gt; +<br>
&gt; +=C2=A0 Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configurin=
g anyway.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/krallin/tini=
/commit/071c715e376e9ee0ac1a196fe8c38bcb61ad385c" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://github.com/krallin/tini/commit/071c715e376e9=
ee0ac1a196fe8c38bcb61ad385c</a>]<br>
&gt; +Signed-off-by: Ryosuke Saito &lt;<a href=3D"mailto:ryosuke.saito@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">ryosuke.saito@linaro.org</a>&g=
t;<br>
&gt; +---<br>
&gt; + CMakeLists.txt | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index 9b06fc13f31d..2e5390b84967 100644<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-cmake_minimum_required (VERSION 2.8.12)<br>
&gt; ++cmake_minimum_required (VERSION 2.8.12...3.10)<br>
&gt; + project (tini C)<br>
&gt; + <br>
&gt; + # Config<br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/recipes-containers/tini/tini/0001-chore-bump-minimum-CMak=
e-to-2.8.12.patch b/recipes-containers/tini/tini/0001-chore-bump-minimum-CM=
ake-to-2.8.12.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..ec03f7ff16b2<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.=
8.12.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From 0a5449a61b64938354db6efae8465d530d824d37 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Bjorn Neergaard &lt;<a href=3D"mailto:bneergaard@mirantis.com" =
target=3D"_blank" rel=3D"noreferrer">bneergaard@mirantis.com</a>&gt;<br>
&gt; +Date: Fri, 27 Jan 2023 08:07:51 -0700<br>
&gt; +Subject: [PATCH] chore: bump minimum CMake to 2.8.12<br>
&gt; +<br>
&gt; +This is both the last version supported by current CMake, and the<br>
&gt; +version in use on Enterprise Linux 7.<br>
&gt; +<br>
&gt; +Signed-off-by: Bjorn Neergaard &lt;<a href=3D"mailto:bneergaard@miran=
tis.com" target=3D"_blank" rel=3D"noreferrer">bneergaard@mirantis.com</a>&g=
t;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/krallin/tini=
/commit/0b44d3665869e46ccbac7414241b8256d6234dc4" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://github.com/krallin/tini/commit/0b44d3665869e=
46ccbac7414241b8256d6234dc4</a>]<br>
&gt; +Signed-off-by: Ryosuke Saito &lt;<a href=3D"mailto:ryosuke.saito@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">ryosuke.saito@linaro.org</a>&g=
t;<br>
&gt; +---<br>
&gt; + CMakeLists.txt | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index 4a6cab12fc25..9b06fc13f31d 100644<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-cmake_minimum_required (VERSION 2.8.0)<br>
&gt; ++cmake_minimum_required (VERSION 2.8.12)<br>
&gt; + project (tini C)<br>
&gt; + <br>
&gt; + # Config<br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">tini_0.19.0.bb</a> b/recip=
es-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">tini_0.19.0.bb</a><br>
&gt; index c3ca25d07a4a..9eed4a646cba 100644<br>
&gt; --- a/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tini_0.19.0.bb</a><br>
&gt; +++ b/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tini_0.19.0.bb</a><br>
&gt; @@ -10,6 +10,8 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 file://0001-Do-not-strip-the-output-binary-allow-yocto-to=
-do-thi.patch \<br>
&gt;=C2=A0 =C2=A0 file://0001-tini.c-a-function-declaration-without-a-proto=
type-is.patch \<br>
&gt;=C2=A0 =C2=A0 file://0001-Support-POSIX-basename-from-musl-libc.patch \=
<br>
&gt; +=C2=A0 file://0001-chore-bump-minimum-CMake-to-2.8.12.patch \<br>
&gt; +=C2=A0 file://0001-chore-allow-CMake-though-to-3.10.patch \<br>
&gt;=C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; -- <br>
&gt; 2.50.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9321): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9321" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/message/9321</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11421811=
6/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.org/mt/114218116/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner=
@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gma=
il.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000cd594e063a67f3b8--

