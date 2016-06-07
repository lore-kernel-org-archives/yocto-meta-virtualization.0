Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68B03E00BF8; Tue,  7 Jun 2016 06:23:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E98DE00B5F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Jun 2016 06:23:22 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id n3so14521792oig.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Jun 2016 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CxWKJLE+8qraetjQGSAetmyuLVqzLRwzaViRh+MtyXg=;
	b=uEvxcWPDJZek20JTSJ3Gvl/JOMIG1eliCkVS6Qaq3eOq2HlS3PfdTp605xSEXr/C2u
	G5YMn36TWUS+nPn0gA3vbs62ZectIjy4/nY91llE4PubEh4RLEbAYTTolTtNNl+6zp1J
	mk1hpSZZQIuBAVQSI9Gp+lnHUDVHfX7D5o4lYfsLSAgtH7TJ0+R+Cr/EasF3y9Ilrrog
	QydlGZjB1nqJeGytszm0bdqH+C8854yFHmOxIaKSlJYKMU5ycP7Wel4lcidPr5ezbcvy
	Bco1sINWyKJMVAX9JAMABBVx60GSvzCTmDrFmkYzcJFRmWfGkFIC52boQCqAAdfodzVT
	oTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CxWKJLE+8qraetjQGSAetmyuLVqzLRwzaViRh+MtyXg=;
	b=WrYt+yxzOlhEUl+qW66kWjb7nQR95yiBoMK13d/mr8NGpLugbydtzZdzGWKuLCakBx
	2r6Nx211BGp1dyZNuVQWTRf170i2Y41hUdaIvQzWGubXVAHQHZ1FTrmqsOQxhkGa2VUh
	PwqREuDNIifNCzmy4YFkCXgQf8kM3h9nsuNBbvykrj4edYsY4OZKvHN7F35oO4gYr3Vx
	6r7cPuLvviTSstEcQb5ZRFeA7zBWkoLHqMQTTD+n+GOOqi1W8v08KoS4VItw0u9igVZ5
	aGtdF13JQ+Gh1CypDNjq+dZc1HjVBx/8BSzG6+ztipOYp0iEGZswH9fPAqbMN7aaHIQm
	TrRA==
X-Gm-Message-State: ALyK8tIG5TZls6GYFHkToNfWdEWjHW4Ss7Z1Dy3MD7zKN0lRdoD0MzT2bYUgUsBhbmcPvvCKRqOuo2bVknd4UQ==
X-Received: by 10.202.91.7 with SMTP id p7mr11567170oib.16.1465305801807; Tue,
	07 Jun 2016 06:23:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Tue, 7 Jun 2016 06:23:21 -0700 (PDT)
In-Reply-To: <1465278476-9876-1-git-send-email-zhe.he@windriver.com>
References: <1465278476-9876-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jun 2016 09:23:21 -0400
Message-ID: <CADkTA4OSALMom4jGQMEwFpcSv+n2thbwoW48_DTO_B8RMZOA0A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-repoze.lru: Add license to avoid warning
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
X-List-Received-Date: Tue, 07 Jun 2016 13:23:24 -0000
Content-Type: multipart/alternative; boundary=001a113caba4cdde310534b01798

--001a113caba4cdde310534b01798
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 7, 2016 at 1:47 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> "WARNING: python-repoze.lru: No generic license file exists for:
> BSD-derived in any provider"
>
> Add BSD Modification Variant license with copyright descriptions.
>
>
merged.

Bruce


> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/licenses/BSD-Modification-copyright | 41
> ++++++++++++++++++++++
>  .../python/python-repoze.lru_0.6.bb                |  2 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta-openstack/licenses/BSD-Modification-copyright
>
> diff --git a/meta-openstack/licenses/BSD-Modification-copyright
> b/meta-openstack/licenses/BSD-Modification-copyright
> new file mode 100644
> index 0000000..5ced96e
> --- /dev/null
> +++ b/meta-openstack/licenses/BSD-Modification-copyright
> @@ -0,0 +1,41 @@
> +License
> +
> +  A copyright notice accompanies this license document that identifies
> +  the copyright holders.
> +
> +  Redistribution and use in source and binary forms, with or without
> +  modification, are permitted provided that the following conditions are
> +  met:
> +
> +  1.  Redistributions in source code must retain the accompanying
> +      copyright notice, this list of conditions, and the following
> +      disclaimer.
> +
> +  2.  Redistributions in binary form must reproduce the accompanying
> +      copyright notice, this list of conditions, and the following
> +      disclaimer in the documentation and/or other materials provided
> +      with the distribution.
> +
> +  3.  Names of the copyright holders must not be used to endorse or
> +      promote products derived from this software without prior
> +      written permission from the copyright holders.
> +
> +  4.  If any files are modified, you must cause the modified files to
> +      carry prominent notices stating that you changed the files and
> +      the date of any change.
> +
> +  Disclaimer
> +
> +    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND
> +    ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
> +    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> +    PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> +    HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
> +    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> +    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> +    ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
> +    TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> +    THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> +    SUCH DAMAGE.
> +
> diff --git a/meta-openstack/recipes-devtools/python/
> python-repoze.lru_0.6.bb b/meta-openstack/recipes-devtools/python/
> python-repoze.lru_0.6.bb
> index 60a749f..bdf2f25 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> @@ -5,7 +5,7 @@ than keys and values that are used frequently. \
>  "
>  HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
>  SECTION = "devel/python"
> -LICENSE = "BSD-derived"
> +LICENSE = "BSD-Modification-copyright"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
>
>  SRCNAME = "repoze.lru"
> --
> 2.8.1
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113caba4cdde310534b01798
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 7, 2016 at 1:47 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">From: He Zhe &lt;<a href=3D"mai=
lto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;<br>
<br>
&quot;WARNING: python-repoze.lru: No generic license file exists for:<br>
BSD-derived in any provider&quot;<br>
<br>
Add BSD Modification Variant license with copyright descriptions.<br>
<br></blockquote><div><br></div><div>merged.<br><br></div><div>Bruce<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/licenses/BSD-Modification-copyright | 41 +++++++++++++=
+++++++++<br>
=C2=A0.../python/<a href=3D"http://python-repoze.lru_0.6.bb" rel=3D"norefer=
rer" target=3D"_blank">python-repoze.lru_0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A02 files changed, 42 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-openstack/licenses/BSD-Modification-copyright=
<br>
<br>
diff --git a/meta-openstack/licenses/BSD-Modification-copyright b/meta-open=
stack/licenses/BSD-Modification-copyright<br>
new file mode 100644<br>
index 0000000..5ced96e<br>
--- /dev/null<br>
+++ b/meta-openstack/licenses/BSD-Modification-copyright<br>
@@ -0,0 +1,41 @@<br>
+License<br>
+<br>
+=C2=A0 A copyright notice accompanies this license document that identifie=
s<br>
+=C2=A0 the copyright holders.<br>
+<br>
+=C2=A0 Redistribution and use in source and binary forms, with or without<=
br>
+=C2=A0 modification, are permitted provided that the following conditions =
are<br>
+=C2=A0 met:<br>
+<br>
+=C2=A0 1.=C2=A0 Redistributions in source code must retain the accompanyin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 copyright notice, this list of conditions, and the fo=
llowing<br>
+=C2=A0 =C2=A0 =C2=A0 disclaimer.<br>
+<br>
+=C2=A0 2.=C2=A0 Redistributions in binary form must reproduce the accompan=
ying<br>
+=C2=A0 =C2=A0 =C2=A0 copyright notice, this list of conditions, and the fo=
llowing<br>
+=C2=A0 =C2=A0 =C2=A0 disclaimer in the documentation and/or other material=
s provided<br>
+=C2=A0 =C2=A0 =C2=A0 with the distribution.<br>
+<br>
+=C2=A0 3.=C2=A0 Names of the copyright holders must not be used to endorse=
 or<br>
+=C2=A0 =C2=A0 =C2=A0 promote products derived from this software without p=
rior<br>
+=C2=A0 =C2=A0 =C2=A0 written permission from the copyright holders.<br>
+<br>
+=C2=A0 4.=C2=A0 If any files are modified, you must cause the modified fil=
es to<br>
+=C2=A0 =C2=A0 =C2=A0 carry prominent notices stating that you changed the =
files and<br>
+=C2=A0 =C2=A0 =C2=A0 the date of any change.<br>
+<br>
+=C2=A0 Disclaimer<br>
+<br>
+=C2=A0 =C2=A0 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS&#=
39;&#39; AND<br>
+=C2=A0 =C2=A0 ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED<br>
+=C2=A0 =C2=A0 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R A<br>
+=C2=A0 =C2=A0 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COP=
YRIGHT<br>
+=C2=A0 =C2=A0 HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPEC=
IAL,<br>
+=C2=A0 =C2=A0 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMI=
TED<br>
+=C2=A0 =C2=A0 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,<br>
+=C2=A0 =C2=A0 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED A=
ND ON<br>
+=C2=A0 =C2=A0 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILI=
TY, OR<br>
+=C2=A0 =C2=A0 TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY =
OUT OF<br>
+=C2=A0 =C2=A0 THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY=
 OF<br>
+=C2=A0 =C2=A0 SUCH DAMAGE.<br>
+<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-repoze.lru_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.lru=
_0.6.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-repoze.lru_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.lr=
u_0.6.bb</a><br>
index 60a749f..bdf2f25 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-repoz=
e.lru_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.lru_0.6.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-repoz=
e.lru_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.lru_0.6.bb=
</a><br>
@@ -5,7 +5,7 @@ than keys and values that are used frequently. \<br>
=C2=A0&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/repoze.lru=
" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/repoze.=
lru</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;BSD-derived&quot;<br>
+LICENSE =3D &quot;BSD-Modification-copyright&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2c33cdbc6bc9ae6e5=
d64152fdb754292&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;repoze.lru&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a113caba4cdde310534b01798--
