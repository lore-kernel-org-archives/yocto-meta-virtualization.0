Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CDAC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:52:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.1442.1716414767928423664
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 May 2024 14:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=iuwDOCJm;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.53, mailfrom: troth@openavr.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-354dfe54738so924934f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1716414766; x=1717019566; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ehrdSpt5mtLpTfCIq95E5iVzEkMf3E73dGjcczuEiG8=;
        b=iuwDOCJmST4NDKYT8diEGckVWvFp0X9WNMyNb4VkdvVC2X6zNnx/MASAmKAjP9JRld
         OmWlFsvTrQopTFE4f9F6YHwzKODd8vSFVAxQ0/RsJGJw/MDHwFkiDJhPjZP0fYJKGmxQ
         l7OrJDuZla/6LY36WPqdH4mdqmwLkDeXAxq/Pl7d6GlMBq8B5YZhblKS+8dBVdJr+acQ
         6MrFwEErU7ORMeX7nEs3RHbGsFf7/vc2Epi4PRkZvZO6KQshl0lMXZ/+yshwvEqY49Ct
         9Ns8tnMuTVWF7SuudY11pAuNNwRFOGcjo1cyObrZYggwQCkP0iyeBhAN25+9sXVjXezL
         X/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716414766; x=1717019566;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehrdSpt5mtLpTfCIq95E5iVzEkMf3E73dGjcczuEiG8=;
        b=PFUY3ruihJ3/kHk4z+/ft5lKdHat+i4MRGcN4/Z8o7U1akQqxss2yHl1ZRKmmCSbLx
         4vW+GyjKQm13poWfZyQGtth8x82D4fmzTvTC/Luhg6U2laNb7LaXxOl51wg3XTgqMjQO
         sLRZL7j88yT//cyJVW2apM2BAJ8RWRzx5LxXfi2fYQD7dWt6G7giY6Ho9gn85jJhkwe/
         dZ+QsHn1F0oiwDjmCPqH9L5y9cfTIObhdtA1RBSnfX+/EE2UluTbn+B+Zr54l67gyF2n
         Dpc8eZtErY0GIEx7odzn9L8AXnf0OaksW/bDYRWyezM/FnnGZcu0D3NYJ1bqqhOOy4TS
         nD0A==
X-Gm-Message-State: AOJu0YwC6YGAp3qL4wls0Q/X/DRl5cFZ8kQCG1kjo8U0dwYKCv6SRP3J
	/0zU52uMYISV+GNqdUYIcZicEnrjsmlibrUXVVLy69yt/z7ungacNmUcOw9mOszXs+zEf70NORx
	XbPSe30+9i96I/dNzaW4VkV1uPd9W3D1Pqqc5qbc6+suOqmvq
X-Google-Smtp-Source: AGHT+IFnHCqMi3oZyJqEAkRO4fQ+e/2ynmelZVo+teimqoMvPxfnQthrESc6ldeopyadCkX0IHEL3B9xjw+90b81Zc0=
X-Received: by 2002:adf:f4c8:0:b0:354:f444:c21e with SMTP id
 ffacd0b85a97d-354f444c62fmr1240828f8f.22.1716414765805; Wed, 22 May 2024
 14:52:45 -0700 (PDT)
MIME-Version: 1.0
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 22 May 2024 15:52:34 -0600
Message-ID: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
Subject: breakages in go recipes
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006750fc061911f40e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 21:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8737

--0000000000006750fc061911f40e
Content-Type: text/plain; charset="UTF-8"

Hi,

In our CI builds for multiple projects using meta-virtualization master
branch, we are
seeing some build failures for some recipes that use GO:

* go-md2man
* runc-opencontainers
* docker-moby
* podman
* buildah
* cni

I think I've narrowed the breakages down to this commit to oe-core from
Richard Purdie:

* https://lists.openembedded.org/g/openembedded-core/message/199614

The fixes for our builds seem simple enough. Just add
';destsuffix=${GO_SRCURI_DESTSUFFIX}'
to the SRC_URI. For example:

---

diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/
go-md2man_git.bb
index 1d96bb1b..73d8d167 100644
--- a/recipes-devtools/go/go-md2man_git.bb
+++ b/recipes-devtools/go/go-md2man_git.bb
@@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"
 GO_IMPORT = "github.com/cpuguy83/go-md2man"
 #GO_INSTALL = "${GO_IMPORT}/bin/go-md2man"

-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https"
+SRC_URI =
"git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"

 SRCREV = "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
 PV = "1.0.10+git"

---

I plan to finish my testing for our breakages and submit some patches, but
it feels like there are many
more recipes that will need this change made (basically anything that is
using 'inherit go').

I'm a bit reluctant to submit patches for recipes we are not using (and
testing) even if they seem like
mechanical changes, but I wanted to let the list know what I have found.

Ted Roth

--0000000000006750fc061911f40e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>In our CI builds for mul=
tiple projects using meta-virtualization master branch, we are</div><div>se=
eing some build failures for some recipes that use GO:<br><br></div><div>* =
go-md2man<br></div><div>* runc-opencontainers<br></div><div>* docker-moby</=
div><div>* podman</div><div>* buildah</div><div>* cni<br></div><div><br></d=
iv><div>I think I&#39;ve narrowed the breakages down to this commit to oe-c=
ore from Richard Purdie:<br><br>* <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/199614" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/199614</a><br><br></div><div>The fix=
es for our builds seem simple enough. Just add &#39;;destsuffix=3D${GO_SRCU=
RI_DESTSUFFIX}&#39;</div><div>to the SRC_URI. For example:<br></div><div><b=
r></div><div>---</div><div><br></div><div>diff --git a/recipes-devtools/go/=
<a href=3D"http://go-md2man_git.bb" target=3D"_blank">go-md2man_git.bb</a> =
b/recipes-devtools/go/<a href=3D"http://go-md2man_git.bb" target=3D"_blank"=
>go-md2man_git.bb</a><br>index 1d96bb1b..73d8d167 100644<br>--- a/recipes-d=
evtools/go/<a href=3D"http://go-md2man_git.bb" target=3D"_blank">go-md2man_=
git.bb</a><br>+++ b/recipes-devtools/go/<a href=3D"http://go-md2man_git.bb"=
 target=3D"_blank">go-md2man_git.bb</a><br>@@ -9,7 +9,7 @@ BBCLASSEXTEND =
=3D &quot;native&quot;<br>=C2=A0GO_IMPORT =3D &quot;<a href=3D"http://githu=
b.com/cpuguy83/go-md2man" target=3D"_blank">github.com/cpuguy83/go-md2man</=
a>&quot;<br>=C2=A0#GO_INSTALL =3D &quot;${GO_IMPORT}/bin/go-md2man&quot;<br=
><br>-SRC_URI =3D &quot;git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dh=
ttps&quot;<br>+SRC_URI =3D &quot;git://${GO_IMPORT}.git;branch=3Dmaster;pro=
tocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}&quot;<br><br>=C2=A0SRCRE=
V =3D &quot;f79a8a8ca69da163eee19ab442bedad7a35bba5a&quot;<br>=C2=A0PV =3D =
&quot;1.0.10+git&quot;</div><div><br></div><div>---</div><div><br></div><di=
v>I plan to finish my testing for our breakages and submit some patches, bu=
t it feels like there are many</div><div>more recipes that will need this c=
hange made (basically anything that is using &#39;inherit go&#39;).</div><d=
iv><br></div><div>I&#39;m a bit reluctant to submit patches for recipes we =
are not using (and testing) even if they seem like</div><div>mechanical cha=
nges, but I wanted to let the list know what I have found.</div><div><br></=
div><div>Ted Roth<br></div></div>

--0000000000006750fc061911f40e--

