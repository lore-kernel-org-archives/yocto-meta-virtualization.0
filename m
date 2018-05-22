Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A389E00903; Mon, 21 May 2018 19:10:49 -0700 (PDT)
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
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBB44E0086B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:10:47 -0700 (PDT)
Received: by mail-lf0-f41.google.com with SMTP id x145-v6so14708607lff.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=104lKgBKgvyTkJEaDaebRPJJSMutOl3W6KtfPh5kMQ4=;
	b=aDZqr0zKzS8fdVEQghCpksHhx2+DiySA6EEwnNAQViG9CCxe9li87EPf/RJjSoSmjp
	F1QDFPaP/uz5uIBtHl4b9Trt2MFeC7IhvND76Au8derzdXUbZkhUgcK7/NEGHjoFQLw6
	aPr/cg4lw4E4XGX7eHs5giLnzyfSg3LnRPyteDeg+kNHNXY3cA1CZ7Du43jTeVzfg+c3
	TU2iqU6QYGExk+Fi3tEBWCqR0qEYHs4PGWmOtewN5F30ceQS4Jpx0xCzs/LYEt1jHFLw
	1X1Ua8qzXV37T8W4b0JMDvJ+hc2II7wbQtst6iWTm4D4DfNKb0N7NZaE/OMYUKbBEW4S
	o8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=104lKgBKgvyTkJEaDaebRPJJSMutOl3W6KtfPh5kMQ4=;
	b=eqYg4SAwVPoGssxHFlKFRI1Y79DEbeXBQwRxkkh4eVj5egr8RAz9v2WNcjAH+3H/z3
	mFimp4KSQwSbHF2JuS8bPyZh9s6qtSzW1UQD3+ZeTRfs+FbbJPm977qcY7LnFjU+bST+
	I8PkG/9qcA+XcGzswlfEYTkAtLpA5hpVcMeFFi9Sld8XQcP5L2XL16rfc+cHUwbKOgka
	wUlxioGUUEiu9U/Apvpmc1bExgVubcaliuQWHx/pZ8xDr8mltHZU2Xvwhg7r/GIOATwm
	QX4cAA7utaLvyoDCsPtRsSUeTOGb17vP9IYfftQFNJArFr843MAIY2TaApJcFrys8s3T
	FKnw==
X-Gm-Message-State: ALKqPwewWtoVwrNVo96cB5YNCsauEN4mLj/70i1TyYnowbjnO39Jf2NF
	Yw2lSwMXK/lJk6sZiSZH9XZoAw0Bj2wXiYvZ0tE=
X-Google-Smtp-Source: AB8JxZpU6U0hSg9YT88zoZzlaAUC+NYzfSlm3SIXU5pjATvKdqZu0qdhCctE4KVtmbQj2uaOY30weHdySmpJIStFxZ0=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr13217598ljh.142.1526955046545; 
	Mon, 21 May 2018 19:10:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Mon, 21 May 2018 19:10:46 -0700 (PDT)
In-Reply-To: <1526931357-7652-1-git-send-email-jpuhlman@mvista.com>
References: <1526931357-7652-1-git-send-email-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 May 2018 22:10:46 -0400
Message-ID: <CADkTA4MHZt3WJDw57WwGOq5Zb=Qpa3rVVQOiSwo70PByq7VJmw@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] Add LAYERSERIES_COMPAT
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
X-List-Received-Date: Tue, 22 May 2018 02:10:49 -0000
Content-Type: multipart/alternative; boundary="000000000000232f12056cc1ed47"

--000000000000232f12056cc1ed47
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, May 21, 2018 at 3:35 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  conf/layer.conf                                       | 1 +
>  meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
>  meta-openstack-compute-deploy/conf/layer.conf         | 1 +
>  meta-openstack-compute-test-config/conf/layer.conf    | 1 +
>  meta-openstack-controller-deploy/conf/layer.conf      | 1 +
>  meta-openstack-controller-test-config/conf/layer.conf | 1 +
>  meta-openstack-qemu/conf/layer.conf                   | 1 +
>  meta-openstack-swift-deploy/conf/layer.conf           | 1 +
>  meta-openstack/conf/layer.conf                        | 2 +-
>  9 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b30a99f..f69e8b1 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "cloud-services-layer"
>  BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_cloud-services-layer = "5"
> +LAYERSERIES_COMPAT_cloud-services-layer = "sumo"
> diff --git a/meta-openstack-aio-deploy/conf/layer.conf
> b/meta-openstack-aio-deploy/conf/layer.conf
> index 154a98d..6d256c4 100644
> --- a/meta-openstack-aio-deploy/conf/layer.conf
> +++ b/meta-openstack-aio-deploy/conf/layer.conf
> @@ -7,4 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
>  BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
> -
> +LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "sumo"
> diff --git a/meta-openstack-compute-deploy/conf/layer.conf
> b/meta-openstack-compute-deploy/conf/layer.conf
> index 44a035b..91a83e6 100644
> --- a/meta-openstack-compute-deploy/conf/layer.conf
> +++ b/meta-openstack-compute-deploy/conf/layer.conf
> @@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
>  BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
> +LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "sumo"
> diff --git a/meta-openstack-compute-test-config/conf/layer.conf
> b/meta-openstack-compute-test-config/conf/layer.conf
> index f3b7bcb..bc070d8 100644
> --- a/meta-openstack-compute-test-config/conf/layer.conf
> +++ b/meta-openstack-compute-test-config/conf/layer.conf
> @@ -8,3 +8,4 @@ BBFILE_COLLECTIONS += "openstack-compute-test-
> config-layer"
>  BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
>  # We want this layer to have higher priority than any other
> meta-openstack layers
>  BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
> +LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "sumo"
> diff --git a/meta-openstack-controller-deploy/conf/layer.conf
> b/meta-openstack-controller-deploy/conf/layer.conf
> index de8f435..a2c9d16 100644
> --- a/meta-openstack-controller-deploy/conf/layer.conf
> +++ b/meta-openstack-controller-deploy/conf/layer.conf
> @@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
>  BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
> +LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "sumo"
> diff --git a/meta-openstack-controller-test-config/conf/layer.conf
> b/meta-openstack-controller-test-config/conf/layer.conf
> index 8a6cfcb..dcae15d 100644
> --- a/meta-openstack-controller-test-config/conf/layer.conf
> +++ b/meta-openstack-controller-test-config/conf/layer.conf
> @@ -8,3 +8,4 @@ BBFILE_COLLECTIONS += "openstack-controller-test-
> config-layer"
>  BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
>  # We want this layer to have higher priority than any other
> meta-openstack layers
>  BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
> +LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "sumo"
> diff --git a/meta-openstack-qemu/conf/layer.conf
> b/meta-openstack-qemu/conf/layer.conf
> index 6761143..b6d45ba 100644
> --- a/meta-openstack-qemu/conf/layer.conf
> +++ b/meta-openstack-qemu/conf/layer.conf
> @@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-qemu-layer"
>  BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-qemu-layer = "6"
> +LAYERSERIES_COMPAT_openstack-qemu-layer = "sumo"
> diff --git a/meta-openstack-swift-deploy/conf/layer.conf
> b/meta-openstack-swift-deploy/conf/layer.conf
> index 45f9ee8..d021fcc 100644
> --- a/meta-openstack-swift-deploy/conf/layer.conf
> +++ b/meta-openstack-swift-deploy/conf/layer.conf
> @@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
>  BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
> +LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "sumo"
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.
> conf
> index 2565b92..f9443e2 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-layer"
>  BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-layer = "5"
> -
> +LAYERSERIES_COMPAT_openstack-layer = "sumo"
>  BB_DANGLINGAPPENDS_WARNONLY ?= "true"
>
>  # pre 0.4.0 greenlet versions segfault python
> --
> 2.6.2
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

--000000000000232f12056cc1ed47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Mon, May 21, 2018 at 3:35 PM, Jeremy=
 Puhlman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman@mvista.com" targe=
t=3D"_blank">jpuhlman@mvista.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"gmail-">From: &quot;Jeremy A. Puhlman&quot; &l=
t;<a href=3D"mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>&gt;<br>
<br>
</span>Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.=
com">jpuhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-openstack-aio-deploy/<wbr>conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-openstack-compute-deploy/<wbr>conf/layer.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-openstack-compute-test-<wbr>config/conf/layer.conf=C2=A0 =C2=A0 =
| 1 +<br>
=C2=A0meta-openstack-controller-<wbr>deploy/conf/layer.conf=C2=A0 =C2=A0 =
=C2=A0 | 1 +<br>
=C2=A0meta-openstack-controller-<wbr>test-config/conf/layer.conf | 1 +<br>
=C2=A0meta-openstack-qemu/conf/<wbr>layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-openstack-swift-deploy/<wbr>conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-openstack/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A09 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index b30a99f..f69e8b1 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -7,3 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;cloud-services-layer&quot;<br>
=C2=A0BBFILE_PATTERN_cloud-services-<wbr>layer :=3D &quot;^${LAYERDIR}/&quo=
t;<br>
=C2=A0BBFILE_PRIORITY_cloud-<wbr>services-layer =3D &quot;5&quot;<br>
+LAYERSERIES_COMPAT_cloud-<wbr>services-layer =3D &quot;sumo&quot;<br>
diff --git a/meta-openstack-aio-deploy/<wbr>conf/layer.conf b/meta-openstac=
k-aio-deploy/<wbr>conf/layer.conf<br>
index 154a98d..6d256c4 100644<br>
--- a/meta-openstack-aio-deploy/<wbr>conf/layer.conf<br>
+++ b/meta-openstack-aio-deploy/<wbr>conf/layer.conf<br>
@@ -7,4 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-aio-deploy-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-aio-<wbr>deploy-layer :=3D &quot;^${LAYERDIR=
}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-aio-<wbr>deploy-layer =3D &quot;6&quot;<br>
-<br>
+LAYERSERIES_COMPAT_openstack-<wbr>aio-deploy-layer =3D &quot;sumo&quot;<br=
>
diff --git a/meta-openstack-compute-<wbr>deploy/conf/layer.conf b/meta-open=
stack-compute-<wbr>deploy/conf/layer.conf<br>
index 44a035b..91a83e6 100644<br>
--- a/meta-openstack-compute-<wbr>deploy/conf/layer.conf<br>
+++ b/meta-openstack-compute-<wbr>deploy/conf/layer.conf<br>
@@ -7,3 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-compute-deploy-<wbr>layer&quo=
t;<br>
=C2=A0BBFILE_PATTERN_openstack-<wbr>compute-deploy-layer :=3D &quot;^${LAYE=
RDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>compute-deploy-layer =3D &quot;6&quot;=
<br>
+LAYERSERIES_COMPAT_openstack-<wbr>compute-deploy-layer =3D &quot;sumo&quot=
;<br>
diff --git a/meta-openstack-compute-test-<wbr>config/conf/layer.conf b/meta=
-openstack-compute-test-<wbr>config/conf/layer.conf<br>
index f3b7bcb..bc070d8 100644<br>
--- a/meta-openstack-compute-test-<wbr>config/conf/layer.conf<br>
+++ b/meta-openstack-compute-test-<wbr>config/conf/layer.conf<br>
@@ -8,3 +8,4 @@ BBFILE_COLLECTIONS +=3D &quot;openstack-compute-test-<wbr>c=
onfig-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-<wbr>compute-test-config-layer :=3D &quot;^$=
{LAYERDIR}/&quot;<br>
=C2=A0# We want this layer to have higher priority than any other meta-open=
stack layers<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>compute-test-config-layer =3D &quot;10=
0&quot;<br>
+LAYERSERIES_COMPAT_openstack-<wbr>compute-test-config-layer =3D &quot;sumo=
&quot;<br>
diff --git a/meta-openstack-controller-<wbr>deploy/conf/layer.conf b/meta-o=
penstack-controller-<wbr>deploy/conf/layer.conf<br>
index de8f435..a2c9d16 100644<br>
--- a/meta-openstack-controller-<wbr>deploy/conf/layer.conf<br>
+++ b/meta-openstack-controller-<wbr>deploy/conf/layer.conf<br>
@@ -7,3 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-controller-deploy-<wbr>layer&=
quot;<br>
=C2=A0BBFILE_PATTERN_openstack-<wbr>controller-deploy-layer :=3D &quot;^${L=
AYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>controller-deploy-layer =3D &quot;6&qu=
ot;<br>
+LAYERSERIES_COMPAT_openstack-<wbr>controller-deploy-layer =3D &quot;sumo&q=
uot;<br>
diff --git a/meta-openstack-controller-<wbr>test-config/conf/layer.conf b/m=
eta-openstack-controller-<wbr>test-config/conf/layer.conf<br>
index 8a6cfcb..dcae15d 100644<br>
--- a/meta-openstack-controller-<wbr>test-config/conf/layer.conf<br>
+++ b/meta-openstack-controller-<wbr>test-config/conf/layer.conf<br>
@@ -8,3 +8,4 @@ BBFILE_COLLECTIONS +=3D &quot;openstack-controller-test-<wb=
r>config-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-<wbr>controller-test-config-layer :=3D &quot=
;^${LAYERDIR}/&quot;<br>
=C2=A0# We want this layer to have higher priority than any other meta-open=
stack layers<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>controller-test-config-layer =3D &quot=
;100&quot;<br>
+LAYERSERIES_COMPAT_openstack-<wbr>controller-test-config-layer =3D &quot;s=
umo&quot;<br>
diff --git a/meta-openstack-qemu/conf/<wbr>layer.conf b/meta-openstack-qemu=
/conf/<wbr>layer.conf<br>
index 6761143..b6d45ba 100644<br>
--- a/meta-openstack-qemu/conf/<wbr>layer.conf<br>
+++ b/meta-openstack-qemu/conf/<wbr>layer.conf<br>
@@ -7,3 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-qemu-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-qemu-<wbr>layer :=3D &quot;^${LAYERDIR}/&quo=
t;<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>qemu-layer =3D &quot;6&quot;<br>
+LAYERSERIES_COMPAT_openstack-<wbr>qemu-layer =3D &quot;sumo&quot;<br>
diff --git a/meta-openstack-swift-deploy/<wbr>conf/layer.conf b/meta-openst=
ack-swift-deploy/<wbr>conf/layer.conf<br>
index 45f9ee8..d021fcc 100644<br>
--- a/meta-openstack-swift-deploy/<wbr>conf/layer.conf<br>
+++ b/meta-openstack-swift-deploy/<wbr>conf/layer.conf<br>
@@ -7,3 +7,4 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-swift-deploy-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-<wbr>swift-deploy-layer :=3D &quot;^${LAYERD=
IR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>swift-deploy-layer =3D &quot;6&quot;<b=
r>
+LAYERSERIES_COMPAT_openstack-<wbr>swift-deploy-layer =3D &quot;sumo&quot;<=
br>
diff --git a/meta-openstack/conf/layer.<wbr>conf b/meta-openstack/conf/laye=
r.<wbr>conf<br>
index 2565b92..f9443e2 100644<br>
--- a/meta-openstack/conf/layer.<wbr>conf<br>
+++ b/meta-openstack/conf/layer.<wbr>conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.<wbr>bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-layer :=3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-<wbr>layer =3D &quot;5&quot;<br>
-<br>
+LAYERSERIES_COMPAT_openstack-<wbr>layer =3D &quot;sumo&quot;<br>
=C2=A0BB_DANGLINGAPPENDS_WARNONLY ?=3D &quot;true&quot;<br>
<br>
=C2=A0# pre 0.4.0 greenlet versions segfault python<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
2.6.2<br>
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
</div></div></div>

--000000000000232f12056cc1ed47--
