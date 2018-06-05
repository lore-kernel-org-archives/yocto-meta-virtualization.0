Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A9EDE01775; Tue,  5 Jun 2018 09:03:19 -0700 (PDT)
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
	*      [209.85.215.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27263E01773
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jun 2018 09:03:18 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id n15-v6so4412135lfn.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jun 2018 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IMIamOZM5XoZmt4RGZqktb720m8KDMV77EethZvlaG8=;
	b=Uqq3Y28DBEQ3H3uG/kLEFqTUXpCh8NXSbv0uMHY2vbqicX766300snwp3pVEFa0tBt
	18+uPwMhKciNnNnN8eEYlNSByKyiObDaktvS7cowUnJy21uK5OLDf1vJE6YRFEY7qhWb
	LCaXhT2zQD1cmOeWtAqzi7rObeHH/oDxeYj89Sm/zoct1ZKesocsV6s4aq+tszmq4YPL
	IAiuL882WNLjG2tPordKeTg9AQ2FsPxlV34KTfvSy7rr4BAhpwHrQGVvBD6yuncFiGe4
	klo7jCAg8kkOBB9O4AQHdA2iIoO5m18l+fo26kUPAy/jmfjYZJ6HyESPy6r8dluZ5sdW
	eqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IMIamOZM5XoZmt4RGZqktb720m8KDMV77EethZvlaG8=;
	b=AWkrCX6tdpL3xvyq9Ey9muT5veXyLBNBHlR0jCkSf0jVubp4Es6WFdAbc06I3QH8MV
	qFfYCgUIRm0NgQ5+CVNkS6XRsBKYGFTRFn7jpuUFQCteu6eafPuu/yLclWK6AroDIZLW
	pz5+kqIphEJ0S8u/3h9DNADHwrUPOoAtb8ipLMOFrQb62H6L5yDnQGTORK8HHP9QiSYZ
	KfA2PK05vg57odKSwysjVOlyMpjGSDCqN3PNNTNnP8WATqvXTJGUtQX7WoeSn6YPJ67n
	FJCETfwg7nyZHVM0CADT9MmGMRllpsRsH6TiYXYbXxIGMhgcaef0nX+MxyUwyS9i1JNg
	zvpA==
X-Gm-Message-State: APt69E3OZmToGWRBZczQc6NS+agZa5h+M7dYZ99N1BX5yVGa5eYZoaNv
	CTLzndDGhM/Avd90IHgHwapve1v+uIJYphhuDmmBZw==
X-Google-Smtp-Source: ADUXVKJD1B0pm64b/Mem20wQYiEowUzhv5PelzQr6ypIC9nuCPRwBQH8UwCYvuMG2k6w3t+0SCilf5Y4RcexLy+EZKA=
X-Received: by 2002:a19:54da:: with SMTP id b87-v6mr1919450lfl.3.1528214597061;
	Tue, 05 Jun 2018 09:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 09:03:16 -0700 (PDT)
In-Reply-To: <1527356442-65040-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1527356442-65040-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Jun 2018 12:03:16 -0400
Message-ID: <CADkTA4OYZ59BymEhgcDUk+zHGqoYvxxiHBNVP1WCCKx3LyR98w@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH 1/2] Added python-pbr-native into DEPENDS to fix build error.
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
X-List-Received-Date: Tue, 05 Jun 2018 16:03:19 -0000
Content-Type: multipart/alternative; boundary="00000000000032d6f6056de730c1"

--00000000000032d6f6056de730c1
Content-Type: text/plain; charset="UTF-8"

All the pbr related patches should be merged now.

Let me know if I've missed any.

Bruce

On Sat, May 26, 2018 at 1:40 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-keystonemiddleware_git.bb         | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-oslo.db_git.bb         | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb    | 5
> +++++
>  meta-openstack/recipes-devtools/python/python-troveclient_git.bb     | 5
> +++++
>  4 files changed, 20 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-
> keystonemiddleware_git.bb
> index 7b7cb91..557a557 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> keystonemiddleware_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-
> keystonemiddleware_git.bb
> @@ -21,6 +21,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>          python-keystoneauth1 \
>          python-oslo.config \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
> b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
> index 53df106..d693570 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
> @@ -19,6 +19,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>         python-six \
>         python-alembic \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.
> reports_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.
> reports_git.bb
> index fd32326..2db5aae 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
> @@ -19,6 +19,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-
> troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> troveclient_git.bb
> index 251d9e0..95ec5ae 100644
> --- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> @@ -72,6 +72,11 @@ RDEPENDS_${SRCNAME} += " \
>      ${SRCNAME}-bin \
>      "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${SRCNAME}-bin += " \
>      ${PN} \
>      "
> --
> 1.9.1
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

--00000000000032d6f6056de730c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All the pbr related patches should be merged now.<div><br>=
</div><div>Let me know if I&#39;ve missed any.</div><div><br></div><div>Bru=
ce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Sat, May 26, 2018 at 1:40 PM, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Lei =
Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu=
.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-keystonemiddlewa=
re_git.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-keystonemiddlew=
are_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.db_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>db_gi=
t.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.reports_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>=
reports_git.bb</a>=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
troveclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>trovec=
lient_git.bb</a>=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A04 files changed, 20 insertions(+)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-keystonemiddleware_git.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on-<wbr>keystonemiddleware_git.bb</a> b/meta-openstack/recipes-<wbr>devtool=
s/python/<a href=3D"http://python-keystonemiddleware_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-<wbr>keystonemiddleware_git.bb</a><br>
index 7b7cb91..557a557 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
keystonemiddleware_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>keystonemiddleware_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
keystonemiddleware_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>keystonemiddleware_git.bb</a><br>
@@ -21,6 +21,11 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-keystoneauth1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-oslo.config \<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-oslo.db_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wb=
r>db_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-oslo.db_git.bb" rel=3D"noreferrer" target=3D"_blank">python-osl=
o.<wbr>db_git.bb</a><br>
index 53df106..d693570 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.db_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>db_gi=
t.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.db_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>db_gi=
t.bb</a><br>
@@ -19,6 +19,11 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-alembic \<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-oslo.reports_git.bb" rel=3D"noreferrer" target=3D"_blank">python-osl=
o.<wbr>reports_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a =
href=3D"http://python-oslo.reports_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python-oslo.<wbr>reports_git.bb</a><br>
index fd32326..2db5aae 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.reports_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>=
reports_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
oslo.reports_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.<wbr>=
reports_git.bb</a><br>
@@ -19,6 +19,11 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0# RDEPENDS_default: <br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-troveclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>troveclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a hr=
ef=3D"http://python-troveclient_git.bb" rel=3D"noreferrer" target=3D"_blank=
">python-<wbr>troveclient_git.bb</a><br>
index 251d9e0..95ec5ae 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
troveclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>trovec=
lient_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
troveclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>trovec=
lient_git.bb</a><br>
@@ -72,6 +72,11 @@ RDEPENDS_${SRCNAME} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${SRCNAME}-bin \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0RDEPENDS_${SRCNAME}-bin +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PN} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
1.9.1<br>
<br>
<br>
<br>
-- <br>
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
</div>

--00000000000032d6f6056de730c1--
