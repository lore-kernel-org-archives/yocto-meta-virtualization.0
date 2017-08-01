Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC80CE00C5F; Mon, 31 Jul 2017 18:49:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.42 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE7C6E00C2E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 18:49:17 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id o85so1004093lff.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 18:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U/M69vjnbjZSB241ZqAQ8RReLVW04eae6CvPXNZxbNc=;
	b=EBvqqFvJ53jj5gFjUd9rbfNOKXBhL1GCD3K95bIJcKEgQrWuuZFeVw6GsHuhZ40Pnk
	hiePHLsETNpSI9UB3fy/vWQmvpi3BOcYotxBNlWQt/2am+mQcIB5klZLpBd6ejEZQ7vY
	gu9SyNGp8XdfjQ8x+WzA7vIzsFjGLAW3Qw4i0q180gqJh3rawJ+VkLGu9wAwyGyi9zzW
	EZb5LGN6923baz/a2fDkSmn2kvxcx/pfqJ0aeQ92FcpY2y+ft/5rEQBeFbWzdHsaQMe5
	m3Qxl75LIjg80LwCa4qn2RzQQVenI0I5MBC5ou7sv/OWOJjGYz5v2fqKBmPUF/MwspAK
	FpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U/M69vjnbjZSB241ZqAQ8RReLVW04eae6CvPXNZxbNc=;
	b=gk7GUAfXrboDDVC1O75Fi2ccICTO7F9Qu7gX+8RRDGTuTTFWq6LGk3IqrhteumBHz4
	tsRyniDIxzuA2X3VQQ8u9T4t8M56FOcctd+rM+ktcf88Y0qHVkL82ObIydr4x6XN+b1k
	6o0Un/OOwKl2HhNEZvuzT/h5mdXsHKPbYaFvwBdF5n6EWzWnV5BBoxbjNNHI7hkDB/oT
	n5ipWV9m9Orv5RCIjA+nsH9G7N3CRV3Ytof+N1ZcfzVLIe2ANWlkxsBOewZfiBIMoM6f
	EHnOyCV6rvWUc7K0UZInAzb3wWErLsJ5WY7H6YFfAtrM96YSOutk1oWhDu3GS0PINVga
	D7wg==
X-Gm-Message-State: AIVw110OXAKsMbJuJ9Yl2XNkryAI3tKcVjN1sHItgn/NF7NDug7riCrs
	9OBFo+YH4hF+5A/o1E+k/tKeeHhHUy9u
X-Received: by 10.25.145.71 with SMTP id y7mr6191298lfj.17.1501552156555; Mon,
	31 Jul 2017 18:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Mon, 31 Jul 2017 18:49:16 -0700 (PDT)
In-Reply-To: <1501497461.1765.0.camel@enea.com>
References: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
	<1501497461.1765.0.camel@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 31 Jul 2017 21:49:16 -0400
Message-ID: <CADkTA4OcN4rBKt1+qxsSY=P4Awsmsb6H3t8wPa0KQf=9O5o_jQ@mail.gmail.com>
To: Adrian Dudau <Adrian.Dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-requests: Drop recipe
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
X-List-Received-Date: Tue, 01 Aug 2017 01:49:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c1cd06ae741150555a75ae8"

--94eb2c1cd06ae741150555a75ae8
Content-Type: text/plain; charset="UTF-8"

considering I replied "merged" to this already "ping" really isn't the
right thing to
send.

What branch are you looking at ?

Bruce

commit 88277c84962e9d07ec777896a0ca8bd7db9ff5e2
Author: Adrian Dudau <adrian.dudau@enea.com>
Date:   Wed Jul 5 15:27:08 2017 +0200

    python-requests: Drop recipe

    There's a newer recipe (v2.13) maintained in meta-python. meta-openstack
    explicitly prefers that version over this one, so no point in keeping
    this recipe since nobody else is using this version.

    Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

:100644 000000 187f97a... 0000000... D  recipes-devtools/python/
python-requests_2.8.1.bb

On Mon, Jul 31, 2017 at 6:37 AM, Adrian Dudau <Adrian.Dudau@enea.com> wrote:

> On ons, 2017-07-05 at 15:27 +0200, Adrian Dudau wrote:
> > There's a newer recipe (v2.13) maintained in meta-python. meta-
> > openstack
> > explicitly prefers that version over this one, so no point in keeping
> > this recipe since nobody else is using this version.
> >
> > Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> > ---
> >  recipes-devtools/python/python-requests_2.8.1.bb | 28 --------------
> > ----------
> >  1 file changed, 28 deletions(-)
> >  delete mode 100644 recipes-devtools/python/python-requests_2.8.1.bb
> >
> > diff --git a/recipes-devtools/python/python-requests_2.8.1.bb
> > b/recipes-devtools/python/python-requests_2.8.1.bb
> > deleted file mode 100644
> > index 187f97a..0000000
> > --- a/recipes-devtools/python/python-requests_2.8.1.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -HOMEPAGE = "http://python-requests.org"
> > -SUMMARY = "Python HTTP for Humans."
> > -DESCRIPTION = "\
> > -  Requests is an Apache2 Licensed HTTP library, written in Python, \
> > -  for human beings. \
> > -  .      \
> > -  Most existing Python modules for sending HTTP requests are
> > extremely \
> > -  verbose and cumbersome. Python's builtin urllib2 module provides
> > most \
> > -  of the HTTP capabilities you should need, but the api is
> > thoroughly \
> > -  broken.  It requires an enormous amount of work (even method
> > overrides) \
> > -  to perform the simplest of tasks. \
> > -  .      \
> > -  Things shouldn't be this way. Not in Python \
> > -  "
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
> > -
> > -SRCNAME = "requests"
> > -
> > -SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNA
> > ME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
> > -SRC_URI[sha256sum] =
> > "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > --
> > 2.7.4
> >
>
> ping!
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1cd06ae741150555a75ae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">considering I replied &quot;merged&quot; to this already &=
quot;ping&quot; really isn&#39;t the right thing to<div>send.</div><div><br=
></div><div>What branch are you looking at ?</div><div><br></div><div>Bruce=
</div><div><br></div><div><div class=3D"gmail_extra"><div class=3D"gmail_ex=
tra">commit 88277c84962e9d07ec777896a0ca8bd7db9ff5e2</div><div class=3D"gma=
il_extra">Author: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com"=
>adrian.dudau@enea.com</a>&gt;</div><div class=3D"gmail_extra">Date: =C2=A0=
 Wed Jul 5 15:27:08 2017 +0200</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">=C2=A0 =C2=A0 python-requests: Drop recipe</div><d=
iv class=3D"gmail_extra">=C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_extra=
">=C2=A0 =C2=A0 There&#39;s a newer recipe (v2.13) maintained in meta-pytho=
n. meta-openstack</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 explicitly =
prefers that version over this one, so no point in keeping</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 this recipe since nobody else is using this =
version.</div><div class=3D"gmail_extra">=C2=A0 =C2=A0=C2=A0</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 Signed-off-by: Adrian Dudau &lt;<a href=3D"=
mailto:adrian.dudau@enea.com">adrian.dudau@enea.com</a>&gt;</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">:10064=
4 000000 187f97a... 0000000... D =C2=A0recipes-devtools/python/<a href=3D"h=
ttp://python-requests_2.8.1.bb">python-requests_2.8.1.bb</a></div><div><br>=
</div><div class=3D"gmail_quote">On Mon, Jul 31, 2017 at 6:37 AM, Adrian Du=
dau <span dir=3D"ltr">&lt;<a href=3D"mailto:Adrian.Dudau@enea.com" target=
=3D"_blank">Adrian.Dudau@enea.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D=
"gmail-h5">On ons, 2017-07-05 at 15:27 +0200, Adrian Dudau wrote:<br>
&gt; There&#39;s a newer recipe (v2.13) maintained in meta-python. meta-<br=
>
&gt; openstack<br>
&gt; explicitly prefers that version over this one, so no point in keeping<=
br>
&gt; this recipe since nobody else is using this version.<br>
&gt;<br>
&gt; Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.co=
m">adrian.dudau@enea.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n-requests_2.8.1.bb</a> =
| 28 --------------<br>
&gt; ----------<br>
&gt; =C2=A01 file changed, 28 deletions(-)<br>
&gt; =C2=A0delete mode 100644 recipes-devtools/python/<a href=3D"http://pyt=
hon-requests_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-req=
uests_2.8.1.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python-requests=
_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.=
bb</a><br>
&gt; b/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 187f97a..0000000<br>
&gt; --- a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><=
br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://python-requests.org" rel=3D"nore=
ferrer" target=3D"_blank">http://python-requests.org</a>&quot;<br>
&gt; -SUMMARY =3D &quot;Python HTTP for Humans.&quot;<br>
&gt; -DESCRIPTION =3D &quot;\<br>
&gt; -=C2=A0=C2=A0Requests is an Apache2 Licensed HTTP library, written in =
Python, \<br>
&gt; -=C2=A0=C2=A0for human beings. \<br>
&gt; -=C2=A0=C2=A0.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\<br>
&gt; -=C2=A0=C2=A0Most existing Python modules for sending HTTP requests ar=
e<br>
&gt; extremely \<br>
&gt; -=C2=A0=C2=A0verbose and cumbersome. Python&#39;s builtin urllib2 modu=
le provides<br>
&gt; most \<br>
&gt; -=C2=A0=C2=A0of the HTTP capabilities you should need, but the api is<=
br>
&gt; thoroughly \<br>
&gt; -=C2=A0=C2=A0broken.=C2=A0=C2=A0It requires an enormous amount of work=
 (even method<br>
&gt; overrides) \<br>
&gt; -=C2=A0=C2=A0to perform the simplest of tasks. \<br>
&gt; -=C2=A0=C2=A0.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\<br>
&gt; -=C2=A0=C2=A0Things shouldn&#39;t be this way. Not in Python \<br>
&gt; -=C2=A0=C2=A0&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D<wbr>58c7e163c9f8ee037246da101c6afd<wbr>1e&=
quot;<br>
&gt; -<br>
&gt; -SRCNAME =3D &quot;requests&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/r=
/requests/${SRCNA" rel=3D"noreferrer" target=3D"_blank">http://pypi.python.=
org/<wbr>packages/source/r/requests/${<wbr>SRCNA</a><br>
&gt; ME}-${PV}.tar.gz&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>a27ea3d72d7822906ddce5e252d6ad<wbr>d9&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;<wbr>84fe8d5bf4dcdcc49002446c47a146<wbr>d17ac10facf00d9086659064=
ac43b6<wbr>c25b&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt; -<br>
&gt; -inherit setuptools<br>
&gt; --=C2=A0<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
</div></div>ping!<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div></div>

--94eb2c1cd06ae741150555a75ae8--
