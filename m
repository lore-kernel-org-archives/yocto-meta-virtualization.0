Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04072E00DC6; Fri, 17 Jun 2016 05:36:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D19B6E00DB6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Jun 2016 05:36:04 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id u201so13372649oie.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Jun 2016 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ytpwTlq3QoH4EiKQsHObfNy0qRpB1hMBvbyjq0lU5YA=;
	b=nwgjAZc6GWmYC8zrI8hsFY2hbD73suEe6Lws/0/KGx+c1KgtDKH6/9ECfUHZ52fsar
	vKxHx+qaaIq/+1Bqsfvo2Dx/9XhqHLB6QRqHrDZ3ceQFr1aGqhkDOHbNW470ARRNd2Sh
	/4nptaR7mDD4MO2aeQLSf1LCWH9AESV08gtdPlaEgRMt6LgiDMb2Ns1CiiOW+/rdP5qe
	+R2bquHV+HbdF+sjuDMIgh84SZAtwDl4dZD6ZMfCpgncRXDgB4yQBxwqZVGG3l6Ssczm
	/xYnawG6Iq5irB42Z64dfU6FIaj8z0FhVKmr6ywQyUB7yKap3EjkJv65VLqeylMlUhDN
	8/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ytpwTlq3QoH4EiKQsHObfNy0qRpB1hMBvbyjq0lU5YA=;
	b=mB/cdvBFq8GMlUuMMdbiuR6fMAWlNDdEpFX03iI1iF2HBpf40OOo6peYrIrCx9Jl+p
	OYnn/UU+j3e+qvNxaC4PUh45G8hXsVpFj/dJjaIH4401C3RXaIXuGT4ZNISI5Ccxpu4U
	deS39wEghaqt4DB/U/ksC6sxtWdfFjO91p8QbhQoigBxwPRU6VyF/dFrp5Gk+yL3R1wp
	71uoP6Ez40+X3ialrN0hng4BcP+65UVwpblMyzc/EC3R78uDFdmd5blmauMCUOp9peH9
	ZjIgZybo6mhStZdsoTysrf1nFfDgimonGoFfNz8XR0z1aFOVppEXuw/BhPDQB+blnlC5
	MogQ==
X-Gm-Message-State: ALyK8tLgT+VuD/xmt4GBfnxeYPTygOIDODpL/Em1tQOjz3aIgVWJ/tst5Bip0Y2yiEMxrgqlVXof9HiH+pHX8A==
X-Received: by 10.157.2.66 with SMTP id 60mr1288678otb.159.1466166963548; Fri,
	17 Jun 2016 05:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Fri, 17 Jun 2016 05:36:02 -0700 (PDT)
In-Reply-To: <1465927152-2796-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1465927152-2796-1-git-send-email-fabio.berton@ossystems.com.br>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jun 2016 08:36:02 -0400
Message-ID: <CADkTA4NjcK1AcBaHsqU_3A4kJwMJgyhNDF0t0ARkHThomnKE=w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker-registry: Make version dependence compatible with opkg
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
X-List-Received-Date: Fri, 17 Jun 2016 12:36:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c04f7fc0b36620535789908

--94eb2c04f7fc0b36620535789908
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 1:59 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Some recipes in RDEPENDS are installing specific version of package, for
> example:
>   gunicorn (= 19.1.1)
>
> If usigin ipk for PACKAGE_CLASSES, opkg prints error:
>
> Collected errors:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
>  for docker:
>  *      gunicorn (= 19.1.1) *
>  * opkg_install: Cannot install package docker.
>
> This error is caused because opkg appends package revision to version.
> In this case:
>   gunicorn_19.1.1-r0.1
>

merged (to master and krogoth).

I'm about to remove and completely re-work the registry recipe in master ..
but there's no harm in carrying this until that is in the tree.

Bruce


>
> If we use comparator >= this error doesn't appear.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../docker-registry/docker-registry_git.bb         | 26
> +++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-containers/docker-registry/docker-registry_git.bb
> b/recipes-containers/docker-registry/docker-registry_git.bb
> index 3d8d74b..0320440 100644
> --- a/recipes-containers/docker-registry/docker-registry_git.bb
> +++ b/recipes-containers/docker-registry/docker-registry_git.bb
> @@ -24,27 +24,27 @@ PV = "0.9.1+git${SRCREV}"
>
>  RDEPENDS_${PN} += "\
>    docker \
> -  gunicorn (= 19.1.1) \
> +  gunicorn (>= 19.1.1) \
>    python-pip \
>    python-distribute \
> -  python-m2crypto (= 0.22.3) \
> -  python-pyyaml (= 3.11) \
> -  python-flask (= 0.10.1) \
> -  python-gevent (= 1.0.1) \
> +  python-m2crypto (>= 0.22.3) \
> +  python-pyyaml (>= 3.11) \
> +  python-flask (>= 0.10.1) \
> +  python-gevent (>= 1.0.1) \
>    python-requests \
>    python-sqlalchemy (>= 0.9.4) \
> -  python-blinker (= 1.3) \
> -  python-backports-lzma (= 0.0.3) \
> -  python-flask-cors (= 1.10.3) \
> -  python-bugsnag (= 2.0.2) \
> -  python-docker-registry-core (= 2.0.3) \
> -  python-newrelic (= 2.22.0.19) \
> +  python-blinker (>= 1.3) \
> +  python-backports-lzma (>= 0.0.3) \
> +  python-flask-cors (>= 1.10.3) \
> +  python-bugsnag (>= 2.0.2) \
> +  python-docker-registry-core (>= 2.0.3) \
> +  python-newrelic (>= 2.22.0.19) \
>    python-itsdangerous (>= 0.21) \
>    python-jinja2 (>= 2.4) \
>    python-werkzeug (>= 0.7) \
>    python-simplejson (>= 3.6.2) \
> -  python-redis (= 2.10.3) \
> -  python-boto (= 2.34.0) \
> +  python-redis (>= 2.10.3) \
> +  python-boto (>= 2.34.0) \
>    python-webob \
>    "
>  # OFFICIAL REQ:
> --
> 2.1.4
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

--94eb2c04f7fc0b36620535789908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 14, 2016 at 1:59 PM, Fabio Berton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berto=
n@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Some recipes in RDEPENDS are installing specific version of package, for<br=
>
example:<br>
=C2=A0 gunicorn (=3D 19.1.1)<br>
<br>
If usigin ipk for PACKAGE_CLASSES, opkg prints error:<br>
<br>
Collected errors:<br>
=C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependencies=
<br>
=C2=A0for docker:<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0 gunicorn (=3D 19.1.1) *<br>
=C2=A0* opkg_install: Cannot install package docker.<br>
<br>
This error is caused because opkg appends package revision to version.<br>
In this case:<br>
=C2=A0 gunicorn_19.1.1-r0.1<br></blockquote><div><br></div><div>merged (to =
master and krogoth).</div><div><br></div><div>I&#39;m about to remove and c=
ompletely re-work the registry recipe in master ..</div><div>but there&#39;=
s no harm in carrying this until that is in the tree.</div><div><br></div><=
div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
If we use comparator &gt;=3D this error doesn&#39;t appear.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0.../docker-registry/<a href=3D"http://docker-registry_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-registry_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 26 +++++++++++-----------<br>
=C2=A01 file changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-registry/<a href=3D"http://docker-re=
gistry_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb<=
/a> b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
index 3d8d74b..0320440 100644<br>
--- a/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
+++ b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
@@ -24,27 +24,27 @@ PV =3D &quot;0.9.1+git${SRCREV}&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0docker \<br>
-=C2=A0 gunicorn (=3D 19.1.1) \<br>
+=C2=A0 gunicorn (&gt;=3D 19.1.1) \<br>
=C2=A0 =C2=A0python-pip \<br>
=C2=A0 =C2=A0python-distribute \<br>
-=C2=A0 python-m2crypto (=3D 0.22.3) \<br>
-=C2=A0 python-pyyaml (=3D 3.11) \<br>
-=C2=A0 python-flask (=3D 0.10.1) \<br>
-=C2=A0 python-gevent (=3D 1.0.1) \<br>
+=C2=A0 python-m2crypto (&gt;=3D 0.22.3) \<br>
+=C2=A0 python-pyyaml (&gt;=3D 3.11) \<br>
+=C2=A0 python-flask (&gt;=3D 0.10.1) \<br>
+=C2=A0 python-gevent (&gt;=3D 1.0.1) \<br>
=C2=A0 =C2=A0python-requests \<br>
=C2=A0 =C2=A0python-sqlalchemy (&gt;=3D 0.9.4) \<br>
-=C2=A0 python-blinker (=3D 1.3) \<br>
-=C2=A0 python-backports-lzma (=3D 0.0.3) \<br>
-=C2=A0 python-flask-cors (=3D 1.10.3) \<br>
-=C2=A0 python-bugsnag (=3D 2.0.2) \<br>
-=C2=A0 python-docker-registry-core (=3D 2.0.3) \<br>
-=C2=A0 python-newrelic (=3D 2.22.0.19) \<br>
+=C2=A0 python-blinker (&gt;=3D 1.3) \<br>
+=C2=A0 python-backports-lzma (&gt;=3D 0.0.3) \<br>
+=C2=A0 python-flask-cors (&gt;=3D 1.10.3) \<br>
+=C2=A0 python-bugsnag (&gt;=3D 2.0.2) \<br>
+=C2=A0 python-docker-registry-core (&gt;=3D 2.0.3) \<br>
+=C2=A0 python-newrelic (&gt;=3D 2.22.0.19) \<br>
=C2=A0 =C2=A0python-itsdangerous (&gt;=3D 0.21) \<br>
=C2=A0 =C2=A0python-jinja2 (&gt;=3D 2.4) \<br>
=C2=A0 =C2=A0python-werkzeug (&gt;=3D 0.7) \<br>
=C2=A0 =C2=A0python-simplejson (&gt;=3D 3.6.2) \<br>
-=C2=A0 python-redis (=3D 2.10.3) \<br>
-=C2=A0 python-boto (=3D 2.34.0) \<br>
+=C2=A0 python-redis (&gt;=3D 2.10.3) \<br>
+=C2=A0 python-boto (&gt;=3D 2.34.0) \<br>
=C2=A0 =C2=A0python-webob \<br>
=C2=A0 =C2=A0&quot;<br>
=C2=A0# OFFICIAL REQ:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c04f7fc0b36620535789908--
