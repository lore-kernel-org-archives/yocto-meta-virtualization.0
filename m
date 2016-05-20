Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4088EE00D23; Fri, 20 May 2016 09:33:27 -0700 (PDT)
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
	*      [209.85.218.66 listed in list.dnswl.org]
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA6D3E00CE1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:33:24 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id m198so6836047oig.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=vsOKFn0KMGCig+EUk6CO/hIAfbEKRtDY91YTrP+tfng=;
	b=07smtLMP+MPQLbFpKpeBOPILaRvwzi9Y/Y7AeDvgEpQfYhMWi2cQHCDzysmzyRZroo
	b7s3ywTRA14Xh07nQxSlkx2OoV4Ms7kSpfwVJUmvXs9txN0enOJEuY9nWHqiUodkBYTU
	sPsUayklOsvyMidihbm5h7VekxYlM7isCioOMh5PR1NhllaHTgK/nkuwUZizks1kjXDy
	e9QAsCRET6g5yITS0V+GJJeX4RU8INia6cel0Zi+E/JmKQyGOdmZwyPcx36hivEC/90t
	8dPZ/bI//fWlfhREXx7Kqkg6JnJuER8tP1NCDaZYwyFLnWseB1gwDj4P0cXRdwM9f0qe
	vzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=vsOKFn0KMGCig+EUk6CO/hIAfbEKRtDY91YTrP+tfng=;
	b=F+xWKRVvt2LENkORZWIriZIQnMfeB+GKnsvNPJQ9B0We1BOALcJOsCcqApw0ggaFi/
	32FDsuS7XlGXK5Q7V9rXRcO/cYgjhKKhRoD8PKmSiuxtrK3EERBnUh/2EXZsCx0jOXWi
	5OaCdfEDBSqCiM5e2IOUlbzOceaWu5q1u0iiJau0zCckYOQXy00oKl1xKwg6EfodBqBa
	VBZuRIfe2GkD8Wk7FqO1/Qt9ZyWvHQoenf7oLsFYEgBVflbRozs6I2nhHK0ygRqKC7ES
	dIl8XZIzTHV3lImvbXMWlNo5nC4kSbHsl3J1g0z5Vdp4QqwoN/OCrbmQ2g9bv80ksqXc
	QUEg==
X-Gm-Message-State: AOPr4FVGDzLHyhUSXteBZtpMZSaBAJfGT68dDlz8+7YftYa3wonbGZy+Cvb8S6awMkU7Q7P/7a8er03c/3PU6A==
MIME-Version: 1.0
X-Received: by 10.202.74.17 with SMTP id x17mr2250357oia.143.1463762003866;
	Fri, 20 May 2016 09:33:23 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 09:33:23 -0700 (PDT)
In-Reply-To: <1463726055-4807-1-git-send-email-zhe.he@windriver.com>
References: <1463726055-4807-1-git-send-email-zhe.he@windriver.com>
Date: Fri, 20 May 2016 12:33:23 -0400
Message-ID: <CADkTA4OP4Xr3jMtvY4k23BJsatKTbGM4X5aas33fzrQ_0arPkw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-repoze: Add license to avoid warning
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
X-List-Received-Date: Fri, 20 May 2016 16:33:27 -0000
Content-Type: multipart/alternative; boundary=001a1134fe7c46baba053348a6b0

--001a1134fe7c46baba053348a6b0
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Fri, May 20, 2016 at 2:34 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> "WARNING: python-repoze.who: No generic license file exists for:
> BSD-derived in
> any provider"
>
> Add BSD Modification Variant license
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/licenses/BSD-Modification           | 35
> ++++++++++++++++++++++
>  .../python/python-repoze.who_2.2.bb                |  2 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-openstack/licenses/BSD-Modification
>
> diff --git a/meta-openstack/licenses/BSD-Modification
> b/meta-openstack/licenses/BSD-Modification
> new file mode 100644
> index 0000000..f74b496
> --- /dev/null
> +++ b/meta-openstack/licenses/BSD-Modification
> @@ -0,0 +1,35 @@
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are
> +met:
> +
> +1.  Redistributions in source code must retain the accompanying
> +    copyright notice, this list of conditions, and the following
> +    disclaimer.
> +
> +2.  Redistributions in binary form must reproduce the accompanying
> +    copyright notice, this list of conditions, and the following
> +    disclaimer in the documentation and/or other materials provided
> +    with the distribution.
> +
> +3.  Names of the copyright holders must not be used to endorse or
> +    promote products derived from this software without prior
> +    written permission from the copyright holders.
> +
> +4.  If any files are modified, you must cause the modified files to
> +    carry prominent notices stating that you changed the files and
> +    the date of any change.
> +
> +Disclaimer
> +
> +  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND
> +  ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
> +  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> +  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> +  HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
> +  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> +  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> +  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
> +  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> +  THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> +  SUCH DAMAGE.
> diff --git a/meta-openstack/recipes-devtools/python/
> python-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/
> python-repoze.who_2.2.bb
> index 35e5821..0bd1d42 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "An identification and authentication framework for WSGI"
>  HOMEPAGE = "http://repoze.org/"
>  SECTION = "devel/python"
> -LICENSE = "BSD-derived"
> +LICENSE = "BSD-Modification"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
>
>
> --
> 1.9.1
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

--001a1134fe7c46baba053348a6b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 20, 2016 =
at 2:34 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" =
target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com=
">zhe.he@windriver.com</a>&gt;<br>
<br>
&quot;WARNING: python-repoze.who: No generic license file exists for: BSD-d=
erived in<br>
any provider&quot;<br>
<br>
Add BSD Modification Variant license<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/licenses/BSD-Modification=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 35 ++++++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-repoze.who_2.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python-repoze.who_2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A02 files changed, 36 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-openstack/licenses/BSD-Modification<br>
<br>
diff --git a/meta-openstack/licenses/BSD-Modification b/meta-openstack/lice=
nses/BSD-Modification<br>
new file mode 100644<br>
index 0000000..f74b496<br>
--- /dev/null<br>
+++ b/meta-openstack/licenses/BSD-Modification<br>
@@ -0,0 +1,35 @@<br>
+Redistribution and use in source and binary forms, with or without<br>
+modification, are permitted provided that the following conditions are<br>
+met:<br>
+<br>
+1.=C2=A0 Redistributions in source code must retain the accompanying<br>
+=C2=A0 =C2=A0 copyright notice, this list of conditions, and the following=
<br>
+=C2=A0 =C2=A0 disclaimer.<br>
+<br>
+2.=C2=A0 Redistributions in binary form must reproduce the accompanying<br=
>
+=C2=A0 =C2=A0 copyright notice, this list of conditions, and the following=
<br>
+=C2=A0 =C2=A0 disclaimer in the documentation and/or other materials provi=
ded<br>
+=C2=A0 =C2=A0 with the distribution.<br>
+<br>
+3.=C2=A0 Names of the copyright holders must not be used to endorse or<br>
+=C2=A0 =C2=A0 promote products derived from this software without prior<br=
>
+=C2=A0 =C2=A0 written permission from the copyright holders.<br>
+<br>
+4.=C2=A0 If any files are modified, you must cause the modified files to<b=
r>
+=C2=A0 =C2=A0 carry prominent notices stating that you changed the files a=
nd<br>
+=C2=A0 =C2=A0 the date of any change.<br>
+<br>
+Disclaimer<br>
+<br>
+=C2=A0 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS&#39;&#39=
; AND<br>
+=C2=A0 ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED<br>
+=C2=A0 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A<br>
+=C2=A0 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT<=
br>
+=C2=A0 HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,<br=
>
+=C2=A0 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED<br>
+=C2=A0 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,<br>
+=C2=A0 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON<b=
r>
+=C2=A0 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR<=
br>
+=C2=A0 TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF<=
br>
+=C2=A0 THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF<br>
+=C2=A0 SUCH DAMAGE.<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-repoze.who_2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.who=
_2.2.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-repoze.who_2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.wh=
o_2.2.bb</a><br>
index 35e5821..0bd1d42 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-repoz=
e.who_2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.who_2.2.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-repoz=
e.who_2.2.bb" rel=3D"noreferrer" target=3D"_blank">python-repoze.who_2.2.bb=
</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0DESCRIPTION =3D &quot;An identification and authentication framework =
for WSGI&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://repoze.org/" rel=3D"noreferrer" =
target=3D"_blank">http://repoze.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;BSD-derived&quot;<br>
+LICENSE =3D &quot;BSD-Modification&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2c33cdbc6bc9ae6e5=
d64152fdb754292&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
1.9.1<br>
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
</div>

--001a1134fe7c46baba053348a6b0--
