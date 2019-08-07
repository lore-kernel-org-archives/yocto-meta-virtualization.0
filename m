Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FCFFE00D8A; Tue,  6 Aug 2019 20:10:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2914E00C22
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:10:33 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id z15so58579627lfh.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Szsfi4gYdB4dMLr7d4J5/jTHOoT+n3a96RJRAfOnDBY=;
	b=koZjjIlMFTZw7HI3AYkhnB9U8W/gcxlVqR308+PIalgYjxDcThgUeRFYabAl5OBehc
	rBvwku3EaiX1alOARdJmw6R2tS5834zEm9jAbXXtFokPspu170bSpvc0SNOlWjhqol/t
	F9PhFRtGvvf5V7G1m/sx11NKmmnLyFZMN4JrfhBKRmIbVBf+X476RGoic/CSAtuyyEcA
	F1IbTM7llEVchYom0yQ5Pfvg5GjGbK/MV3V0ryCa1IaNTV3l/nrWbWzdkZN0BjhCVgzA
	VgjXmVVMx4ttDg+GrLil3Lr+1IlHPUrHqK671/YqjS1nQ+V+AFUFAvfodvQOnx2Q+Qn0
	Kzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Szsfi4gYdB4dMLr7d4J5/jTHOoT+n3a96RJRAfOnDBY=;
	b=Z/NAROJd1c8UVfvJYS98tbrFvC/P3vYXasSdsLS+xnQnuIaTnyuOy3FYN/Jf3hOR6P
	QRe5YbjhoMJ8LqssVZPjem4WiDr4De0M3KbVAjC9sc0WIspCg8y6TzSzdSDEHHxcBHdR
	DEZLupe4dy8t1f4b1JtlBUGrdl0FYbYcq6bPqtIFeRq+c7IXcSRkxX9TJC20Xb5e98u8
	Q0qDIrm3W3SedMWqKb5RhNFFmwVh3dyuvf+5wEaldFolpcSyRHe3aC1KLXp36jDsovud
	30/zkUyBKrR4tsv5roDcwLiqowJ3bLLTD6ZNrhUEOCixet9t0Ju+lRP2lhHeSeJr1N6e
	iTMg==
X-Gm-Message-State: APjAAAV25mZVSIBkwZfwlk/xT3Zd9OA8NmCE2ZgrWmsGK+/vhJmMP1fg
	5jYJBUX1mZcLbp0GC9JwlsKAwcjMNdcwFGlZXI8=
X-Google-Smtp-Source: APXvYqzaqOLsMupWFlJ5mpA43RUaU+zFNDSZnjdyCPVnZOy07mzLEl29+9R9SgFJ/uPKPQSpSsPQBXqGwBtdif/s2x0=
X-Received: by 2002:a19:110:: with SMTP id 16mr4667438lfb.63.1565147432812;
	Tue, 06 Aug 2019 20:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190806013506.38902-1-Qi.Chen@windriver.com>
In-Reply-To: <20190806013506.38902-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:10:22 -0300
Message-ID: <CADkTA4P-MphwB9Opj__Xto5itSmRhHhiOeQYsJRE+uLpASY4RQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2] .gitignore: ignore .patch files in top dir of meta-virtualization
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
X-List-Received-Date: Wed, 07 Aug 2019 03:10:35 -0000
Content-Type: multipart/alternative; boundary="000000000000c10411058f7e48ed"

--000000000000c10411058f7e48ed
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Aug 5, 2019 at 10:35 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 65feb82..45b1106 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -3,4 +3,5 @@ pyshtables.py
>  *.swp
>  *.orig
>  *.rej
> +/*.patch
>  *~
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c10411058f7e48ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, A=
ug 5, 2019 at 10:35 PM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
>Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.gitignore | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/.gitignore b/.gitignore<br>
index 65feb82..45b1106 100644<br>
--- a/.gitignore<br>
+++ b/.gitignore<br>
@@ -3,4 +3,5 @@ pyshtables.py<br>
=C2=A0*.swp<br>
=C2=A0*.orig<br>
=C2=A0*.rej<br>
+/*.patch<br>
=C2=A0*~<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000c10411058f7e48ed--
