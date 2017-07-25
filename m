Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48114E00C31; Tue, 25 Jul 2017 06:10:03 -0700 (PDT)
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
	*      [209.85.215.50 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.50 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67F71E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:10:01 -0700 (PDT)
Received: by mail-lf0-f50.google.com with SMTP id d78so56238642lfg.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=09yRWwjJMZirKVXMSqtRHvBQ4pV6caz/vMTFwBzGL2c=;
	b=pik65oUgF0YIUgyPIh075VdqUKeltCJY9xCZqECnMkEvTe6Kh+M2Mh5ujOADv9IxLv
	GTRYIGBhE+RvwFJsb2XqZQnfFjh5UFner5BcJD1aYuCnk/58GvMIsHBFkmmQ1xEMJOaQ
	mIe1fwjbzpPSfjLc33RHtV2GZ1qFo0g/cxQFOwVh6kyTT5cuLiUo0ZgK1ayq9PCVgdO0
	7n6vppF7Qn2eYAcWN5m5bv7ScGLx3iKhsn90L8kR6JdkW/Jk7H5SGl7yy6r+UtQg+YLW
	J7lz3YDumaVhoSfnexHjYa4PNo5Zw+9QQJs3Ecz6D05uHke0jdJJfhX3lFfbkEJnWUE4
	+C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=09yRWwjJMZirKVXMSqtRHvBQ4pV6caz/vMTFwBzGL2c=;
	b=hZSUtiStlheg7jV1ebbWRRuHg8oWD5VuwUcghSj8IRT25XuZMjXS+5AxnAhzrr3VWt
	r5/8PRokBxJ0yVCu/+6hQje/WGRIZi2pFrR7lHlc5ZfaLVe2VKImVpjPPyg1mBxbk6+o
	ARtB4qpGZmGfvHGmdlMSbJ227LgO81T2XPg+jAbD9SXmrECyoJMiaREpiV+uUcO8ql6t
	JTqKbLqD8DqnOoc8GACUE8SE3e/fw0wpha60qJ6PEbBU+DLNovZFxFlUlZHX6GMa6YSF
	11W+ltBFQ4czNa5ODhjSfVBFgCNVyuUQuVQZgKqLniftxndtdpbYj8IGKQ0nsAOwiEoj
	4QAw==
X-Gm-Message-State: AIVw112zmWW+amX3FrwJXo04wSwH4qvCIYexAH6KO2GQXlEbdXX+Wwe6
	Lencga5KA3LK9SBIUoPMViAC9z1QQQ==
X-Received: by 10.46.7.9 with SMTP id 9mr6914805ljh.108.1500988201150; Tue, 25
	Jul 2017 06:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Tue, 25 Jul 2017 06:10:00 -0700 (PDT)
In-Reply-To: <20170725071718.23077-1-Qi.Chen@windriver.com>
References: <20170725071718.23077-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jul 2017 09:10:00 -0400
Message-ID: <CADkTA4O+k-nctLd7Q9t7gEsycaAA3P_aqVosre3jHvNed1FbrA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] spice: set COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 25 Jul 2017 13:10:03 -0000
Content-Type: multipart/alternative; boundary="f403045ec30a8aaf530555240cb3"

--f403045ec30a8aaf530555240cb3
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jul 25, 2017 at 3:17 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Set COMPATIBLE_HOST to restrict building only for x86 archs.
>
> The configure script clearly requires x86 archs. Message is as below.
>
>   Only x86 and x86-64 are supported
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-support/spice/spice_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/
> spice_git.bb
> index 6f1be3a..e62f315 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -70,3 +70,5 @@ do_install_append() {
>         oe_runmake DESTDIR="${D}" install
>         cd -
>  }
> +
> +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> --
> 2.11.0
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

--f403045ec30a8aaf530555240cb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 25, 2017 at 3:17 AM=
, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">Set COMPATIBLE_HOST to restrict buildin=
g only for x86 archs.<br>
<br>
The configure script clearly requires x86 archs. Message is as below.<br>
<br>
=C2=A0 Only x86 and x86-64 are supported<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">spice_<wbr>git.bb</a> b/recipes-support/spice/=
<a href=3D"http://spice_git.bb" rel=3D"noreferrer" target=3D"_blank">spice_=
<wbr>git.bb</a><br>
index 6f1be3a..e62f315 100644<br>
--- a/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
+++ b/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferr=
er" target=3D"_blank">spice_<wbr>git.bb</a><br>
@@ -70,3 +70,5 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D&quot;${D}&quot; install<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
=C2=A0}<br>
+<br>
+COMPATIBLE_HOST =3D &#39;(x86_64|i.86).*-linux&#39;<br>
--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
</span>meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--f403045ec30a8aaf530555240cb3--
