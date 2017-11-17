Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08A05E00CF1; Fri, 17 Nov 2017 08:14:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7D01E00CEC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Nov 2017 08:14:25 -0800 (PST)
Received: by mail-qt0-f171.google.com with SMTP id e19so7287778qte.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Nov 2017 08:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+aU7XtrCdYOzKzcH9qx27lII4DfzYJXQkXxgDFAl6ZA=;
	b=lyswviKqQXABlP7WQ0qHCBBHBdqR9weTRNL5FnNfIMm0uGAbeRMSnZejaXURTarG2U
	6rRjewzyEDoFI8EZMUb3/V2bdGlXFkbSt2Pe+xQmyYJAM+Q8FZN+Vsokf0DwDfW+SBaE
	cAQoX3gzGp8UObYm24F/Q1OIk7Dboi5rRnKYI1c/iOa+4tsaG5RLJZiLJuIzLspGek5S
	c2i5KXq3mVjdyPkReMzUoe5a0jhQn4hBJD5dXoeVSNgtv4gZDJXDLbxcizPK7xYV7Mfc
	rfcimaZHmWIFdqZU9xFVcINcze2QYuTLamHdpmpcIxYTnkowe52UEju4Fd8Gvq3QqGtp
	NV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+aU7XtrCdYOzKzcH9qx27lII4DfzYJXQkXxgDFAl6ZA=;
	b=edqX3zalul83Z94T8/F2c/RghwMlSKH3a+AedFd0PcWWwCsX7ZzQhEbNwW/cYfNpGq
	C3aCNIAF6cLCeuV3DRFUzHn/aCyXZusjeEfcWDT9TepiU1FeUSXFb4tGQE6nsVJi1a5m
	lWMvnhLRRG2GOlzf6m2pJrna6741D9pnEh/zegP/p1+PedrCI/ym2mqBjuJtKeHG7Ohj
	7361/LkE8CH1md6lK7JuvAmBqZLAWekEZmQm9lJDC8sGOmqxpsecTTHWx/Lv7uF6kxpH
	ttmyfcs/tq0H4Yulmy958EUJCADacyJZM22kJJsIfDRASb1oSpvFN1IUaJPc5YiHbT3z
	MXrQ==
X-Gm-Message-State: AJaThX6VwdOibzICm/Ppgtbi3WUiB2mKWeRbSr9OJsA+6LN9DVR2GUkb
	Vd04A5pBncY5X5WFPMwr7vmSQAbMtNDec1uxsKQ=
X-Google-Smtp-Source: AGs4zMZRpONCkkovIy0KRD0K8qkumWm9QhheLmqyV9XeY9MJI0l0SyGR/eHFcmhqXYRvDGpCJJgS8j3mCelVogghPPc=
X-Received: by 10.237.33.130 with SMTP id l2mr9131334qtc.120.1510935264443;
	Fri, 17 Nov 2017 08:14:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 17 Nov 2017 08:14:23 -0800 (PST)
In-Reply-To: <1510820583-62275-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510820583-62275-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Nov 2017 11:14:23 -0500
Message-ID: <CADkTA4Pv99HFTDf-QA5rw=e61Zyjf01+utLOthcS+ZPyrvmRXQ@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-psycopg2: update to 2.7.3.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 16:14:27 -0000
Content-Type: multipart/alternative; boundary="001a113788f8b7405f055e3007ca"

--001a113788f8b7405f055e3007ca
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 3:23 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade python-psycopg2 from 2.6.2 to 2.7.3.2.
>
> 2) Update the remove-pg-config.patch for 2.7.3.2.
>

can we just convert this to the pypi bbclass like Mark has been doing for
the other
python changes ?

Bruce


>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-psycopg2/remove-pg-config.patch  | 29
> +++++++++++-----------
>  ...sycopg2_2.6.2.bb => python-psycopg2_2.7.3.2.bb} |  6 ++---
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.6.2.bb
> => python-psycopg2_2.7.3.2.bb} (60%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> psycopg2/remove-pg-config.patch b/meta-openstack/recipes-
> devtools/python/python-psycopg2/remove-pg-config.patch
> index 37acc30..4a29724 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> psycopg2/remove-pg-config.patch
> +++ b/meta-openstack/recipes-devtools/python/python-
> psycopg2/remove-pg-config.patch
> @@ -1,31 +1,32 @@
> -From 92d42775735d1555449b860c214ca7265d7ad75b Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Tue, 24 Jan 2017 00:43:35 +0900
> -Subject: [PATCH] setup: don't use pg_config
> +Subject: [PATCH] Subject: [PATCH] setup: don't use pg_config
> +
> +Update for psycopg2_2.7.3.2.
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>  Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
> - setup.cfg | 1 +
> + setup.cfg | 2 +-
>   setup.py  | 5 +----
> - 2 files changed, 2 insertions(+), 4 deletions(-)
> + 2 files changed, 2 insertions(+), 5 deletions(-)
>
>  diff --git a/setup.cfg b/setup.cfg
> -index d00ce92..4b45aac 100644
> +index b629abf..64bc1ca 100644
>  --- a/setup.cfg
>  +++ b/setup.cfg
> -@@ -1,5 +1,6 @@
> +@@ -1,6 +1,6 @@
>   [build_ext]
>   define =
> -+pg_config="/bin/true"
> +-pg_config =
> ++pg_config = "/bin/true"
>   use_pydatetime = 1
> + mx_include_dir =
>   have_ssl = 0
> -
>  diff --git a/setup.py b/setup.py
> -index d71d489..b101696 100644
> +index 86f32d2..d805548 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -398,16 +398,13 @@ class psycopg_build_ext(build_ext):
> +@@ -404,16 +404,13 @@ class psycopg_build_ext(build_ext):
>               self.libraries.append("pq")
>
>           try:
> @@ -39,10 +40,10 @@ index d71d489..b101696 100644
>                   pgversion = pg_config_helper.query("version").split()[1]
>               except:
>  -                pgversion = "7.4.0"
> -+                pgversion = "9.4.4"
> ++                pgversion = "9.4.13"
>
>               verre = re.compile(
> -                 r"(\d+)\.(\d+)(?:(?:\.(\d+))|(
> devel|(alpha|beta|rc)\d+))")
> +                 r"(\d+)(?:\.(\d+))?(?:(?:\.(\
> d+))|(devel|(?:alpha|beta|rc)\d+))?")
>  --
>  2.7.4
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> psycopg2_2.6.2.bb b/meta-openstack/recipes-devtools/python/python-
> psycopg2_2.7.3.2.bb
> similarity index 60%
> rename from meta-openstack/recipes-devtools/python/python-
> psycopg2_2.6.2.bb
> rename to meta-openstack/recipes-devtools/python/python-
> psycopg2_2.7.3.2.bb
> index 2cdb138..8f7fd77 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.3.2.bb
> @@ -8,12 +8,12 @@ DEPENDS = "postgresql"
>  PR = "r0"
>  SRCNAME = "psycopg2"
>
> -SRC_URI = "https://pypi.python.org/packages/7b/a8/
> dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc
> /${SRCNAME}-${PV}.tar.gz \
> +SRC_URI = "https://pypi.python.org/packages/dd/47/
> 000b405d73ca22980684fd7bd3318690cc03cfa3b2ae1c5b7fff8050b28a
> /${SRCNAME}-${PV}.tar.gz \
>             file://remove-pg-config.patch \
>            "
>
> -SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
> -SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363
> 335cc8a8cbf7212e3c185431c79ff8c05c"
> +SRC_URI[md5sum] = "8114e672d5f23fa5329874a4314fbd6f"
> +SRC_URI[sha256sum] = "5c3213be557d0468f9df8fe2487eaf
> 2990d9799202c5ff5cb8d394d09fad9b2a"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113788f8b7405f055e3007ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 16, 2017 at 3:23 AM, zhengrq <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1) Upgra=
de python-psycopg2 from 2.6.2 to 2.7.3.2.<br>
<br>
2) Update the remove-pg-config.patch for 2.7.3.2.<br></blockquote><div><br>=
</div><div>can we just convert this to the pypi bbclass like Mark has been =
doing for the other</div><div>python changes ?</div><div><br></div><div>Bru=
ce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-psycopg2/<wbr>remove-pg-config.patch=C2=A0 | 29 +++=
++++++++-----------<br>
=C2=A0...<a href=3D"http://sycopg2_2.6.2.bb" rel=3D"noreferrer" target=3D"_=
blank">sycopg2_2.6.2.bb</a> =3D&gt; <a href=3D"http://python-psycopg2_2.7.3=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python-psycopg2_2.7.3.2.bb</a>}=
 |=C2=A0 6 ++---<br>
=C2=A02 files changed, 18 insertions(+), 17 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-psycopg2_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>psycopg2_2.6.2.bb</a> =3D&gt; <a href=3D"http://python-psycopg2_2.7.3.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python-psycopg2_2.7.3.2.bb</a>} (60%=
)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>psycop=
g2/remove-pg-config.<wbr>patch b/meta-openstack/recipes-<wbr>devtools/pytho=
n/python-<wbr>psycopg2/remove-pg-config.<wbr>patch<br>
index 37acc30..4a29724 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>psycopg2/remo=
ve-pg-config.<wbr>patch<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/python-<wbr>psycopg2/remo=
ve-pg-config.<wbr>patch<br>
@@ -1,31 +1,32 @@<br>
-From 92d42775735d1555449b860c214ca7<wbr>265d7ad75b Mon Sep 17 00:00:00 200=
1<br>
-From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
-Date: Tue, 24 Jan 2017 00:43:35 +0900<br>
-Subject: [PATCH] setup: don&#39;t use pg_config<br>
+Subject: [PATCH] Subject: [PATCH] setup: don&#39;t use pg_config<br>
+<br>
+Update for psycopg2_2.7.3.2.<br>
<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujit=
su.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0---<br>
- setup.cfg | 1 +<br>
+ setup.cfg | 2 +-<br>
=C2=A0 setup.py=C2=A0 | 5 +----<br>
- 2 files changed, 2 insertions(+), 4 deletions(-)<br>
+ 2 files changed, 2 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.cfg b/setup.cfg<br>
-index d00ce92..4b45aac 100644<br>
+index b629abf..64bc1ca 100644<br>
=C2=A0--- a/setup.cfg<br>
=C2=A0+++ b/setup.cfg<br>
-@@ -1,5 +1,6 @@<br>
+@@ -1,6 +1,6 @@<br>
=C2=A0 [build_ext]<br>
=C2=A0 define =3D<br>
-+pg_config=3D&quot;/bin/true&quot;<br>
+-pg_config =3D<br>
++pg_config =3D &quot;/bin/true&quot;<br>
=C2=A0 use_pydatetime =3D 1<br>
+ mx_include_dir =3D<br>
=C2=A0 have_ssl =3D 0<br>
-<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index d71d489..b101696 100644<br>
+index 86f32d2..d805548 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -398,16 +398,13 @@ class psycopg_build_ext(build_ext):<br>
+@@ -404,16 +404,13 @@ class psycopg_build_ext(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.libraries.append(&quo=
t;pq&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
@@ -39,10 +40,10 @@ index d71d489..b101696 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgversion =
=3D pg_config_helper.query(&quot;<wbr>version&quot;).split()[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgversion =
=3D &quot;7.4.0&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgversion =3D &qu=
ot;9.4.4&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgversion =3D &qu=
ot;9.4.13&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verre =3D re.compile(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r&quot;(\d+)=
\.(\d+)(?:(?:\.(\d+))|(<wbr>devel|(alpha|beta|rc)\d+))&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r&quot;(\d+)=
(?:\.(\d+))?(?:(?:\.(\<wbr>d+))|(devel|(?:alpha|beta|rc)\<wbr>d+))?&quot;)<=
br>
=C2=A0--<br>
=C2=A02.7.4<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-psycopg2_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
psycopg2_2.6.2.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-psycopg2_2.7.3.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-<wbr>psycopg2_2.7.3.2.bb</a><br>
similarity index 60%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-psycopg2_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>p=
sycopg2_2.6.2.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-psycopg2_2.7.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>p=
sycopg2_2.7.3.2.bb</a><br>
index 2cdb138..8f7fd77 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
psycopg2_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>psycopg=
2_2.6.2.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
psycopg2_2.7.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>psyco=
pg2_2.7.3.2.bb</a><br>
@@ -8,12 +8,12 @@ DEPENDS =3D &quot;postgresql&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0SRCNAME =3D &quot;psycopg2&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/7b/a8/dc2d50=
a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/${SRCNAME}-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/<wbr>pack=
ages/7b/a8/<wbr>dc2d50a6f37c157459cd18bab381c8<wbr>e6134b9381b50fbe969997b2=
ae7dbc<wbr>/${SRCNAME}-${PV}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/dd/47/000b40=
5d73ca22980684fd7bd3318690cc03cfa3b2ae1c5b7fff8050b28a/${SRCNAME}-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/<wbr>pack=
ages/dd/47/<wbr>000b405d73ca22980684fd7bd33186<wbr>90cc03cfa3b2ae1c5b7fff80=
50b28a<wbr>/${SRCNAME}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-pg-config.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>4a392949ba31a378a18ed3e775a469<wbr>3f&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>70490e12ed9c5c818ecd85d185d363<wbr>335cc=
8a8cbf7212e3c185431c79ff8<wbr>c05c&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8114e672d5f23fa5329874a4314fbd<wbr>6f&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>5c3213be557d0468f9df8fe2487eaf<wbr>2990d=
9799202c5ff5cb8d394d09fad<wbr>9b2a&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a113788f8b7405f055e3007ca--
