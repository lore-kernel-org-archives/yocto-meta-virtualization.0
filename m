Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3743DE00DB6; Wed, 18 May 2016 20:34:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B103BE00D6C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 20:33:57 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id w198so13873943oiw.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Ig75oogs8NEEOV1VhMUKPGV3B/6egRV0V8tmG0flDmo=;
	b=YqvlSrwWaECvJKpxoLi0VJ4uTwKRDzqJeYLcUi6I7Z//PDrI/xyeQEzLk+VD+6QgRQ
	My68P6xEcCpbKmcuavkWoSpBCpcfkAk4ahWAYOdb1brG+XpGyTGr0FojIKHO0xmZ9nln
	un3WQfMnOXzSbJDnQhukPqvXwlLMlG7ubYDrbUVY3t41hXlJ0bbFN3jAWv/hFcGmchm8
	5Doj6xqiWJlPZv/r+KkAL0LUuhqdpQtO/jdcUQXW4hUmVW067jimOBz3sqlDl/PI+vXZ
	jIKoROHb3Wf74eXgP6CIiOMwN/tdmes1D3GSbliBKUmrQ3e3+DuLsONHru2uhv/JEGjG
	VrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Ig75oogs8NEEOV1VhMUKPGV3B/6egRV0V8tmG0flDmo=;
	b=Tyi9BQA6gvlyeRb+ZJoKNaix9a1THicEw4Nco0Ve40zR5Rsn9s+p77rZv7Nr2Dff3n
	TeCypx5Itq1pYzWUkOwL9Qvz80GCT6q8xGrKHHJo4+XMlUW5cpNgv01c0pQszuCY6afu
	I4JUdzhp3K6mrIkRN0heRMCo5wR0OdlR1Ot5k6nbahYxSNmN+WFnjEnJxQFBVdsMhBUU
	kxAAbOlpX7OQg9sCf8eGGUb5V1nyqjAbxGhjqA2zjaKBSEz6WrkZ4WPysgvARFpI5Np9
	WXgam+ah3ahVEMzoH5U7GfPOOEcar+H3AO8L0G0B5mW1UbuQgOifordiciRKRuypcFkg
	76nA==
X-Gm-Message-State: AOPr4FUVdFkDhAN0QwbNk7MoK72BtBiImqfcr3fi63nagicMZ53Zipfn5QdlbC87pKfopSLQHqJlNIs0hOhTgw==
MIME-Version: 1.0
X-Received: by 10.157.2.69 with SMTP id 63mr6047746otb.159.1463628836605; Wed,
	18 May 2016 20:33:56 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 18 May 2016 20:33:56 -0700 (PDT)
In-Reply-To: <1463604926-30546-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1463604926-30546-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Wed, 18 May 2016 23:33:56 -0400
Message-ID: <CADkTA4NX2yLHMum2VvJMVYH3BiTM62b5f93QK=HV3+9p9z9kYw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker-registry: Remove RDEPENDS explicit version
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
X-List-Received-Date: Thu, 19 May 2016 03:34:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c114d24e3b02a053329a430

--94eb2c114d24e3b02a053329a430
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 4:55 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> RDEPENDS has dependence recipe with recommended version like:
>
>  - gunicorn (= 19.1.1)
>
> This syntax only work if we use rpm for package class, we can't
> use this syntax with ipk package class.
>

I'm about to remove the registry package completely, so I'll sit on this
patch for a bit. There
won't be any dependencies (outside of docker) once it is complete .. and
hence this won't
be required.

Bruce


>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../docker-registry/docker-registry_git.bb         | 36
> +++++++++++-----------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/recipes-containers/docker-registry/docker-registry_git.bb
> b/recipes-containers/docker-registry/docker-registry_git.bb
> index 3d8d74b..17a5ae1 100644
> --- a/recipes-containers/docker-registry/docker-registry_git.bb
> +++ b/recipes-containers/docker-registry/docker-registry_git.bb
> @@ -24,27 +24,27 @@ PV = "0.9.1+git${SRCREV}"
>
>  RDEPENDS_${PN} += "\
>    docker \
> -  gunicorn (= 19.1.1) \
> +  gunicorn  \
>    python-pip \
>    python-distribute \
> -  python-m2crypto (= 0.22.3) \
> -  python-pyyaml (= 3.11) \
> -  python-flask (= 0.10.1) \
> -  python-gevent (= 1.0.1) \
> +  python-m2crypto  \
> +  python-pyyaml  \
> +  python-flask  \
> +  python-gevent  \
>    python-requests \
> -  python-sqlalchemy (>= 0.9.4) \
> -  python-blinker (= 1.3) \
> -  python-backports-lzma (= 0.0.3) \
> -  python-flask-cors (= 1.10.3) \
> -  python-bugsnag (= 2.0.2) \
> -  python-docker-registry-core (= 2.0.3) \
> -  python-newrelic (= 2.22.0.19) \
> -  python-itsdangerous (>= 0.21) \
> -  python-jinja2 (>= 2.4) \
> -  python-werkzeug (>= 0.7) \
> -  python-simplejson (>= 3.6.2) \
> -  python-redis (= 2.10.3) \
> -  python-boto (= 2.34.0) \
> +  python-sqlalchemy  \
> +  python-blinker  \
> +  python-backports-lzma  \
> +  python-flask-cors  \
> +  python-bugsnag  \
> +  python-docker-registry-core  \
> +  python-newrelic  \
> +  python-itsdangerous  \
> +  python-jinja2  \
> +  python-werkzeug  \
> +  python-simplejson  \
> +  python-redis  \
> +  python-boto  \
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

--94eb2c114d24e3b02a053329a430
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 18, 2016 at 4:55 PM, Fabio Berton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berto=
n@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
RDEPENDS has dependence recipe with recommended version like:<br>
<br>
=C2=A0- gunicorn (=3D 19.1.1)<br>
<br>
This syntax only work if we use rpm for package class, we can&#39;t<br>
use this syntax with ipk package class.<br></blockquote><div><br></div><div=
>I&#39;m about to remove the registry package completely, so I&#39;ll sit o=
n this patch for a bit. There</div><div>won&#39;t be any dependencies (outs=
ide of docker) once it is complete .. and hence this won&#39;t</div><div>be=
 required.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0.../docker-registry/<a href=3D"http://docker-registry_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-registry_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 36 +++++++++++-----------<br>
=C2=A01 file changed, 18 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-registry/<a href=3D"http://docker-re=
gistry_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb<=
/a> b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
index 3d8d74b..17a5ae1 100644<br>
--- a/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
+++ b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
@@ -24,27 +24,27 @@ PV =3D &quot;0.9.1+git${SRCREV}&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0docker \<br>
-=C2=A0 gunicorn (=3D 19.1.1) \<br>
+=C2=A0 gunicorn=C2=A0 \<br>
=C2=A0 =C2=A0python-pip \<br>
=C2=A0 =C2=A0python-distribute \<br>
-=C2=A0 python-m2crypto (=3D 0.22.3) \<br>
-=C2=A0 python-pyyaml (=3D 3.11) \<br>
-=C2=A0 python-flask (=3D 0.10.1) \<br>
-=C2=A0 python-gevent (=3D 1.0.1) \<br>
+=C2=A0 python-m2crypto=C2=A0 \<br>
+=C2=A0 python-pyyaml=C2=A0 \<br>
+=C2=A0 python-flask=C2=A0 \<br>
+=C2=A0 python-gevent=C2=A0 \<br>
=C2=A0 =C2=A0python-requests \<br>
-=C2=A0 python-sqlalchemy (&gt;=3D 0.9.4) \<br>
-=C2=A0 python-blinker (=3D 1.3) \<br>
-=C2=A0 python-backports-lzma (=3D 0.0.3) \<br>
-=C2=A0 python-flask-cors (=3D 1.10.3) \<br>
-=C2=A0 python-bugsnag (=3D 2.0.2) \<br>
-=C2=A0 python-docker-registry-core (=3D 2.0.3) \<br>
-=C2=A0 python-newrelic (=3D 2.22.0.19) \<br>
-=C2=A0 python-itsdangerous (&gt;=3D 0.21) \<br>
-=C2=A0 python-jinja2 (&gt;=3D 2.4) \<br>
-=C2=A0 python-werkzeug (&gt;=3D 0.7) \<br>
-=C2=A0 python-simplejson (&gt;=3D 3.6.2) \<br>
-=C2=A0 python-redis (=3D 2.10.3) \<br>
-=C2=A0 python-boto (=3D 2.34.0) \<br>
+=C2=A0 python-sqlalchemy=C2=A0 \<br>
+=C2=A0 python-blinker=C2=A0 \<br>
+=C2=A0 python-backports-lzma=C2=A0 \<br>
+=C2=A0 python-flask-cors=C2=A0 \<br>
+=C2=A0 python-bugsnag=C2=A0 \<br>
+=C2=A0 python-docker-registry-core=C2=A0 \<br>
+=C2=A0 python-newrelic=C2=A0 \<br>
+=C2=A0 python-itsdangerous=C2=A0 \<br>
+=C2=A0 python-jinja2=C2=A0 \<br>
+=C2=A0 python-werkzeug=C2=A0 \<br>
+=C2=A0 python-simplejson=C2=A0 \<br>
+=C2=A0 python-redis=C2=A0 \<br>
+=C2=A0 python-boto=C2=A0 \<br>
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
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c114d24e3b02a053329a430--
