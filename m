Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.2537.1582233965970050956
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 13:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=by08wbgJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: hnathan918@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id k24so52889ioc.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2020 13:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=emuSBrsz9DU9rtP40S3npGjHmOyxPm69MV2q+XPIG3M=;
        b=by08wbgJ6PJP/3TRYFiIrsLl6YA+Bf1Cb+1ggFJ0LFT+gFB0FDOjUV1GBcap2DtJQ5
         M7MU5IlRs5ee2b7rcoVC1SCRYDNNaGp5peY8j57ho7nXtJYOoJzEVetaPWQK9fokv+aX
         wBB9Ygyom2UBcmNv7pt2gl+hb5hJZrT0XQHzO8nszWGILPzb9O7u5Ww05c9rkFwkUIkb
         F6Cr6AQ6AFpMuoS60nuKnt5zNGTrR/1PzEd2c50baksdwpYRDDmLdodGEtbjdd2J6scj
         94qqESplZd118clxovNp/CBSQ6yzeymLtP20qAJcBNjX83C20VccbRNWaRhM5D1lX/m5
         LZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=emuSBrsz9DU9rtP40S3npGjHmOyxPm69MV2q+XPIG3M=;
        b=QJFwKqClkpQRqBD5leES6wbR1hgwgYOA6hvbVzIXIyriP9nTN92mzCx/tmRCkhMsIv
         CPRYgZ5pSsDBPzYLmFf/k0f2/nP3gXQBSCmWxu9/+5ZQC67KIx6lA1MIbwLjOloLri/6
         3XWG0CJ0UTbETAMIvwsnzSb4d4K67gpVKItJH6HaS9pgCQICGcgYjjZoOBNBT2awgo5J
         iyAuMgliZ80t5/TbGmPkkI3AUCdeWQvStdcSJ+O2bEqeYvBMpg1a3CgaWfjhBWzEy8Pt
         idWUYUeIAGXppEfp27hHLsb0rQe1zrpYR6cI6mRFFbMcHkj02PKF2rPCGM/A//EK5LXD
         hIMw==
X-Gm-Message-State: APjAAAUO8zXSqm0Xsp9XtdCS/4mAfM9HzeKxCbDIMjKHfj5TmHRPOXfm
	6igbt+Apwb6fkLeYU7NPaC7wmf8MTB0gW/TLpzjz7tml9emrUw==
X-Google-Smtp-Source: APXvYqzIYrw9Egyntm44VeBztfgrV1+EUQTyTKXIa7pPn7v1nsQUKBLIsUsQ0MUniiw7JU/PFCRMc+AuY3K2pMFeN3s=
X-Received: by 2002:a6b:92d4:: with SMTP id u203mr26608914iod.288.1582233964997;
 Thu, 20 Feb 2020 13:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20200220195806.173460-1-hnathan918@gmail.com>
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
From: "Nathan Hartman" <hnathan918@gmail.com>
Date: Thu, 20 Feb 2020 16:25:47 -0500
Message-ID: <CAFZcBMHKsD-LzbTA3R4Y53T+3wb5Ze3wyaacwx+QoaG5Fjgw=g@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH 0/8] Added Fluentd and dependencies
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006f6e2c059f088dec"

--0000000000006f6e2c059f088dec
Content-Type: text/plain; charset="UTF-8"

This series adds recipes for Fluentd and it's Ruby dependencies. Fluentd is
a data collector and log shipper employed by several cloud services. I'm
submitting the Ruby dependencies to m-c-s as the original meta-ruby layer
from meta-openembedded was removed.

Regards,
Nathan.


 meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-check-for-concurrent_ruby.jar.patch
| 26 ++++++++++++++++++++++++++
 meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
| 12 ++++++++++++
 meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
| 12 ++++++++++++
 meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
| 19 +++++++++++++++++++
 meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
| 22 ++++++++++++++++++++++
 meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
| 12 ++++++++++++
 meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
| 13 +++++++++++++
 meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
| 11 +++++++++++
 meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
| 13 +++++++++++++
 meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
| 11 +++++++++++
 meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
| 13 +++++++++++++
 meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
| 11 +++++++++++
 meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
| 26 --------------------------
 13 files changed, 175 insertions(+), 26 deletions(-)



On Thu, 20 Feb 2020 at 14:58, Nathan Hartman <hnathan918@gmail.com> wrote:

> Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
> ---
>  .../recipes-devtools/ruby/yajl-ruby_1.4.0.bb  | 11 ++++++++
>  .../recipes-devtools/ruby/yajl-ruby_git.bb    | 26 -------------------
>  2 files changed, 11 insertions(+), 26 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/ruby/
> yajl-ruby_1.4.0.bb
>  delete mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> new file mode 100644
> index 0000000..4393476
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "A streaming JSON parsing and encoding library for Ruby (C
> bindings to yajl)"
> +HOMEPAGE = "http://rdoc.info/projects/brianmario/yajl-ruby"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7dbd3a9f471247a243db5b62fe091587"
> +
> +SRC_URI = "git://
> github.com/brianmario/yajl-ruby.git;protocol=https;tag=1.4.0"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit ruby
> diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
> b/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
> deleted file mode 100644
> index 9d8ba54..0000000
> --- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -SUMMARY = "C binding to the excellent YAJL JSON parsing and generation
> library."
> -DESCRIPTION = "This gem is a C binding to the excellent YAJL JSON \
> -parsing and generation library."
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
> "file://MIT-LICENSE;md5=7edc7ac9885163399dacc69a54b1dc3a"
> -
> -PR = "r0"
> -
> -BPV = "1.2.1"
> -PV = "${BPV}"
> -SRCREV = "d8a0b8d5c879b0810b43eaab241fb87b68c93453"
> -
> -S = "${WORKDIR}/git"
> -
> -SRC_URI = " \
> -    git://github.com/brianmario/yajl-ruby.git \
> -    file://0001-Don-t-compile-extensions.patch \
> -    "
> -
> -inherit ruby
> -
> -BBCLASSEXTEND = "native"
> --
> 2.17.1
>
>

--0000000000006f6e2c059f088dec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>This series adds recipes for Fluentd a=
nd it&#39;s Ruby dependencies.=20
Fluentd is a data collector and log shipper employed by several cloud servi=
ces. I&#39;m submitting the Ruby dependencies to m-c-s as the original meta=
-ruby layer from meta-openembedded was removed.</p>
<p>Regards,<br>
Nathan.</p>
<p><br>
</p>
<p>=C2=A0meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-=
check-for-concurrent_ruby.jar.patch
 | 26 ++++++++++++++++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://concurrent-rub=
y_1.1.6.bb">concurrent-ruby_1.1.6.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++=
<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://cool.io_1.6.0.=
bb">cool.io_1.6.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12 ++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://fluentd_1.9.2.=
bb">fluentd_1.9.2.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 19 +++++++++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://http-parser.rb=
_0.6.0.bb">http-parser.rb_0.6.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 | 22 ++++++++++++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://msgpack_1.3.3.=
bb">msgpack_1.3.3.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12 ++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://serverengine_2=
.2.1.bb">serverengine_2.2.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 =
+++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://sigdump_0.2.4.=
bb">sigdump_0.2.4.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 11 +++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://strptime_0.2.3=
.bb">strptime_0.2.3.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 13 +++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://tzinfo-data_1.=
2019.3.bb">tzinfo-data_1.2019.3.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++=
++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://tzinfo_2.0.1.b=
b">tzinfo_2.0.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 13 +++++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_1.4.=
0.bb">yajl-ruby_1.4.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 11 +++++++++++<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_git.=
bb">yajl-ruby_git.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
 | 26 --------------------------<br>
=C2=A013 files changed, 175 insertions(+), 26 deletions(-)<br>
  <br>
</p>
<p><br>
</p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 20 Feb 2020 at 14:58, Nathan Hartman &lt;<a href=3D"mailto:hnat=
han918@gmail.com">hnathan918@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Signed-off-by: Nathan Hartman &lt;<a =
href=3D"mailto:hnathan918@gmail.com" target=3D"_blank">hnathan918@gmail.com=
</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/ruby/<a href=3D"http://yajl-ruby_1.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">yajl-ruby_1.4.0.bb</a>=C2=A0 | 11 +++++++=
+<br>
=C2=A0.../recipes-devtools/ruby/<a href=3D"http://yajl-ruby_git.bb" rel=3D"=
noreferrer" target=3D"_blank">yajl-ruby_git.bb</a>=C2=A0 =C2=A0 | 26 ------=
-------------<br>
=C2=A02 files changed, 11 insertions(+), 26 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/ruby/<a href=3D"ht=
tp://yajl-ruby_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_1.4=
.0.bb</a><br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/ruby/<a href=3D"ht=
tp://yajl-ruby_git.bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_git.b=
b</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ru=
by_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_1.4.0.bb</a> b/=
meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_1.4.0.bb" =
rel=3D"noreferrer" target=3D"_blank">yajl-ruby_1.4.0.bb</a><br>
new file mode 100644<br>
index 0000000..4393476<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_1.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_1.4.0.bb</a><br>
@@ -0,0 +1,11 @@<br>
+SUMMARY =3D &quot;A streaming JSON parsing and encoding library for Ruby (=
C bindings to yajl)&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://rdoc.info/projects/brianmario/yajl-ru=
by" rel=3D"noreferrer" target=3D"_blank">http://rdoc.info/projects/brianmar=
io/yajl-ruby</a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7dbd3a9f471247a243db5b62fe=
091587&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/brianmario/yajl-ruby.=
git;protocol=3Dhttps;tag=3D1.4.0" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/brianmario/yajl-ruby.git;protocol=3Dhttps;tag=3D1.4.0</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit ruby<br>
diff --git a/meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ru=
by_git.bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_git.bb</a> b/meta=
-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_git.bb" rel=3D=
"noreferrer" target=3D"_blank">yajl-ruby_git.bb</a><br>
deleted file mode 100644<br>
index 9d8ba54..0000000<br>
--- a/meta-openstack/recipes-devtools/ruby/<a href=3D"http://yajl-ruby_git.=
bb" rel=3D"noreferrer" target=3D"_blank">yajl-ruby_git.bb</a><br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-#<br>
-# Copyright (C) 2014 Wind River Systems, Inc.<br>
-#<br>
-SUMMARY =3D &quot;C binding to the excellent YAJL JSON parsing and generat=
ion library.&quot;<br>
-DESCRIPTION =3D &quot;This gem is a C binding to the excellent YAJL JSON \=
<br>
-parsing and generation library.&quot;<br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://MIT-LICENSE;md5=3D7edc7ac9885163399dacc6=
9a54b1dc3a&quot;<br>
-<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-BPV =3D &quot;1.2.1&quot;<br>
-PV =3D &quot;${BPV}&quot;<br>
-SRCREV =3D &quot;d8a0b8d5c879b0810b43eaab241fb87b68c93453&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/brianmario/yajl-ruby.git"=
 rel=3D"noreferrer" target=3D"_blank">github.com/brianmario/yajl-ruby.git</=
a> \<br>
-=C2=A0 =C2=A0 file://0001-Don-t-compile-extensions.patch \<br>
-=C2=A0 =C2=A0 &quot;<br>
-<br>
-inherit ruby<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000006f6e2c059f088dec--
