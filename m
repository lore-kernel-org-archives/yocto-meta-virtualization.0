Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 318A9E00DBC; Wed, 18 May 2016 20:36:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3655EE00D8B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 20:36:48 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id w198so13883043oiw.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Pp03/TOUZ1cArNWUqnw9Oup+fRQJa3fJkw3Huj1IAE4=;
	b=rj/slVPAon3tVhZMnDEwXmG6Zmz5zAeVIKkrx5VnnG51QuuSYOfn0XWHe8C650uZgW
	r6gDIht16RL1MYCK48F5lOhPoWUG8cPDOc2pm4Uun4amBHKLrvOJiIvhuiS4wqtO4tiz
	U4Qdqb5VxPRvab8uEHxzQC5SXWcg7v17HWNs9KKCGW0jXCMP1VS9xXEhjRvBHvZOh/s6
	8Gd3N1N4Jpf8DanR3WfeM+dmjwE+0qJ2/uWkrRaf3IVnQsiFSKJmZzHFQjlIlnS/nvOI
	vV81JbeMgx8z9NJH7DqL4aH3FUixaRscD4lkM7Yi6ZdI9OENlMcAxGPl/vnzj/o8HYJU
	qvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Pp03/TOUZ1cArNWUqnw9Oup+fRQJa3fJkw3Huj1IAE4=;
	b=mnVEqCRUI51a0v65HQKaHIb/pAm9TepfY/B+a2yVM/sCjIUMMkO3Ooi4v776d847Sn
	2yvsAmF/PXLjpXwDUafM/8bdIT+Jf9jJfIAfM7bdoihHPDJZFyXDorEW5f0ThFVuVKPw
	uB5vTapfyzQOb5X9Z3Ohf9r+vgb6Bn7BCXEC98SzugnXh2KVjPkCvDExXatenK9LSSNh
	MylwA0hAEk4I8sMb1CIRnhS1ChYqSOvdD8b+AqdvfhXPxbTnjKdobFG1VWE30JBTG4Zd
	5vwu84rOwTPvCR00S4tR23Vc/1gRk00zjjzT1KJGeafLobvmQY1Kny2l8NQDJBMn3OUC
	GaUQ==
X-Gm-Message-State: AOPr4FX9sJNTTTmG3e0N/qvOjDi3wBK9XPCQZjcfdhOFqTkuFwXJP1dT6QeLkZ2KuB6rRt3by7ADEmjI78x1kQ==
MIME-Version: 1.0
X-Received: by 10.202.196.72 with SMTP id u69mr5630583oif.116.1463629008391;
	Wed, 18 May 2016 20:36:48 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 18 May 2016 20:36:48 -0700 (PDT)
In-Reply-To: <1463604926-30546-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1463604926-30546-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Wed, 18 May 2016 23:36:48 -0400
Message-ID: <CADkTA4PJtWRgcqOhs1BAPFmew82aJTKX1uuDucxH_dYPZOnHrw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 May 2016 03:36:50 -0000
Content-Type: multipart/alternative; boundary=001a11352a4e20da88053329af10

--001a11352a4e20da88053329af10
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


My first reply not withstanding (that I have change queued), there are
other recipes
(and valid reasons) to enforce versions in the dependencies.

I'm not ipk expert .. so you are saying there's no way to enforce this if
you use ipk ?

I wouldn't run around changing these, if that was the case, since I'm not
seeing
a compelling reason to remove a capability simply because one of the formats
can't support it.

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

--001a11352a4e20da88053329af10
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
><br></div><div>My first reply not withstanding (that I have change queued)=
, there are other recipes</div><div>(and valid reasons) to enforce versions=
 in the dependencies.</div><div><br></div><div>I&#39;m not ipk expert .. so=
 you are saying there&#39;s no way to enforce this if you use ipk ?</div><d=
iv><br></div><div>I wouldn&#39;t run around changing these, if that was the=
 case, since I&#39;m not seeing</div><div>a compelling reason to remove a c=
apability simply because one of the formats</div><div>can&#39;t support it.=
</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
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

--001a11352a4e20da88053329af10--
